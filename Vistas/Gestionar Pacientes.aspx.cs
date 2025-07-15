using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class Gestionar_Pacientes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
            if (!IsPostBack)
            {
                CargarProvinciasFiltro();
                CargarProvincias();
                CargarSexos();
                GridPacientes.Visible = false;



                if (Session["usuario"] != null)
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    lblMensaje.Text = "Bienvenido, " + usuario.NombreUsuario;
                }
            }
        }

        protected void btAgregar_Click(object sender, EventArgs e)
        {
            if (!ValidarCampos())   
                return;
            PacienteNegocio pacienteNegocio = new PacienteNegocio();
            if (pacienteNegocio.ExisteDni(TxtDNI.Text.Trim()))
            {
                lblMensaje.Text = "Ya existe un paciente con ese DNI.";
                return;
            }

            Paciente paciente = new Paciente
            {
                DNI = TxtDNI.Text,
                Nombre = txtNombre.Text,
                Apellido = txtApellido.Text,
                Sexo = ddlSexo.SelectedItem.Text,
                Nacionalidad = txtNacionalidad.Text,
                FechaNacimiento = Convert.ToDateTime(txtFechaNacimiento.Text),
                Direccion = txtDireccion.Text,
                CorreoElectronico = txtEmail.Text,
                Telefono = txtTelefono.Text,
                Provincia = new Provincia { Id = int.Parse(ddlProvincia.SelectedValue) },
                Localidad = new Localidad { Id = int.Parse(ddlLocalidad.SelectedValue) }
            };

            try
            {
                PacienteNegocio negocio = new PacienteNegocio();
                negocio.AgregarPaciente(paciente);

                lblMensaje.Text = "Paciente agregado exitosamente.";
                LimpiarCampos();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al agregar paciente: " + ex.Message;
            }
        }

        private void CargarProvincias() 
        {
            ProvinciaNegocio negocio = new ProvinciaNegocio();
            ddlProvincia.DataSource = negocio.ObtenerProvincias();
            ddlProvincia.DataTextField = "Nombre";
            ddlProvincia.DataValueField = "Id";
            ddlProvincia.DataBind();
            ddlProvincia.Items.Insert(0, new ListItem("Seleccione una provincia", "0"));
        }

        private void CargarLocalidades(int idProvincia)
        {
            LocalidadNegocio negocio = new LocalidadNegocio();
            ddlLocalidad.DataSource = negocio.ObtenerLocalidades(idProvincia);
            ddlLocalidad.DataTextField = "Nombre";
            ddlLocalidad.DataValueField = "Id";
            ddlLocalidad.DataBind();
            ddlLocalidad.Items.Insert(0, new ListItem("Seleccione una localidad", "0"));
        }

        protected void ddlProvincia_SelectedIndexChanged(object sender, EventArgs e)
        {
            int idProvincia = int.Parse(ddlProvincia.SelectedValue);
            CargarLocalidades(idProvincia);
        }

        private void CargarSexos()
        {
            ddlSexo.Items.Clear();
            ddlSexo.Items.Add("Masculino");
            ddlSexo.Items.Add("Femenino");
            ddlSexo.Items.Insert(0, new ListItem("Seleccione un sexo", ""));
        }

        private void LimpiarCampos()
        {
            TxtDNI.Text = "";
            txtNombre.Text = "";
            txtApellido.Text = "";
            txtNacionalidad.Text = "";
            txtFechaNacimiento.Text = "";
            txtDireccion.Text = "";
            txtEmail.Text = "";
            txtTelefono.Text = "";
            ddlSexo.ClearSelection();
            ddlLocalidad.ClearSelection();
        }

        private bool ValidarCampos()
        {
            if (string.IsNullOrWhiteSpace(TxtDNI.Text) ||
                string.IsNullOrWhiteSpace(txtNombre.Text) ||
                string.IsNullOrWhiteSpace(txtApellido.Text) ||
                ddlSexo.SelectedIndex == -1 ||
                string.IsNullOrWhiteSpace(txtNacionalidad.Text) ||
                string.IsNullOrWhiteSpace(txtFechaNacimiento.Text) ||
                string.IsNullOrWhiteSpace(txtDireccion.Text) ||
                ddlLocalidad.SelectedIndex == -1 ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtTelefono.Text))
            {
                lblMensaje.Text = "Por favor complete todos los campos obligatorios.";
                return false;
            }

            return true;
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        private void CargarGrillaPacientes()
        {
            PacienteNegocio negocio = new PacienteNegocio();
            List<Paciente> lista = negocio.ObtenerTodos();
            GridPacientes.DataSource = lista;
            GridPacientes.DataBind();
        }

        protected void btnLIstar_Click(object sender, EventArgs e)
        {
            if (GridPacientes.Visible)
            {

                GridPacientes.Visible = false;
                btnLIstar.Text = "Listar";
            }
            else
            {

                CargarGrillaPacientes();
                GridPacientes.Visible = true;
                btnLIstar.Text = "Ocultar Lista";
            }
        }

        protected void GridPacientes_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridPacientes.EditIndex = e.NewEditIndex;
            CargarGrillaPacientes();
        }

        protected void GridPacientes_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                GridViewRow row = GridPacientes.Rows[e.RowIndex];
                string dni = ((Label)row.FindControl("lblDNI")).Text;

                PacienteNegocio neg = new PacienteNegocio();
                Paciente paciente = neg.BuscarPaciente(dni);

                if (paciente != null)
                {
                    neg.EliminarPaciente(paciente.IdPaciente);
                    lblMensaje.Text = "Paciente eliminado correctamente.";
                    lblMensaje.ForeColor = System.Drawing.Color.Green;
                }
                else
                {
                    lblMensaje.Text = "No se encontró el paciente a eliminar.";
                    lblMensaje.ForeColor = System.Drawing.Color.OrangeRed;
                }

                CargarGrillaPacientes();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al eliminar paciente: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridPacientes_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void GridPacientes_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                GridViewRow row = GridPacientes.Rows[e.RowIndex];
                string dni = ((Label)row.FindControl("lblDNI")).Text;

                PacienteNegocio neg = new PacienteNegocio();
                Paciente paciente = neg.BuscarPaciente(dni);

                paciente.Nombre = ((TextBox)row.FindControl("txtNombreEdit")).Text;
                paciente.Apellido = ((TextBox)row.FindControl("txtApellidoEdit")).Text;
                paciente.Sexo = ((TextBox)row.FindControl("txtSexoEdit")).Text;
                paciente.Nacionalidad = ((TextBox)row.FindControl("txtNacionalidadEdit")).Text;
                paciente.Direccion = ((TextBox)row.FindControl("txtDireccionEdit")).Text;
                paciente.CorreoElectronico = ((TextBox)row.FindControl("txtEmailEdit")).Text;
                paciente.Telefono = ((TextBox)row.FindControl("txtTelefonoEdit")).Text;
                paciente.Provincia = new Provincia { Id = int.Parse(((DropDownList)row.FindControl("ddlProvinciaEdit")).SelectedValue) };
                paciente.Localidad = new Localidad { Id = int.Parse(((DropDownList)row.FindControl("ddlLocalidadEdit")).SelectedValue) };

                neg.ModificarPaciente(paciente);

                lblMensaje.Text = "Paciente modificado correctamente.";
                lblMensaje.ForeColor = System.Drawing.Color.Green;

                GridPacientes.EditIndex = -1;
                CargarGrillaPacientes();
            }
            catch (Exception ex)
            {
                lblMensaje.Text = "Error al modificar paciente: " + ex.Message;
                lblMensaje.ForeColor = System.Drawing.Color.Red;
            }
        }

        protected void GridPacientes_RowDataBound(object sender, GridViewRowEventArgs e)
        {
           
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                foreach (Control control in e.Row.Controls)
                {
                    foreach (Control inner in ((TableCell)control).Controls)
                    {
                        if (inner is LinkButton btn && btn.CommandName == "Delete")
                        {
                            btn.OnClientClick = "return confirm('¿Estás seguro que querés eliminar este paciente?');";
                            break;
                        }
                    }
                }
            }

            
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowState.HasFlag(DataControlRowState.Edit))
            {
                ProvinciaNegocio negocioprovincia = new ProvinciaNegocio();
                LocalidadNegocio negocioLocalidad = new LocalidadNegocio();

                DropDownList ddlProvincia = (DropDownList)e.Row.FindControl("ddlProvinciaEdit");
                DropDownList ddlLocalidad = (DropDownList)e.Row.FindControl("ddlLocalidadEdit");

                ddlProvincia.DataSource = negocioprovincia.ObtenerProvincias();
                ddlProvincia.DataTextField = "Nombre";
                ddlProvincia.DataValueField = "Id";
                ddlProvincia.DataBind();

                string idProvincia = DataBinder.Eval(e.Row.DataItem, "Provincia.Id").ToString();
                if (ddlProvincia.Items.FindByValue(idProvincia) != null)
                    ddlProvincia.SelectedValue = idProvincia;

                ddlLocalidad.DataSource = negocioLocalidad.ObtenerLocalidades(Convert.ToInt32(idProvincia));
                ddlLocalidad.DataTextField = "Nombre";
                ddlLocalidad.DataValueField = "Id";
                ddlLocalidad.DataBind();

                string idLocalidad = DataBinder.Eval(e.Row.DataItem, "Localidad.Id").ToString();
                if (ddlLocalidad.Items.FindByValue(idLocalidad) != null)
                    ddlLocalidad.SelectedValue = idLocalidad;
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

        protected void GridPacientes_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridPacientes.EditIndex = -1;
            CargarGrillaPacientes(); 
        }

        protected void btnBuscarFiltrar_Click(object sender, EventArgs e)
        {
            string texto = txtBuscar.Text.Trim();
            string sexo = ddlFiltroSexo.SelectedValue;
            string idProvincia = ddlFiltroProvincia.SelectedValue;

            PacienteNegocio logica = new PacienteNegocio();
            GridPacientes.DataSource = logica.BuscarFiltrar(texto, sexo, idProvincia);
            GridPacientes.DataBind();
        }
        private void CargarProvinciasFiltro()
        {
            ProvinciaNegocio provinciaNegocio = new ProvinciaNegocio();
            var provincias = provinciaNegocio.ObtenerProvincias();

            ddlFiltroProvincia.Items.Clear();
            ddlFiltroProvincia.Items.Add(new ListItem("Todas", "")); // Opción por defecto

            foreach (var provincia in provincias)
            {
                ddlFiltroProvincia.Items.Add(new ListItem(provincia.Nombre, provincia.Id.ToString()));
            }
        }

        protected void GridPacientes_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridPacientes.PageIndex = e.NewPageIndex;
            CargarGrillaPacientes(); 
        }
    }
}
