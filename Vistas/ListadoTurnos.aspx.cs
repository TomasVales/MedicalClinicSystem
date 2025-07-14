using System;
using Entidades;
using System.Web.UI.WebControls;

namespace Vistas
{
    public partial class ListadoTurnos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DropDownList1.Items.Clear();
                DropDownList1.Items.Add("Todos"); 
                DropDownList1.Items.Add("Presente");
                DropDownList1.Items.Add("Ausente");

                CargarTurnos();
                if (Session["usuario"] != null)
                {
                    Usuario usuario = (Usuario)Session["usuario"];
                    Label1.Text = usuario.NombreUsuario;
                }
            }
        }

        private void CargarTurnos()
        {
            TurnoNegocio negocio = new TurnoNegocio();

           if (Session["IdMedico"] == null)
{
    Response.Redirect("Login.aspx");
    return;
}

int idMedico = Convert.ToInt32(Session["IdMedico"]);

            DateTime? fecha = null;
            if (DateTime.TryParse(TextBox2.Text, out DateTime f))
                fecha = f;

            string estado = DropDownList1.SelectedValue;
            if (estado == "Todos") estado = null;

            GridView1.DataSource = negocio.ListadoTurnos(idMedico, fecha, estado);
            GridView1.DataBind();
        }

        protected void GridView1_SelectedIndexChanged(object sender)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            CargarTurnos();
        }

        

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            CargarTurnos();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            CargarTurnos();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int idTurno = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            GridViewRow fila = GridView1.Rows[e.RowIndex];
            DropDownList ddlEstado = (DropDownList)fila.FindControl("ddlEstado");
            TextBox txtObservaciones = (TextBox)fila.FindControl("txtObservaciones");

            string nuevoEstado = ddlEstado.SelectedValue;
            string nuevaObservacion = txtObservaciones.Text;

            TurnoNegocio negocio = new TurnoNegocio();
            Turno t = new Turno
            {
                IdTurno = idTurno,
                Estado = nuevoEstado,
                ObservacionConsulta = nuevaObservacion
            };

            bool actualizado = negocio.ActualizarEstadoYObservaciones(t);

            GridView1.EditIndex = -1;
            CargarTurnos();

            lblResultado.Visible = true;
            lblResultado.Text = actualizado
                ? "Turno actualizado correctamente."
                : "Error al actualizar el turno.";
        }
    }
}