using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class LocalidadDatos
    {
        public List<Localidad> ObtenerLocalidadesPorProvincia(int idProvincia)
        {
            List<Localidad> lista = new List<Localidad>();
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.AbrirConexion();

                string query = "SELECT IdLocalidad, NombreLocalidad FROM Localidad WHERE IdProvincia = @idProvincia";
                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                cmd.Parameters.AddWithValue("@idProvincia", idProvincia);
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Localidad loc = new Localidad();
                    loc.Id = Convert.ToInt32(reader["IdLocalidad"]);
                    loc.Nombre = reader["NombreLocalidad"].ToString();
                    lista.Add(loc);
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


