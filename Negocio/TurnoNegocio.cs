using Datos;
using Entidades;
using System;
using System.Collections.Generic;

public class TurnoNegocio
{
    TurnoDatos datos = new TurnoDatos();

    public bool ExisteTurno(int idMedico, DateTime fecha, TimeSpan hora)
    {
        return datos.ExisteTurno(idMedico, fecha, hora);
    }

    public bool agregar(Turno turno)
    {
        TurnoDatos datos = new TurnoDatos();
        if (!datos.TurnoDentroDelHorario(turno.IdMedico, turno.Hora))
        {
            throw new Exception("El turno no se encuentra dentro del horario de atención del médico.");
        }
        return datos.AgregarTurno(turno);
    }

   /* public List<ResumenAsistencia> ObtenerInformeAsistencias(DateTime desde, DateTime hasta)
    {
        return datos.ListarResumenAsistencias(desde, hasta);
    }*/

    public ResumenAsistencia ObtenerResumenDetallado(DateTime desde, DateTime hasta)
    {
        return datos.ObtenerResumenAsistenciaDetallado(desde, hasta);
    }
    public List<TurnosPorEspecialidad> CantidadTurnosPorEspecialidad(DateTime desde, DateTime hasta)
    {
        List<TurnosPorEspecialidad> lista = datos.ListarAgrupadosPorEspecialidad(desde, hasta);

        int total = 0;
        foreach (var item in lista)
            total += item.CantidadTurnos;

        foreach (var item in lista)
            item.Porcentaje = total > 0 ? (item.CantidadTurnos * 100.0) / total : 0;

        return lista;
    }

    public List<Turno> ListadoTurnos(int idMedico, DateTime? fecha, string estado)
    {

      
        return datos.ListarTurnosPorMedico(idMedico,fecha,estado); 
    }

    public bool ActualizarEstadoYObservaciones(Turno turno)
    {
        return datos.ActualizarEstadoYObservaciones(turno);
    }

}
