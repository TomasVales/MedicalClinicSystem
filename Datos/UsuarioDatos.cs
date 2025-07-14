using System.Data.SqlClient;
using Entidades;

namespace Datos
{
    public class UsuarioDatos
    {
        public Usuario Login(string nombreUsuario, string contraseña)
        {
            AccesoDatos acceso = new AccesoDatos();
            Usuario u = null;

            try
            {
                acceso.AbrirConexion();

                string query = "SELECT IdUsuario, NombreUsuario, Contraseña, TipoUsuario FROM Usuario WHERE NombreUsuario = @user AND Contraseña = @pass";
                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                cmd.Parameters.AddWithValue("@user", nombreUsuario);
                cmd.Parameters.AddWithValue("@pass", contraseña);

                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    u = new Usuario
                    {
                        IdUsuario = (int)reader["IdUsuario"],
                        NombreUsuario = reader["NombreUsuario"].ToString(),
                        Contraseña = reader["Contraseña"].ToString(),
                        TipoUsuario = reader["TipoUsuario"].ToString()
                    };
                }
            }
            finally
            {
                acceso.CerrarConexion();
            }

            return u;
        }

        public bool ExisteUsuario(string nombreUsuario)
        {
            AccesoDatos acceso = new AccesoDatos();
            try
            {
                acceso.AbrirConexion();
                string query = "SELECT COUNT(*) FROM Usuario WHERE NombreUsuario = @usuario";
                SqlCommand cmd = new SqlCommand(query, acceso.ObtenerConexion());
                cmd.Parameters.AddWithValue("@usuario", nombreUsuario);

                int count = (int)cmd.ExecuteScalar();
                return count > 0;
            }
            finally
            {
                acceso.CerrarConexion();
            }
        }

    }
}
