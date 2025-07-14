using Entidades;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace Datos
{
    public class TurnoDatos
    {
        public bool ExisteTurno(int idMedico, DateTime fecha, TimeSpan hora)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = "SELECT COUNT(*) FROM Turno WHERE IdMedico = @idMedico AND Fecha = @fecha AND Hora = @hora";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@idMedico", idMedico);
                cmd.Parameters.AddWithValue("@fecha", fecha.Date);
                cmd.Parameters.AddWithValue("@hora", hora);

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public bool AgregarTurno(Turno t)
        {
            AccesoDatos accesoDatos = new AccesoDatos();

            try
            {
                accesoDatos.AbrirConexion();

                string query = @"INSERT INTO Turno (IdMedico, IdPaciente,Fecha,Hora,Estado,ObservacionConsulta)
                                VALUES(@IDMedico,@IdPaciente,@Fecha,@Hora,@Estado,@ObservacionesConsulta)";

                SqlCommand cmd = new SqlCommand(query, accesoDatos.ObtenerConexion());

                cmd.Parameters.AddWithValue("@IDMedico", t.IdMedico);
                cmd.Parameters.AddWithValue("@IdPaciente", t.IdPaciente);
                cmd.Parameters.AddWithValue("@Fecha", t.Fecha);
                cmd.Parameters.AddWithValue("@Hora", t.Hora);
                cmd.Parameters.AddWithValue("@Estado", "Presente");
                cmd.Parameters.AddWithValue("@ObservacionesConsulta", DBNull.Value);
               

                cmd.ExecuteNonQuery();
                return true;

            }
            catch (Exception ex)
            {
                throw new Exception("Erorr al asignar turno" + ex.Message);
            }
            finally
            {
                accesoDatos.CerrarConexion();
            }
            
        }

        public List<Turno> ListarPorFechas(DateTime desde, DateTime hasta)
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = "SELECT * FROM Turno WHERE Fecha >= @desde AND Fecha <= @hasta";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@desde", desde);
                cmd.Parameters.AddWithValue("@hasta", hasta);

                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    Turno t = new Turno();
                    t.IdMedico = lector["IdMedico"] != DBNull.Value ? (int)lector["IdMedico"] : 0;
                    t.IdMedico = (int)lector["IdMedico"];
                    t.IdPaciente = (int)lector["IdPaciente"];
                    t.Fecha = (DateTime)lector["Fecha"];
                    t.Hora = (TimeSpan)lector["Hora"];
                    t.Estado = lector["Estado"].ToString();
                    t.ObservacionConsulta = lector["ObservacionConsulta"] != DBNull.Value ? lector["ObservacionConsulta"].ToString() : "";
                    lista.Add(t);
                }
                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
       /* public List<ResumenAsistencia> ListarResumenAsistencias(DateTime desde, DateTime hasta)
        {
            List<ResumenAsistencia> lista = new List<ResumenAsistencia>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"
            SELECT P.Nombre AS NombrePaciente, P.Apellido AS ApellidoPaciente, COUNT(*) AS CantidadAsistencias
            FROM Turno T
            INNER JOIN Paciente P ON T.IdPaciente = P.IdPaciente
            WHERE T.Fecha BETWEEN @desde AND @hasta AND T.Estado = 'Presente'
            GROUP BY P.Nombre, P.Apellido
            ORDER BY CantidadAsistencias DESC";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@desde", desde);
                cmd.Parameters.AddWithValue("@hasta", hasta);

                SqlDataReader lector = cmd.ExecuteReader();
                while (lector.Read())
                {
                    ResumenAsistencia resumen = new ResumenAsistencia
                    {
                        NombrePaciente = lector["NombrePaciente"].ToString(),
                        ApellidoPaciente = lector["ApellidoPaciente"].ToString(),
                        CantidadAsistencias = (int)lector["CantidadAsistencias"]
                    };
                    lista.Add(resumen);
                }

                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }*/
        public ResumenAsistencia ObtenerResumenAsistenciaDetallado(DateTime desde, DateTime hasta)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"
            SELECT P.Nombre, P.Apellido, T.Estado
            FROM Turno T
            INNER JOIN Paciente P ON T.IdPaciente = P.IdPaciente
            WHERE T.Fecha BETWEEN @desde AND @hasta";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@desde", desde);
                cmd.Parameters.AddWithValue("@hasta", hasta);

                SqlDataReader lector = cmd.ExecuteReader();

                ResumenAsistencia resumen = new ResumenAsistencia();

                while (lector.Read())
                {
                    resumen.Total++;
                    string nombreCompleto = lector["Nombre"] + " " + lector["Apellido"];
                    string estado = lector["Estado"].ToString();

                    if (estado == "Presente")
                    {
                        resumen.Presentes++;
                        resumen.PacientesPresentes.Add(nombreCompleto);
                    }
                    else
                    {
                        resumen.Ausentes++;
                        resumen.PacientesAusentes.Add(nombreCompleto);
                    }
                }

                return resumen;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public List<TurnosPorEspecialidad> ListarAgrupadosPorEspecialidad(DateTime desde, DateTime hasta)
        {
            List<TurnosPorEspecialidad> lista = new List<TurnosPorEspecialidad>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                // Consulta SQL con filtro por fecha
                string query = @"
            SELECT E.NombreEspecialidad AS Especialidad, COUNT(*) AS Cantidad
            FROM Turno T
            INNER JOIN Medico M ON T.IdMedico = M.IdMedico
            INNER JOIN Especialidad E ON M.IdEspecialidad = E.IdEspecialidad
            WHERE T.Fecha BETWEEN @desde AND @hasta
            GROUP BY E.NombreEspecialidad";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@desde", desde);
                cmd.Parameters.AddWithValue("@hasta", hasta);

                SqlDataReader lector = cmd.ExecuteReader();

                while (lector.Read())
                {
                    TurnosPorEspecialidad tpe = new TurnosPorEspecialidad();
                    tpe.NombreEspecialidad = lector["Especialidad"].ToString();
                    tpe.CantidadTurnos = (int)lector["Cantidad"];
                    lista.Add(tpe);
                }

                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public List<Turno> ListarTurnosPorMedico(int idMedico, DateTime? fecha, string estado)
        {
            List<Turno> lista = new List<Turno>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"
            SELECT T.IdTurno, T.IdMedico, T.IdPaciente, T.Fecha, T.Hora,
                   T.Estado, T.ObservacionConsulta, P.Nombre AS NombrePaciente
            FROM Turno T
            INNER JOIN Paciente P ON T.IdPaciente = P.IdPaciente
            WHERE T.IdMedico = @idMedico
              AND (@fecha IS NULL OR T.Fecha = @fecha)
              AND (@estado IS NULL OR T.Estado = @estado)
            ORDER BY T.Fecha, T.Hora";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@idMedico", idMedico);
                cmd.Parameters.AddWithValue("@fecha", (object)fecha ?? DBNull.Value);
                cmd.Parameters.AddWithValue("@estado", (object)estado ?? DBNull.Value);

                SqlDataReader lector = cmd.ExecuteReader();

                while (lector.Read())
                {
                    Turno turno = new Turno();
                    turno.IdTurno = (int)lector["IdTurno"];
                    turno.IdMedico = (int)lector["IdMedico"];
                    turno.IdPaciente = (int)lector["IdPaciente"];
                    turno.Fecha = (DateTime)lector["Fecha"];
                    turno.Hora = (TimeSpan)lector["Hora"];
                    turno.Estado = lector["Estado"].ToString();
                    turno.ObservacionConsulta = lector["ObservacionConsulta"] != DBNull.Value ? lector["ObservacionConsulta"].ToString() : "";
                    turno.NombrePaciente = lector["NombrePaciente"].ToString();

                    lista.Add(turno);
                }

                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public bool ActualizarEstadoYObservaciones(Turno turno)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string validarQuery = "SELECT COUNT(*) FROM Turno WHERE IdTurno = @id";
                SqlCommand validarCmd = new SqlCommand(validarQuery, conexion);
                validarCmd.Parameters.AddWithValue("@id", turno.IdTurno);

                int existe = Convert.ToInt32(validarCmd.ExecuteScalar());
                if (existe == 0) return false;

                string actualizarQuery = "UPDATE Turno SET Estado = @estado, ObservacionConsulta = @obs WHERE IdTurno = @id";
                SqlCommand actualizarCmd = new SqlCommand(actualizarQuery, conexion);
                actualizarCmd.Parameters.AddWithValue("@estado", turno.Estado);
                actualizarCmd.Parameters.AddWithValue("@obs", turno.ObservacionConsulta);
                actualizarCmd.Parameters.AddWithValue("@id", turno.IdTurno);

                int filas = actualizarCmd.ExecuteNonQuery();
                return filas > 0;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public bool TurnoDentroDelHorario(int idMedico, TimeSpan horaTurno)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = "SELECT HorarioAtencion FROM Medico WHERE IdMedico = @idMedico";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@idMedico", idMedico);

                string horarioStr = cmd.ExecuteScalar()?.ToString();

                if (!string.IsNullOrEmpty(horarioStr))
                {
                    string[] partes = horarioStr.Split(new string[] { " a " }, StringSplitOptions.None);
                    if (partes.Length == 2 &&
                        TimeSpan.TryParse(partes[0], out TimeSpan horaInicio) &&
                        TimeSpan.TryParse(partes[1], out TimeSpan horaFin))
                    {
                        TimeSpan finTurno = horaTurno.Add(TimeSpan.FromHours(1));
                        return horaTurno >= horaInicio && finTurno <= horaFin;
                    }
                }

                return false; 
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }


    }
}
