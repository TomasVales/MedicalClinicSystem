using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Entidades
{
    public class ResumenAsistencia
    {
        public int Total { get; set; }
        public int Presentes { get; set; }
        public int Ausentes { get; set; }

        public List<string> PacientesPresentes { get; set; } = new List<string>();
        public List<string> PacientesAusentes { get; set; } = new List<string>();
    }
}
