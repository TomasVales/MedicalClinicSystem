using System;
using Entidades;

namespace Vistas
{
    public partial class MenuMedico : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                Label1.Text =  usuario.NombreUsuario;
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("ListadoTurnos.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AsignarTurno.aspx");
        }
    }
}