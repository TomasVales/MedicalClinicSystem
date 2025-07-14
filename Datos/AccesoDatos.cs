using System.Data.SqlClient;

namespace Datos
{
    public class AccesoDatos
    {
        private SqlConnection conexion;

        public void AbrirConexion()
        {
            string cadenaConexion = @"Server=localhost\SQLEXPRESS;Database=ClinicaMedica;Trusted_Connection=True;";
            conexion = new SqlConnection(cadenaConexion);
            conexion.Open();
        }

        public SqlConnection ObtenerConexion()
        {
            return conexion;
        }

        public bool EjecutarAccion(SqlCommand cmd)
        {
            AbrirConexion();
            cmd.Connection = conexion;

            int filasAfectadas = cmd.ExecuteNonQuery();
            CerrarConexion();

            return filasAfectadas > 0;
        }

        public void CerrarConexion()
        {
            if (conexion != null && conexion.State == System.Data.ConnectionState.Open)
            {
                conexion.Close();
            }
        }
    }
}
