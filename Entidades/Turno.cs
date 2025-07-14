using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class Turno
    {
        public int IdTurno { get; set; }  
        public int IdMedico { get; set; }
        public int IdPaciente { get; set; }
        public DateTime Fecha { get; set; }

        public TimeSpan Hora { get; set; }

        public int IdEspecialidad { get; set; }
        public string Estado { get; set; }

        public string ObservacionConsulta { get; set; }

        public int IdUsuario { get; set; }
        public string NombrePaciente { get; set; }  // NUEVO

    }
}
