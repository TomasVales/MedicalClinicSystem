using System;
using System.Web.UI;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ValidationSettings.UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        }

        protected void btnIniciarSesion_Click(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            string contrasena = txtContrasena.Text;

            UsuarioNegocio negocio = new UsuarioNegocio();
            Usuario u = negocio.Login(usuario, contrasena);

            if (u != null)
            {
                Session["Usuario"] = u;

                if (u.TipoUsuario == "Admin")
                {
                    Response.Redirect("MenuAdmin.aspx");
                }
                else if (u.TipoUsuario == "Medico")
                {
                    MedicoNegocio medicoNegocio = new MedicoNegocio();
                    int idMedico = medicoNegocio.ObtenerIdMedicoPorIdUsuario(u.IdUsuario);

                    if (idMedico != -1)
                    {
                        Session["IdMedico"] = idMedico;
                        Session["Usuario"] = u;
                        Response.Redirect("MenuMedico.aspx");
                    }
                    else
                    {
                        lblMensaje.Text = "No se encontró información del médico.";
                    }
                }
                else
                {
                    lblMensaje.Text = "Tipo de usuario no reconocido.";
                }
            }
            else
            {
                lblMensaje.Text = "Credenciales incorrectas o usuario no autorizado.";
            }
        }
    }
}