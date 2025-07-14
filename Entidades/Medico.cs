using System;

namespace Entidades
{
    public class Medico
    {
        public int IdMedico { get; set; }
        public string Legajo { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Sexo { get; set; }
        public string Nacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }
        public string DiasAtencion { get; set; }
        public string HorarioAtencion { get; set; }
        public int IdProvincia { get; set; }
        public int IdLocalidad { get; set; }
        public int IdEspecialidad { get; set; }

        public string Usuario { get; set; }
        public Provincia Provincia { get; set; }
        public Localidad Localidad { get; set; }
        public Especialidad Especialidad { get; set; }

        public string Contrasena { get; set; }
        public string NombreCompleto
        {
            get { return $"{Apellido}, {Nombre}"; }
        }

    }
}
