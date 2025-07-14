using System;
using System.Collections.Generic;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class Informe1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                Label1.Text = "Bienvenido, " + usuario.NombreUsuario;
            }
        }

     

        protected void btnGenerarInforme_Click1(object sender, EventArgs e)
        {
            DateTime desde, hasta;
            lblResultadoInforme.Text = "";

            if (!DateTime.TryParse(txtDesdeFecha.Text, out desde) || !DateTime.TryParse(txtHastaFecha.Text, out hasta))
            {
                lblResultadoInforme.Text = "Error: Ingrese fechas válidas.";
                return;
            }

            if (desde > hasta)
            {
                lblResultadoInforme.Text = "Error: La fecha 'Desde' no puede ser mayor a 'Hasta'.";
                return;
            }

            try
            {
                var negocio = new TurnoNegocio();
                var resumen = negocio.ObtenerResumenDetallado(desde, hasta);

                if (resumen.Total == 0)
                {
                    lblResultadoInforme.Text = "No hay turnos en el período seleccionado.";
                    return;
                }

                double porcentajePresente = (resumen.Presentes * 100.0) / resumen.Total;
                double porcentajeAusente = (resumen.Ausentes * 100.0) / resumen.Total;

                string resultado = $"<b>Informe del {desde:dd/MM/yyyy} al {hasta:dd/MM/yyyy}</b><br/>" +
                                   $"✅ <b>{porcentajePresente:F2}%</b> asistieron<br/>" +
                                   $"❌ <b>{porcentajeAusente:F2}%</b> estuvieron ausentes<br/><br/>";

                resultado += "<b>Pacientes presentes:</b><ul>";
                foreach (var p in resumen.PacientesPresentes)
                    resultado += $"<li>{p}</li>";
                resultado += "</ul>";

                resultado += "<b>Pacientes ausentes:</b><ul>";
                foreach (var p in resumen.PacientesAusentes)
                    resultado += $"<li>{p}</li>";
                resultado += "</ul>";

                lblResultadoInforme.Text = resultado;
            }
            catch (Exception ex)
            {
                lblResultadoInforme.Text = "Error al generar el informe: " + ex.Message;
            }
        }
    }
}