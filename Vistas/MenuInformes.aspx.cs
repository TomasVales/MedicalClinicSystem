using System;
using Entidades;

namespace Vistas
{
    public partial class MenuInformes : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                Label1.Text = "Bienvenido, " + usuario.NombreUsuario;
            }
        }

        protected void btnInforme1_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informe1.aspx");
        }

        protected void btnInforme2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Informe2.aspx");

        }
    }
}