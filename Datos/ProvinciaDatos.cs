using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class ProvinciaDatos
    {
        public List<Provincia> ObtenerProvincias()
        {
            List<Provincia> lista = new List<Provincia>();
            AccesoDatos acceso = new AccesoDatos();

            try
            {
                acceso.AbrirConexion();
                string query = "SELECT IdProvincia, NombreProvincia FROM Provincia";
                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                SqlDataReader reader = cmd.ExecuteReader();

                while (reader.Read())
                {
                    Provincia p = new Provincia();
                    p.Id = Convert.ToInt32(reader["IdProvincia"]);
                    p.Nombre = reader["NombreProvincia"].ToString();
                    lista.Add(p);
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
