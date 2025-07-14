using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class PacienteDatos
    {
        public void Agregar(Paciente paciente)
        {
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.AbrirConexion();

                string query = @"INSERT INTO Paciente 
                                (DNI, Nombre, Apellido, Sexo, Nacionalidad, FechaNacimiento, Direccion, CorreoElectronico, Telefono, IdLocalidad, IdProvincia)
                                VALUES 
                                (@DNI, @Nombre, @Apellido, @Sexo, @Nacionalidad, @FechaNacimiento, @Direccion, @CorreoElectronico, @Telefono, @IdLocalidad, @IdProvincia)";

                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());

                cmd.Parameters.AddWithValue("@DNI", paciente.DNI);
                cmd.Parameters.AddWithValue("@Nombre", paciente.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", paciente.Apellido);
                cmd.Parameters.AddWithValue("@Sexo", paciente.Sexo);
                cmd.Parameters.AddWithValue("@Nacionalidad", paciente.Nacionalidad);
                cmd.Parameters.AddWithValue("@FechaNacimiento", paciente.FechaNacimiento);
                cmd.Parameters.AddWithValue("@Direccion", paciente.Direccion);
                cmd.Parameters.AddWithValue("@CorreoElectronico", paciente.CorreoElectronico);
                cmd.Parameters.AddWithValue("@Telefono", paciente.Telefono);
                cmd.Parameters.AddWithValue("@IdLocalidad", paciente.Localidad.Id);
                cmd.Parameters.AddWithValue("@IdProvincia", paciente.Provincia.Id);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al insertar paciente: " + ex.Message);
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

        public Paciente BuscarPorDNI(string dni)
        {
            AccesoDatos acceso = new AccesoDatos();
            acceso.AbrirConexion();

            string query = @"SELECT p.*, pr.NombreProvincia, l.NombreLocalidad 
                             FROM Paciente p
                             INNER JOIN Provincia pr ON p.IdProvincia = pr.IdProvincia
                             INNER JOIN Localidad l ON p.IdLocalidad = l.IdLocalidad
                             WHERE p.DNI = @dni AND p.Activo = 1";

            SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
            cmd.Parameters.AddWithValue("@dni", dni);

            SqlDataReader reader = cmd.ExecuteReader();

            if (reader.Read())
            {
                return new Paciente
                {
                    IdPaciente = Convert.ToInt32(reader["IdPaciente"]),
                    DNI = reader["DNI"].ToString(),
                    Nombre = reader["Nombre"].ToString(),
                    Apellido = reader["Apellido"].ToString(),
                    Sexo = reader["Sexo"].ToString(),
                    Nacionalidad = reader["Nacionalidad"].ToString(),
                    FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                    Direccion = reader["Direccion"].ToString(),
                    CorreoElectronico = reader["CorreoElectronico"].ToString(),
                    Telefono = reader["Telefono"].ToString(),
                    Activo = Convert.ToBoolean(reader["Activo"]),
                    Provincia = new Provincia
                    {
                        Id = Convert.ToInt32(reader["IdProvincia"]),
                        Nombre = reader["NombreProvincia"].ToString()
                    },
                    Localidad = new Localidad
                    {
                        Id = Convert.ToInt32(reader["IdLocalidad"]),
                        Nombre = reader["NombreLocalidad"].ToString()
                    }
                };
            }

            return null;
        }
        public List<Paciente> BuscarFiltrarPacientes(string texto, string sexo, string idProvincia)
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.AbrirConexion();
                SqlConnection conexion = acceso.ObtenerConexion();

                string query = @"
            SELECT p.IdPaciente, p.DNI, p.Nombre, p.Apellido, p.Sexo, p.Nacionalidad, 
                   p.FechaNacimiento, p.Direccion, p.CorreoElectronico, p.Telefono,
                   pr.IdProvincia, pr.NombreProvincia,
                   l.IdLocalidad, l.NombreLocalidad
            FROM Paciente p
            INNER JOIN Provincia pr ON p.IdProvincia = pr.IdProvincia
            INNER JOIN Localidad l ON p.IdLocalidad = l.IdLocalidad
            WHERE p.Activo = 1";

                // Agregamos filtros dinámicamente
                if (!string.IsNullOrEmpty(texto))
                {
                    query += " AND (p.Nombre LIKE @texto OR p.Apellido LIKE @texto OR p.DNI LIKE @texto)";
                }

                if (!string.IsNullOrEmpty(sexo))
                {
                    query += " AND p.Sexo = @sexo";
                }

                if (!string.IsNullOrEmpty(idProvincia))
                {
                    query += " AND p.IdProvincia = @idProvincia";
                }

                SqlCommand cmd = new SqlCommand(query, conexion);

                if (!string.IsNullOrEmpty(texto))
                    cmd.Parameters.AddWithValue("@texto", "%" + texto + "%");

                if (!string.IsNullOrEmpty(sexo))
                    cmd.Parameters.AddWithValue("@sexo", sexo);

                if (!string.IsNullOrEmpty(idProvincia))
                    cmd.Parameters.AddWithValue("@idProvincia", idProvincia);

                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Paciente p = new Paciente
                    {
                        IdPaciente = (int)reader["IdPaciente"],
                        DNI = reader["DNI"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Sexo = reader["Sexo"].ToString(),
                        Nacionalidad = reader["Nacionalidad"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                        Direccion = reader["Direccion"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        Provincia = new Provincia
                        {
                            Id = (int)reader["IdProvincia"],
                            Nombre = reader["NombreProvincia"].ToString()
                        },
                        Localidad = new Localidad
                        {
                            Id = (int)reader["IdLocalidad"],
                            Nombre = reader["NombreLocalidad"].ToString()
                        }
                    };

                    lista.Add(p);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al filtrar/buscar pacientes: " + ex.Message);
            }
            finally
            {
                acceso.CerrarConexion();
            }

            return lista;
        }

        public void Modificar(Paciente paciente)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.AbrirConexion();

                string query = @"UPDATE Paciente SET 
                                Nombre = @Nombre, 
                                Apellido = @Apellido, 
                                Sexo = @Sexo, 
                                Nacionalidad = @Nacionalidad, 
                                FechaNacimiento = @FechaNacimiento, 
                                Direccion = @Direccion, 
                                CorreoElectronico = @CorreoElectronico, 
                                Telefono = @Telefono, 
                                IdProvincia = @IdProvincia,
                                IdLocalidad = @IdLocalidad
                                WHERE DNI = @DNI";

                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                cmd.Parameters.AddWithValue("@DNI", paciente.DNI);
                cmd.Parameters.AddWithValue("@Nombre", paciente.Nombre);
                cmd.Parameters.AddWithValue("@Apellido", paciente.Apellido);
                cmd.Parameters.AddWithValue("@Sexo", paciente.Sexo);
                cmd.Parameters.AddWithValue("@Nacionalidad", paciente.Nacionalidad);
                cmd.Parameters.AddWithValue("@FechaNacimiento", paciente.FechaNacimiento);
                cmd.Parameters.AddWithValue("@Direccion", paciente.Direccion);
                cmd.Parameters.AddWithValue("@CorreoElectronico", paciente.CorreoElectronico);
                cmd.Parameters.AddWithValue("@Telefono", paciente.Telefono);
                cmd.Parameters.AddWithValue("@IdProvincia", paciente.Provincia.Id);
                cmd.Parameters.AddWithValue("@IdLocalidad", paciente.Localidad.Id);

                cmd.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
                throw new Exception("Error al modificar paciente: " + ex.Message);
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public bool ExisteDni(string dni)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.AbrirConexion();
                SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM Paciente WHERE DNI = @dni AND Activo = 1", acceso.ObtenerConexion());
                cmd.Parameters.AddWithValue("@dni", dni);
                int cantidad = (int)cmd.ExecuteScalar();
                return cantidad > 0;
            }
            catch (Exception ex)
            {
                throw new Exception("Error al verificar existencia de DNI: " + ex.Message);
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }
        public bool Eliminar(int idPaciente)
        {
            AccesoDatos datos = new AccesoDatos();
            SqlCommand cmd = new SqlCommand("UPDATE Paciente SET Activo = 0 WHERE IdPaciente = @id");
            cmd.Parameters.AddWithValue("@id", idPaciente);

            return datos.EjecutarAccion(cmd);
        }

       
        public List<Paciente> ObtenerTodos()
        {
            List<Paciente> lista = new List<Paciente>();
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.AbrirConexion();
                SqlConnection conexion = acceso.ObtenerConexion();

                string query = @"
                    SELECT p.IdPaciente, p.DNI, p.Nombre, p.Apellido, p.Sexo, p.Nacionalidad, 
                    p.FechaNacimiento, p.Direccion, p.CorreoElectronico, p.Telefono,
                    pr.IdProvincia, pr.NombreProvincia,
                    l.IdLocalidad, l.NombreLocalidad
                    FROM Paciente p
                    INNER JOIN Provincia pr ON p.IdProvincia = pr.IdProvincia
                    INNER JOIN Localidad l ON p.IdLocalidad = l.IdLocalidad
                    WHERE p.Activo = 1";

                SqlCommand cmd = new SqlCommand(query, conexion);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Paciente p = new Paciente
                    {
                        IdPaciente = (int)reader["IdPaciente"],
                        DNI = reader["DNI"].ToString(),
                        Nombre = reader["Nombre"].ToString(),
                        Apellido = reader["Apellido"].ToString(),
                        Sexo = reader["Sexo"].ToString(),
                        Nacionalidad = reader["Nacionalidad"].ToString(),
                        FechaNacimiento = Convert.ToDateTime(reader["FechaNacimiento"]),
                        Direccion = reader["Direccion"].ToString(),
                        CorreoElectronico = reader["CorreoElectronico"].ToString(),
                        Telefono = reader["Telefono"].ToString(),
                        Provincia = new Provincia
                        {
                            Id = (int)reader["IdProvincia"],
                            Nombre = reader["NombreProvincia"].ToString()
                        },
                        Localidad = new Localidad
                        {
                            Id = (int)reader["IdLocalidad"],
                            Nombre = reader["NombreLocalidad"].ToString()
                        }
                    };

                    lista.Add(p);
                }
            }
            catch (Exception ex)
            {
                throw new Exception("Error al obtener los pacientes"+ ex.Message);
            }
            finally
            {
                acceso.CerrarConexion();
            }

            return lista;
        }

    }
}
