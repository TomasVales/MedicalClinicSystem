using System.Collections.Generic;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class EspecialidadDatos
    {
        public List<Especialidad> ObtenerTodas()
        {
            List<Especialidad> lista = new List<Especialidad>();
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.AbrirConexion();
                string query = "SELECT IdEspecialidad, NombreEspecialidad FROM Especialidad";
                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Especialidad esp = new Especialidad
                    {
                        Id = (int)reader["IdEspecialidad"],
                        Nombre = reader["NombreEspecialidad"].ToString()
                    };
                    lista.Add(esp);
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
