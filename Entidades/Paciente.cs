using System;

namespace Entidades
{
    public class Paciente
    {
        public int IdPaciente { get; set; }
        public string DNI { get; set; }
        public string Nombre { get; set; }
        public string Apellido { get; set; }
        public string Sexo { get; set; }
        public string Nacionalidad { get; set; }
        public DateTime FechaNacimiento { get; set; }
        public string Direccion { get; set; }
        public string CorreoElectronico { get; set; }
        public string Telefono { get; set; }
        public Provincia Provincia { get; set; }
        public Localidad Localidad { get; set; }
        public bool Activo { get; set; }
        
    }
}