using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocio
{
    public class EspecialidadNegocio
    {
        public List<Especialidad> ObtenerTodas()
        {
            EspecialidadDatos datos = new EspecialidadDatos();
            return datos.ObtenerTodas();
        }
    }
}
