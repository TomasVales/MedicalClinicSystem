using System;
using System.Collections.Generic;
using System.Net.Mime;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class GestionarMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                CargarProvincias();
                CargarEspecialidades();
                CargarEspecialidadesFiltro();
                CargarProvinciaFiltro();
                CargarHoras();


                GridMedicos.Visible = false;
                if (Session["usuario"] != null)
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    lblMensaje.Text = "Bienvenido, " + usuario.NombreUsuario;
                }
            }
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if (ValidarCampos())
            {

                try
                {
                    Medico medico = new Medico
                    {
                        Legajo = txtLegajo.Text.Trim(),
                        DNI = txtDNI.Text.Trim(),
                        Nombre = txtNombre.Text.Trim(),
                        Apellido = txtApellido.Text.Trim(),
                        Sexo = ddlSexo.SelectedValue,
                        Nacionalidad = txtNacionalidad.Text.Trim(),
                        FechaNacimiento = DateTime.Parse(txtFechaNacimiento.Text),
                        Direccion = txtDireccion.Text.Trim(),
                        CorreoElectronico = txtEmail.Text.Trim(),
                        Telefono = txtTelefono.Text.Trim(),
                        DiasAtencion = DdlAtencionDias.SelectedValue,
                        HorarioAtencion = ddlHora.SelectedValue,
                        IdProvincia = int.Parse(ddlProvincia.SelectedValue),
                        IdLocalidad = int.Parse(ddlLocalidad.SelectedValue),
                        IdEspecialidad = int.Parse(ddlEspecialidad.SelectedValue),
                        Usuario = txtUsuario.Text.Trim(),
                        Contrasena = txtContrasena.Text.Trim()
                    };



                    MedicoNegocio negocio = new MedicoNegocio();
                    UsuarioNegocio negocioUsuario = new UsuarioNegocio();

                    if (negocioUsuario.ExisteUsuario(txtUsuario.Text.Trim()))
                    {
                        lblMensaje.ForeColor = System.Drawing.Color.Red;
                        lblMensaje.Text = "Ya existe un usuario con ese nombre.";
                        return;
                    }

                    negocio.AgregarMedico(medico);

                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    lblMensaje.Text = "Médico agregado correctamente.";
                    LimpiarCampos();
                }
                catch (Exception ex)
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Error al agregar el médico: " + ex.Message;
                }

            }
        }

        protected void btnBuscar_Click(object sender, EventArgs e)
        {
            string legajo = txtLegajo.Text.Trim();
            MedicoNegocio negocio = new MedicoNegocio();

            if (string.IsNullOrEmpty(legajo))
            {

                CargarGrillaMedicos();
                GridMedicos.Visible = true;
                btnLIstar.Text = "Ocultar Lista";
                lblMensaje.Text = "Se ha quitado el filtro. Mostrando todos los pacientes.";
                lblMensaje.ForeColor = System.Drawing.Color.Blue;
            }
            else
            {
                Medico medico = negocio.BuscarMedicoPorLegajo(legajo);

                if (medico != null)
                {
                    List<Medico> lista = new List<Medico> { medico };
                    GridMedicos.DataSource = lista;
                    GridMedicos.DataBind();
                    GridMedicos.Visible = true;
                    btnLIstar.Text = "Ocultar Lista";
                    lblMensaje.Text = "Mostrando resultado para el legajo ingresado.";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                    LimpiarCampos();
                }
                else
                {
                    GridMedicos.Visible = false;
                    lblMensaje.Text = "No se encontró ningún paciente con ese legajo.";
                    lblMensaje.ForeColor = System.Drawing.Color.OrangeRed;
                }
            }
        }




       

        

        private bool ValidarCampos()
        {
            if (string.IsNullOrWhiteSpace(txtDNI.Text) ||
                string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtApellido.Text) ||
                string.IsNullOrWhiteSpace(txtLegajo.Text) ||
                string.IsNullOrWhiteSpace(txtUsuario.Text) ||
                string.IsNullOrWhiteSpace(txtContrasena.Text))
            {
                lblMensaje.Text = "Debe completar todos los campos obligatorios.";
                return false;
            }


            return true;
        }

        private void LimpiarCampos()
        {
            
            txtLegajo.Text = "";
            txtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            ddlSexo.SelectedIndex = 0;
            txtNacionalidad.Text = "";
            txtFechaNacimiento.Text = "";
            txtDireccion.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            ddlHora.SelectedIndex = 0;    
            DdlAtencionDias.SelectedIndex = 0;
            txtUsuario.Text = "";
            txtContrasena.Text = "";
            ddlLocalidad.SelectedIndex = 0;
            ddlLocalidad.SelectedIndex = 0;
            ddlFiltroEspecialidad.SelectedIndex = 0;
        }
        private void CargarProvincias()
        {
            ProvinciaNegocio negocio = new ProvinciaNegocio();
            ddlProvincia.DataSource = negocio.ObtenerProvincias();
            ddlProvincia.DataTextField = "Nombre";
            ddlProvincia.DataValueField = "Id";
            ddlProvincia.DataBind();

            ddlProvincia.Items.Insert(0, new ListItem("-- Seleccione una provincia --", "0"));

        }
        private void CargarProvinciaFiltro()
        {
            ProvinciaNegocio negocio = new ProvinciaNegocio();
            ddlFiltroProvincia.DataSource = negocio.ObtenerProvincias();
            ddlFiltroProvincia.DataTextField = "Nombre";
            ddlFiltroProvincia.DataValueField = "Id";
            ddlFiltroProvincia.DataBind();

            ddlFiltroProvincia.Items.Insert(0, new ListItem("-- Seleccione una provincia --", "0"));
        }
        private void CargarEspecialidades()
        {
            var negocio = new EspecialidadNegocio();
            var lista = negocio.ObtenerTodas();

            ddlEspecialidad.DataSource = lista;
            ddlEspecialidad.DataTextField = "Nombre";
            ddlEspecialidad.DataValueField = "Id";
            ddlEspecialidad.DataBind();

            ddlEspecialidad.Items.Insert(0, new ListItem("Seleccione...", ""));
        }
        private void CargarEspecialidadesFiltro()
        {
            var negocio = new EspecialidadNegocio();
            var lista = negocio.ObtenerTodas();

            ddlFiltroEspecialidad.DataSource = lista;
            ddlFiltroEspecialidad.DataTextField = "Nombre";
            ddlFiltroEspecialidad.DataValueField = "Id";
            ddlFiltroEspecialidad.DataBind();

            ddlFiltroEspecialidad.Items.Insert(0, new ListItem("Seleccione...", ""));
        }

        protected void ddlProvincia_SelectedIndexChanged1(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);

            CargarLocalidades(idProvincia);
        }
        private void CargarLocalidades(int idProvincia)
        {
            LocalidadNegocio localidadNegocio = new LocalidadNegocio();
            ddlLocalidad.DataSource = localidadNegocio.ObtenerLocalidades(idProvincia);
            ddlLocalidad.DataTextField = "Nombre";
            ddlLocalidad.DataValueField = "Id";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("-- Seleccione una localidad --", "0"));
        }
        private void CargarGrillaMedicos()
        {
            MedicoNegocio negocio = new MedicoNegocio();
            List<Medico> lista = negocio.ObtenerTodos();
            GridMedicos.DataSource = lista;
            GridMedicos.DataBind();
        }

        protected void btnLIstar_Click(object sender, EventArgs e)
        {
            if (GridMedicos.Visible)
            {
                GridMedicos.Visible = false;
                btnLIstar.Text = "Listar Médicos";
            }
            else
            {
                CargarGrillaMedicos();
                GridMedicos.Visible = true;
                btnLIstar.Text = "Ocultar Médicos";
            }
        }
        protected void GridMedicos_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridMedicos.EditIndex = e.NewEditIndex;
            CargarGrillaMedicos();
        }

        protected void GridMedicos_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridMedicos.EditIndex = -1;
            CargarGrillaMedicos();
        }

        protected void GridMedicos_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                int idMedico = Convert.ToInt32(GridMedicos.DataKeys[e.RowIndex].Value);
                MedicoNegocio negocio = new MedicoNegocio();
                negocio.EliminarMedico(idMedico);
                CargarGrillaMedicos();

                // Mensaje de eliminación
                lblMensaje.Text = "El médico fue eliminado correctamente.";
                lblMensaje.ForeColor = System.Drawing.Color.DarkRed;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al eliminar el médico: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridMedicos_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridMedicos.Rows[e.RowIndex];
                int idMedico = Convert.ToInt32(GridMedicos.DataKeys[e.RowIndex].Value);

                Medico medico = new Medico
                {
                    IdMedico = idMedico,
                    Legajo = ((TextBox)row.FindControl("txtLegajoEdit")).Text,
                    DNI = ((TextBox)row.FindControl("txtDniEdit")).Text,
                    Nombre = ((TextBox)row.FindControl("txtNombreEdit")).Text,
                    Apellido = ((TextBox)row.FindControl("txtApellidoEdit")).Text,
                    Sexo = ((DropDownList)row.FindControl("ddlSexoEdit")).SelectedValue,
                    Nacionalidad = ((TextBox)row.FindControl("txtNacionalidadEdit")).Text,
                    FechaNacimiento = Convert.ToDateTime(((TextBox)row.FindControl("txtFechaNacimientoEdit")).Text),
                    Direccion = ((TextBox)row.FindControl("txtDireccionEdit")).Text,
                    CorreoElectronico = ((TextBox)row.FindControl("txtEmailEdit")).Text,
                    Telefono = ((TextBox)row.FindControl("txtTelefonoEdit")).Text,
                    DiasAtencion = ((DropDownList)row.FindControl("DdlAtencionDias")).SelectedValue,
                    HorarioAtencion = ((DropDownList)row.FindControl("ddlHora")).SelectedValue,
                    Usuario = ((TextBox)row.FindControl("txtUsuarioEdit")).Text,
                    Contrasena = ((TextBox)row.FindControl("txtContrasenaEdit")).Text,
                    Provincia = new Provincia { Id = int.Parse(((DropDownList)row.FindControl("ddlProvinciaEdit")).SelectedValue) },
                    Localidad = new Localidad { Id = int.Parse(((DropDownList)row.FindControl("ddlLocalidadEdit")).SelectedValue) },
                    Especialidad = new Especialidad { Id = int.Parse(((DropDownList)row.FindControl("ddlEspecialidadEdit")).SelectedValue) }
                };

                MedicoNegocio negocio = new MedicoNegocio();

                UsuarioNegocio negocioUsuario = new UsuarioNegocio();

                string nuevoUsuario = ((TextBox)row.FindControl("txtUsuarioEdit")).Text.Trim();

                if (negocioUsuario.ExisteUsuario(nuevoUsuario))
                {
                    lblMensaje.ForeColor = System.Drawing.Color.Red;
                    lblMensaje.Text = "Ya existe un usuario con ese nombre.";
                    return;
                }
                negocio.ModificarMedico(medico);
                GridMedicos.EditIndex = -1;
                CargarGrillaMedicos();

                // Mensaje de confirmación
                lblMensaje.Text = "El médico fue modificado correctamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al modificar el médico: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridMedicos_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow &&
      (e.Row.RowState == DataControlRowState.Normal || e.Row.RowState == DataControlRowState.Alternate))
            {
                foreach (Control control in e.Row.Cells[e.Row.Cells.Count - 1].Controls)
                {
                    if (control is LinkButton btn && btn.CommandName == "Delete")
                    {
                        btn.OnClientClick = "return confirm('¿Estás seguro que deseas eliminar este médico?');";
                    }
                }
            }

            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
               


                LocalidadNegocio ubicacionNegocio = new LocalidadNegocio();
                ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
                EspecialidadNegocio especialidadNegocio = new EspecialidadNegocio();

                DropDownList ddlProvincia = (DropDownList)e.Row.FindControl("ddlProvinciaEdit");
                ddlProvincia.DataSource = provinciaNegocio.ObtenerProvincias();
                ddlProvincia.DataTextField = "Nombre";
                ddlProvincia.DataValueField = "Id";
                ddlProvincia.DataBind();

                string idProvincia = DataBinder.Eval(e.Row.DataItem, "Provincia.Id").ToString();
                if (ddlProvincia.Items.FindByValue(idProvincia) != null)
                    ddlProvincia.SelectedValue = idProvincia;


                
                DropDownList ddlLocalidad = (DropDownList)e.Row.FindControl("ddlLocalidadEdit");
                ddlLocalidad.DataSource = ubicacionNegocio.ObtenerLocalidades(Convert.ToInt32(idProvincia));
                ddlLocalidad.DataTextField = "Nombre";
                ddlLocalidad.DataValueField = "Id";
                ddlLocalidad.DataBind();

                string idLocalidad = DataBinder.Eval(e.Row.DataItem, "Localidad.Id").ToString();
                if (ddlLocalidad.Items.FindByValue(idLocalidad) != null)
                    ddlLocalidad.SelectedValue = idLocalidad;

                DropDownList ddlEspecialidad = (DropDownList)e.Row.FindControl("ddlEspecialidadEdit");
                ddlEspecialidad.DataSource = especialidadNegocio.ObtenerTodas();
                ddlEspecialidad.DataTextField = "Nombre";
                ddlEspecialidad.DataValueField = "Id";
                ddlEspecialidad.DataBind();

                string idEspecialidad = DataBinder.Eval(e.Row.DataItem, "Especialidad.Id").ToString();
                if (ddlEspecialidad.Items.FindByValue(idEspecialidad) != null)
                    ddlEspecialidad.SelectedValue = idEspecialidad;

               
                DropDownList ddlSexo = (DropDownList)e.Row.FindControl("ddlSexoEdit");
                string sexo = DataBinder.Eval(e.Row.DataItem, "Sexo").ToString();
                if (ddlSexo != null && ddlSexo.Items.FindByText(sexo) != null)
                    ddlSexo.SelectedValue = sexo;
            }
        }
        protected void ddlProvinciaEdit_SelectedIndexChanged(object sender, EventArgs e)
{
    DropDownList ddlProvincia = (DropDownList)sender;
    GridViewRow row = (GridViewRow)ddlProvincia.NamingContainer;
    DropDownList ddlLocalidad = (DropDownList)row.FindControl("ddlLocalidadEdit");

    int idProvincia = int.Parse(ddlProvincia.SelectedValue);

    LocalidadNegocio negocio = new LocalidadNegocio();
    ddlLocalidad.DataSource = negocio.ObtenerLocalidades(idProvincia);
    ddlLocalidad.DataTextField = "Nombre";
    ddlLocalidad.DataValueField = "Id";
    ddlLocalidad.DataBind();
}

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            string especialidad = null;
            string dias = null;
            string provincia = null;

           
            if (ddlFiltroEspecialidad.SelectedIndex > 0)
            {
                especialidad = ddlFiltroEspecialidad.SelectedItem.Text;
            }

            // Verificar si se ingresaron días de atención
            if (!string.IsNullOrWhiteSpace(txtFiltroDiasAtencion.Text))
            {
                dias = txtFiltroDiasAtencion.Text.Trim();
            }

           
            if (ddlFiltroProvincia.SelectedIndex > 0)
            {
                provincia = ddlFiltroProvincia.SelectedItem.Text;
            }

            // Llamar al negocio para filtrar los médicos
            MedicoNegocio negocioMedico = new MedicoNegocio();
            List<Medico> lista = negocioMedico.FiltrarMedicos(especialidad, dias, provincia);
            GridMedicos.DataSource = lista;
            GridMedicos.DataBind();
        }
        private void CargarHoras()
        {
            List<string> horas = new List<string>()
            {
                "08:00 a 12:00", "12:00 a 16:00", "16:00 a 20:00"
            };

            ddlHora.DataSource = horas;
            ddlHora.DataBind();
            ddlHora.Items.Insert(0, new ListItem("-- Seleccione hora --", ""));
        }

        protected void GridMedicos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridMedicos.PageIndex = e.NewPageIndex;
            CargarGrillaMedicos();
        }
    }
}