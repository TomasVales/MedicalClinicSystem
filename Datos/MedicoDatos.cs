using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class MedicoDatos
    {
        public bool ExisteDNIoLegajo(string dni, string legajo)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = "SELECT COUNT(*) FROM Medico WHERE DNI = @dni OR Legajo = @legajo";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@dni", dni);
                cmd.Parameters.AddWithValue("@legajo", legajo);

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public Medico BuscarPorDNI(string dni)
        {
            Medico medico = null;
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"
        SELECT 
            m.IdMedico, m.Legajo, m.DNI, m.Nombre AS NombreMedico, m.Apellido, m.Sexo, 
            m.Nacionalidad, m.FechaNacimiento, m.Direccion, m.CorreoElectronico, m.Telefono, 
            m.DiasAtencion, m.HorarioAtencion, m.IdUsuario, m.Activo,
            p.IdProvincia, p.NombreProvincia,
            l.IdLocalidad, l.NombreLocalidad,
            e.IdEspecialidad, e.NombreEspecialidad
        FROM Medico m
        JOIN Provincia p ON m.IdProvincia = p.IdProvincia
        JOIN Localidad l ON m.IdLocalidad = l.IdLocalidad
        JOIN Especialidad e ON m.IdEspecialidad = e.IdEspecialidad
        WHERE m.DNI = @dni AND Activo = 1";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@dni", dni);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    medico = new Medico
                    {
                        IdMedico = (int)reader["IdMedico"],
                        Legajo = reader["Legajo"].ToString(),
                        DNI = reader["DNI"].ToString(),
                        Nombre = reader["NombreMedico"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Sexo = reader["Sexo"].ToString(),
                        Nacionalidad = reader["Nacionalidad"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                        Direccion = reader["Direccion"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        DiasAtencion = reader["DiasAtencion"].ToString(),
                        HorarioAtencion = reader["HorarioAtencion"].ToString(),
                        Usuario = null, 
                        Contrasena = null, 

                        Provincia = new Provincia
                        {
                            Id = (int)reader["IdProvincia"],
                            Nombre = reader["NombreProvincia"].ToString()
                        },
                        Localidad = new Localidad
                        {
                            Id = (int)reader["IdLocalidad"],
                            Nombre = reader["NombreLocalidad"].ToString()
                        },
                        Especialidad = new Especialidad
                        {
                            Id = (int)reader["IdEspecialidad"],
                            Nombre = reader["NombreEspecialidad"].ToString()
                        }
                    };
                }

                return medico;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }


        public Medico BuscarPorLegajo(string legajo)
        {
            Medico medico = null;
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"
        SELECT 
            m.IdMedico, m.Legajo, m.DNI, m.Nombre AS NombreMedico, m.Apellido, m.Sexo, 
            m.Nacionalidad, m.FechaNacimiento, m.Direccion, m.CorreoElectronico, m.Telefono, 
            m.DiasAtencion, m.HorarioAtencion, m.IdUsuario, m.Activo,
            p.IdProvincia, p.NombreProvincia,
            l.IdLocalidad, l.NombreLocalidad,
            e.IdEspecialidad, e.NombreEspecialidad,
            u.NombreUsuario, u.Contraseña
        FROM Medico m
        JOIN Provincia p ON m.IdProvincia = p.IdProvincia
        JOIN Localidad l ON m.IdLocalidad = l.IdLocalidad
        JOIN Especialidad e ON m.IdEspecialidad = e.IdEspecialidad
        JOIN Usuario u ON m.IdUsuario = u.IdUsuario
        WHERE m.Legajo = @legajo AND Activo = 1";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@legajo", legajo);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    medico = new Medico
                    {
                        IdMedico = (int)reader["IdMedico"],
                        Legajo = reader["Legajo"].ToString(),
                        DNI = reader["DNI"].ToString(),
                        Nombre = reader["NombreMedico"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Sexo = reader["Sexo"].ToString(),
                        Nacionalidad = reader["Nacionalidad"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                        Direccion = reader["Direccion"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        DiasAtencion = reader["DiasAtencion"].ToString(),
                        HorarioAtencion = reader["HorarioAtencion"].ToString(),
                        Usuario = reader["NombreUsuario"].ToString(),
                        Contrasena = reader["Contraseña"].ToString(),

                        Provincia = new Provincia
                        {
                            Id = (int)reader["IdProvincia"],
                            Nombre = reader["NombreProvincia"].ToString()
                        },
                        Localidad = new Localidad
                        {
                            Id = (int)reader["IdLocalidad"],
                            Nombre = reader["NombreLocalidad"].ToString()
                        },
                        Especialidad = new Especialidad
                        {
                            Id = (int)reader["IdEspecialidad"],
                            Nombre = reader["NombreEspecialidad"].ToString()
                        }
                    };
                }

                return medico;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public int ObtenerIdMedicoPorIdUsuario(int idUsuario)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = "SELECT IdMedico FROM Medico WHERE IdUsuario = @idUsuario";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@idUsuario", idUsuario);

                object resultado = cmd.ExecuteScalar();
                if (resultado != null)
                {
                    return Convert.ToInt32(resultado);
                }

                return -1; 
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public void Modificar(Medico medico)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;
            SqlTransaction transaccion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();
                transaccion = conexion.BeginTransaction();

                // 1. Actualizar USUARIO
                string queryUsuario = @"
            UPDATE Usuario SET 
                NombreUsuario = @NombreUsuario,
                Contraseña = @Contraseña
            WHERE IdUsuario = (SELECT IdUsuario FROM Medico WHERE IdMedico = @IdMedico)";
                SqlCommand cmdUsuario = new SqlCommand(queryUsuario, conexion, transaccion);
                cmdUsuario.Parameters.AddWithValue("@NombreUsuario", medico.Usuario);
                cmdUsuario.Parameters.AddWithValue("@Contraseña", medico.Contrasena);
                cmdUsuario.Parameters.AddWithValue("@IdMedico", medico.IdMedico);
                cmdUsuario.ExecuteNonQuery();

                // 2. Actualizar MÉDICO
                string queryMedico = @"
            UPDATE Medico SET
                Legajo = @Legajo,
                DNI = @DNI,
                Nombre = @Nombre,
                Apellido = @Apellido,
                Sexo = @Sexo,
                Nacionalidad = @Nacionalidad,
                FechaNacimiento = @FechaNacimiento,
                Direccion = @Direccion,
                CorreoElectronico = @CorreoElectronico,
                Telefono = @Telefono,
                DiasAtencion = @DiasAtencion,
                HorarioAtencion = @HorarioAtencion,
                IdProvincia = @IdProvincia,
                IdLocalidad = @IdLocalidad,
                IdEspecialidad = @IdEspecialidad
            WHERE IdMedico = @IdMedico";
                SqlCommand cmdMedico = new SqlCommand(queryMedico, conexion, transaccion);
                cmdMedico.Parameters.AddWithValue("@IdMedico", medico.IdMedico);
                cmdMedico.Parameters.AddWithValue("@Legajo", medico.Legajo);
                cmdMedico.Parameters.AddWithValue("@DNI", medico.DNI);
                cmdMedico.Parameters.AddWithValue("@Nombre", medico.Nombre);
                cmdMedico.Parameters.AddWithValue("@Apellido", medico.Apellido);
                cmdMedico.Parameters.AddWithValue("@Sexo", medico.Sexo);
                cmdMedico.Parameters.AddWithValue("@Nacionalidad", medico.Nacionalidad);
                cmdMedico.Parameters.AddWithValue("@FechaNacimiento", medico.FechaNacimiento);
                cmdMedico.Parameters.AddWithValue("@Direccion", medico.Direccion);
                cmdMedico.Parameters.AddWithValue("@CorreoElectronico", medico.CorreoElectronico);
                cmdMedico.Parameters.AddWithValue("@Telefono", medico.Telefono);
                cmdMedico.Parameters.AddWithValue("@DiasAtencion", medico.DiasAtencion);
                cmdMedico.Parameters.AddWithValue("@HorarioAtencion", medico.HorarioAtencion);
                cmdMedico.Parameters.AddWithValue("@IdProvincia", medico.Provincia.Id);
                cmdMedico.Parameters.AddWithValue("@IdLocalidad", medico.Localidad.Id);
                cmdMedico.Parameters.AddWithValue("@IdEspecialidad", medico.Especialidad.Id);

                cmdMedico.ExecuteNonQuery();
                transaccion.Commit();
            }
            catch (Exception)
            {
                if (transaccion != null)
                    transaccion.Rollback();
                throw;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public Medico BuscarPorId(int idMedico)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.AbrirConexion();
                string query = "SELECT * FROM Medico WHERE IdMedico = @IdMedico AND Activo = 1";
                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                cmd.Parameters.AddWithValue("@IdMedico", idMedico);

                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    Medico m = new Medico();
                    m.IdMedico = (int)reader["IdMedico"];
                    m.Nombre = reader["Nombre"].ToString();
                    m.Apellido = reader["Apellido"].ToString();
                    m.DiasAtencion = reader["DiasAtencion"].ToString();
                    // Podés cargar más campos si necesitás
                    return m;
                }

                return null;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public void AgregarMedico(Medico m)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;
            SqlTransaction transaccion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();
                transaccion = conexion.BeginTransaction();

                
                string queryUsuario = @"INSERT INTO Usuario (NombreUsuario, Contraseña, TipoUsuario) 
                                VALUES (@NombreUsuario, @Contraseña, @TipoUsuario);
                                SELECT SCOPE_IDENTITY();";
                SqlCommand cmdUsuario = new SqlCommand(queryUsuario, conexion, transaccion);
                cmdUsuario.Parameters.AddWithValue("@NombreUsuario", m.Usuario);
                cmdUsuario.Parameters.AddWithValue("@Contraseña", m.Contrasena);
                cmdUsuario.Parameters.AddWithValue("@TipoUsuario", "Medico");

                int idUsuarioGenerado = Convert.ToInt32(cmdUsuario.ExecuteScalar());

               
                string queryMedico = @"INSERT INTO Medico 
            (Legajo, DNI, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, CorreoElectronico, Telefono, DiasAtencion, HorarioAtencion, IdProvincia, IdLocalidad, IdEspecialidad, IdUsuario)
            VALUES 
            (@Legajo, @DNI, @Nombre, @Apellido, @Sexo, @Nacionalidad, @FechaNacimiento, @Direccion, @CorreoElectronico, @Telefono, @DiasAtencion, @HorarioAtencion, @IdProvincia, @IdLocalidad, @IdEspecialidad, @IdUsuario)";

                SqlCommand cmdMedico = new SqlCommand(queryMedico, conexion, transaccion);
                cmdMedico.Parameters.AddWithValue("@Legajo", m.Legajo);
                cmdMedico.Parameters.AddWithValue("@DNI", m.DNI);
                cmdMedico.Parameters.AddWithValue("@Nombre", m.Nombre);
                cmdMedico.Parameters.AddWithValue("@Apellido", m.Apellido);
                cmdMedico.Parameters.AddWithValue("@Sexo", m.Sexo);
                cmdMedico.Parameters.AddWithValue("@Nacionalidad", m.Nacionalidad);
                cmdMedico.Parameters.AddWithValue("@FechaNacimiento", m.FechaNacimiento);
                cmdMedico.Parameters.AddWithValue("@Direccion", m.Direccion);
                cmdMedico.Parameters.AddWithValue("@CorreoElectronico", m.CorreoElectronico);
                cmdMedico.Parameters.AddWithValue("@Telefono", m.Telefono);
                cmdMedico.Parameters.AddWithValue("@DiasAtencion", m.DiasAtencion);
                cmdMedico.Parameters.AddWithValue("@HorarioAtencion", m.HorarioAtencion);
                cmdMedico.Parameters.AddWithValue("@IdProvincia", m.IdProvincia);
                cmdMedico.Parameters.AddWithValue("@IdLocalidad", m.IdLocalidad);
                cmdMedico.Parameters.AddWithValue("@IdEspecialidad", m.IdEspecialidad);
                cmdMedico.Parameters.AddWithValue("@IdUsuario", idUsuarioGenerado);

                cmdMedico.ExecuteNonQuery();

                transaccion.Commit();
            }
            catch (Exception)
            {
                if (transaccion != null)
                    transaccion.Rollback();
                throw;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public bool EliminarMedico(int idMedico)
        {
            AccesoDatos datos = new AccesoDatos();
            SqlCommand cmd = new SqlCommand(
                "UPDATE Medico SET Activo = 0 WHERE IdMedico = @id"
            );
            cmd.Parameters.AddWithValue("@id", idMedico);
            return datos.EjecutarAccion(cmd);
        }

        public bool ExisteIdMedico(int idMedico)
        {
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = "SELECT COUNT(1) FROM Medico WHERE IdMedico = @id";
                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@id", idMedico);

                int cantidad = (int)cmd.ExecuteScalar();
                return cantidad > 0;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public List<Medico> ObtenerTodos()
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"SELECT 
                                 m.IdMedico, m.Legajo, m.DNI, m.Nombre, m.Apellido, m.Sexo, 
                                 m.Nacionalidad, m.FechaNacimiento, m.Direccion, m.CorreoElectronico, m.Telefono,
                                 p.IdProvincia, p.NombreProvincia AS Provincia,
                                 l.IdLocalidad, l.NombreLocalidad AS Localidad,
                                 e.IdEspecialidad, e.NombreEspecialidad AS Especialidad,
                                 u.NombreUsuario AS Usuario,
                                 m.DiasAtencion, m.HorarioAtencion
                                FROM Medico m
                                JOIN Provincia p ON m.IdProvincia = p.IdProvincia
                                JOIN Localidad l ON m.IdLocalidad = l.IdLocalidad
                                JOIN Especialidad e ON m.IdEspecialidad = e.IdEspecialidad
                                JOIN Usuario u ON m.IdUsuario = u.IdUsuario
                                WHERE m.Activo = 1";

                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Medico m = new Medico
                    {
                        IdMedico = (int)reader["IdMedico"],
                        Legajo = reader["Legajo"].ToString(),
                        DNI = reader["DNI"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Sexo = reader["Sexo"].ToString(),
                        Nacionalidad = reader["Nacionalidad"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                        Direccion = reader["Direccion"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        DiasAtencion = reader["DiasAtencion"].ToString(),
                        HorarioAtencion = reader["HorarioAtencion"].ToString(),
                        Usuario = reader["Usuario"].ToString(),

                        Provincia = new Provincia
                        {
                            Id = (int)reader["IdProvincia"],
                            Nombre = reader["Provincia"].ToString()
                        },
                        Localidad = new Localidad
                        {
                            Id = (int)reader["IdLocalidad"],
                            Nombre = reader["Localidad"].ToString()
                        },
                        Especialidad = new Especialidad
                        {
                            Id = (int)reader["IdEspecialidad"],
                            Nombre = reader["Especialidad"].ToString()
                        }
                    };

                    lista.Add(m);
                }
                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public List<Medico> ObtenerPorEspecialidad(int idEspecialidad)
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"SELECT IdMedico, Nombre, Apellido 
                         FROM Medico 
                         WHERE IdEspecialidad = @idEspecialidad AND Activo = 1";

                SqlCommand cmd = new SqlCommand(query, conexion);
                cmd.Parameters.AddWithValue("@idEspecialidad", idEspecialidad);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Medico m = new Medico
                    {
                        IdMedico = (int)reader["IdMedico"],
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString()
                    };
                    lista.Add(m);
                }

                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public List<Medico> FiltrarMedicos(string especialidad, string dias, string provincia)
        {
            List<Medico> lista = new List<Medico>();
            AccesoDatos acceso = new AccesoDatos();
            SqlConnection conexion = null;

            try
            {
                acceso.AbrirConexion();
                conexion = acceso.ObtenerConexion();

                string query = @"SELECT 
                         m.IdMedico, m.Legajo, m.DNI, m.Nombre, m.Apellido, m.Sexo, 
                         m.Nacionalidad, m.FechaNacimiento, m.Direccion, m.CorreoElectronico, m.Telefono,
                         p.IdProvincia, p.NombreProvincia AS Provincia,
                         l.IdLocalidad, l.NombreLocalidad AS Localidad,
                         e.IdEspecialidad, e.NombreEspecialidad AS Especialidad,
                         u.NombreUsuario AS Usuario,
                         m.DiasAtencion, m.HorarioAtencion
                        FROM Medico m
                        JOIN Provincia p ON m.IdProvincia = p.IdProvincia
                        JOIN Localidad l ON m.IdLocalidad = l.IdLocalidad
                        JOIN Especialidad e ON m.IdEspecialidad = e.IdEspecialidad
                        JOIN Usuario u ON m.IdUsuario = u.IdUsuario
                        WHERE m.Activo = 1";

                if (!string.IsNullOrEmpty(especialidad))
                    query += " AND e.NombreEspecialidad LIKE @especialidad";

                if (!string.IsNullOrEmpty(dias))
                    query += " AND m.DiasAtencion LIKE @dias";

                if (!string.IsNullOrEmpty(provincia))
                    query += " AND p.NombreProvincia LIKE @provincia";

                SqlCommand cmd = new SqlCommand(query, conexion);

                if (!string.IsNullOrEmpty(especialidad))
                    cmd.Parameters.AddWithValue("@especialidad", "%" + especialidad + "%");

                if (!string.IsNullOrEmpty(dias))
                    cmd.Parameters.AddWithValue("@dias", "%" + dias + "%");

                if (!string.IsNullOrEmpty(provincia))
                    cmd.Parameters.AddWithValue("@provincia", "%" + provincia + "%");

                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Medico m = new Medico
                    {
                        IdMedico = (int)reader["IdMedico"],
                        Legajo = reader["Legajo"].ToString(),
                        DNI = reader["DNI"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Sexo = reader["Sexo"].ToString(),
                        Nacionalidad = reader["Nacionalidad"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                        Direccion = reader["Direccion"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        DiasAtencion = reader["DiasAtencion"].ToString(),
                        HorarioAtencion = reader["HorarioAtencion"].ToString(),
                        Usuario = reader["Usuario"].ToString(),
                        Provincia = new Provincia
                        {
                            Id = (int)reader["IdProvincia"],
                            Nombre = reader["Provincia"].ToString()
                        },
                        Localidad = new Localidad
                        {
                            Id = (int)reader["IdLocalidad"],
                            Nombre = reader["Localidad"].ToString()
                        },
                        Especialidad = new Especialidad
                        {
                            Id = (int)reader["IdEspecialidad"],
                            Nombre = reader["Especialidad"].ToString()
                        }
                    };

                    lista.Add(m);
                }

                return lista;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

    }
}
