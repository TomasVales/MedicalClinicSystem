using System;
using System.Collections.Generic;
using Entidades;
using Negocio;

namespace Vistas
{
    public partial class Informe2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["usuario"] != null)
            {
                Usuario usuario = (Usuario)Session["usuario"];
                Label1.Text = "Bienvenido, " + usuario.NombreUsuario;
            }
        }
        

        protected void txtHastaFecha_TextChanged(object sender, EventArgs e)
        {

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
                TurnoNegocio turnos = new TurnoNegocio();
                List<TurnosPorEspecialidad> lista = turnos.CantidadTurnosPorEspecialidad(desde, hasta);
                if (lista == null || lista.Count == 0)
                {
                    lblResultadoInforme.Text = "No hay turnos asignados en ese período.";
                    return;
                }

                int totalTurnos = 0;
                foreach (var item in lista)
                    totalTurnos += item.CantidadTurnos;

                string resultado = $"<h3>Informe de Turnos por Especialidad</h3>";
                resultado += $"<b>Desde:</b> {desde:dd/MM/yyyy} - <b>Hasta:</b> {hasta:dd/MM/yyyy}<br/>";
                resultado += $"<b>Total de turnos:</b> {totalTurnos}<br/><br/>";

                resultado += "<table border='1' cellpadding='5' cellspacing='0' style='border-collapse:collapse; text-align:left;'>";
                resultado += "<tr style='background-color:#f2f2f2;'><th>Especialidad</th><th>Turnos</th><th>Porcentaje</th></tr>";

                foreach (var item in lista)
                {
                    resultado += $"<tr><td>{item.NombreEspecialidad}</td><td>{item.CantidadTurnos}</td><td>{item.Porcentaje:F2}%</td></tr>";
                }

                resultado += "</table>";

                lblResultadoInforme.Text = resultado;
            }
            catch (Exception ex)
            {
                lblResultadoInforme.Text = "Error al generar el informe: " + ex.Message;
            }

        }
    }
}