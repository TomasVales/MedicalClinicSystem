using System;
using System.Collections.Generic;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class AsignarTurno : Page
    {
        EspecialidadNegocio negocioEspecialidad = new EspecialidadNegocio();
        MedicoNegocio negocioMedico = new MedicoNegocio();
        PacienteNegocio negocioPaciente = new PacienteNegocio();

        

        protected void Page_Load(object sender, EventArgs e)
        {
            Usuario usuarioActual = Session["Usuario"] as Usuario;

            if(usuarioActual == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }
            lblUsuario.Text = usuarioActual.NombreUsuario;

            Page.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {

                CargarEspecialidades();
                CargarPacientes();
                CargarHoras();
                cvFecha.ValueToCompare = DateTime.Today.ToString("yyyy-MM-dd");
            }
        }
        private void CargarEspecialidades()
        {
            ddlEspecialidad.DataSource = negocioEspecialidad.ObtenerTodas();
            ddlEspecialidad.DataTextField = "Nombre";
            ddlEspecialidad.DataValueField = "Id";
            ddlEspecialidad.DataBind();
            ddlEspecialidad.Items.Insert(0, new ListItem("-- Seleccione --", "0"));
        }

        protected void ddlEspecialidad_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idEspecialidad = int.Parse(ddlEspecialidad.SelectedValue);
            ddlMedico.DataSource = negocioMedico.ObtenerPorEspecialidad(idEspecialidad);
            ddlMedico.DataTextField = "NombreCompleto";
            ddlMedico.DataValueField = "IdMedico";
            ddlMedico.DataBind();
        }

        private void CargarPacientes()
        {
            var pacientes = negocioPaciente.ObtenerTodos();

            if (pacientes != null & pacientes.Count > 0)
            {
                ddlPaciente.DataSource = pacientes;
                ddlPaciente.DataTextField = "Nombre";
                ddlPaciente.DataValueField = "IdPaciente";
                ddlPaciente.DataBind();
                ddlPaciente.Items.Insert(0, new ListItem("-- Seleccione paciente --", "0"));
                ddlPaciente.Enabled = true;
            }
            else
            {
                ddlPaciente.Items.Clear();
                ddlPaciente.Items.Add(new ListItem("No hay pacientes activos", "0"));
                ddlPaciente.Enabled = false;
                lblError.Text = "No hay pacientes activos disponibles.";
            }
        }

        private void CargarHoras()
        {
            List<string> horas = new List<string>()
            {
                "08:00", "09:00", "10:00", "11:00",
                "12:00", "13:00", "14:00", "15:00",
                "16:00", "17:00", "18:00", "19:00",
                "20:00"
            };

            ddlHora.DataSource = horas;
            ddlHora.DataBind();
            ddlHora.Items.Insert(0, new ListItem("-- Seleccione hora --", ""));
        }


        protected void btnAsignar_Click(object sender, EventArgs e)
        {
            if (ddlEspecialidad.SelectedValue == "0" || ddlMedico.SelectedValue == "0" || ddlPaciente.SelectedValue == "0" || string.IsNullOrWhiteSpace(txtFecha.Text) || string.IsNullOrWhiteSpace(ddlHora.SelectedValue))
            {
                lblError.Text = "Complete todos los campos antes de asignar un turno.";
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            int idMedico = int.Parse(ddlMedico.SelectedValue);
            int idPaciente = int.Parse(ddlPaciente.SelectedValue);
            DateTime fecha = DateTime.Parse(txtFecha.Text);
            TimeSpan hora = TimeSpan.Parse(ddlHora.SelectedValue);

            
            string diaSemana = fecha.ToString("dddd", new System.Globalization.CultureInfo("es-ES")).ToLower(); // ej: "lunes"
            MedicoNegocio medNeg = new MedicoNegocio();
            Medico medicoSeleccionado = medNeg.BuscarPorId(idMedico);

            if (medicoSeleccionado == null)
            {
                lblError.Text = "Error al recuperar los datos del médico.";
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string diaAtencion = medicoSeleccionado.DiasAtencion.ToLower().Trim();
            if (diaSemana != diaAtencion)
            {
                lblError.Text = $"El médico seleccionado solo atiende los días {medicoSeleccionado.DiasAtencion}.";
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            // Verificación de turno duplicado
            TurnoNegocio turnoNegocio = new TurnoNegocio();
            if (turnoNegocio.ExisteTurno(idMedico, fecha, hora))
            {
                lblError.Text = "Ya existe un turno asignado para ese médico en esa fecha y hora.";
                lblError.ForeColor = System.Drawing.Color.Red;
                return;
            }

            Usuario usuarioActual = Session["Usuario"] as Usuario;
            if (usuarioActual == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            // Crear y guardar el turno
            Turno turno = new Turno
            {
                IdMedico = idMedico,
                IdPaciente = idPaciente,
                Fecha = fecha,
                Hora = hora,
                IdEspecialidad = int.Parse(ddlEspecialidad.SelectedValue),
                IdUsuario = usuarioActual.IdUsuario
            };

            try
            {
                TurnoNegocio TurnoNeg = new TurnoNegocio();
                TurnoNeg.agregar(turno);

                lblError.ForeColor = System.Drawing.Color.Green;
                lblError.Text = "Turno asignado correctamente.";
                LimpiarCampos();
            }
            catch (Exception ex)
            {
                if (ex.Message.Contains("horario"))
                {
                    lblError.Text = "El horario seleccionado no está dentro del horario de atención del médico.";
                }
                lblError.Text = "Error al asignar turno: " + ex.Message;
                lblError.ForeColor = System.Drawing.Color.Red;
            }
        }

        private void LimpiarCampos()
        {
            ddlEspecialidad.SelectedIndex = 0;

            ddlMedico.Items.Clear();
            ddlMedico.Items.Insert(0, new ListItem("-- Seleccione --", "0"));

            ddlPaciente.SelectedIndex = 0;

            txtFecha.Text = string.Empty;
            ddlHora.SelectedIndex = 0;


        }


    }
}
