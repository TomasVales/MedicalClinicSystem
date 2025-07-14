using System;
using Entidades;

namespace Vistas
{
    public partial class MenuAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                Label1.Text = "Bienvenido, " + usuario.NombreUsuario;
            }
            else
            {
                Response.Redirect("Login.aspx");
            }
        }

        protected void BtnPacientes_Click(object sender, EventArgs e)
        {
            Response.Redirect("Gestionar Pacientes.aspx");
        }

        protected void btnAsignacionTurnos_Click(object sender, EventArgs e)
        {
            Response.Redirect("AsignarTurno.aspx");
        }

        protected void btnInformes_Click(object sender, EventArgs e)
        {
            Response.Redirect("MenuInformes.aspx");
        }

        protected void btnMedicos_Click(object sender, EventArgs e)
        {
            Response.Redirect("GestionarMedico.aspx");
        }
    }
}
