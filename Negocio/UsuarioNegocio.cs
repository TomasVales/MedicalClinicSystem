using System;
using Datos;
using Entidades;

namespace Negocio
{
    public class UsuarioNegocio
    {
        private UsuarioDatos datos = new UsuarioDatos();

        public Usuario Login(string nombreUsuario, string contraseña)
        {

            if (string.IsNullOrWhiteSpace(nombreUsuario) || string.IsNullOrWhiteSpace(contraseña))
                throw new ArgumentException("Debe completar usuario y contraseña.");

            return datos.Login(nombreUsuario, contraseña);
        }

        public bool ExisteUsuario(string nombreUsuario)
        {
            return datos.ExisteUsuario(nombreUsuario);
        }
    }
}
