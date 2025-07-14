using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocio
{
    public class LocalidadNegocio
    {
        private LocalidadDatos datos = new LocalidadDatos();

        public List<Localidad> ObtenerLocalidades(int idProvincia)
        {
            return datos.ObtenerLocalidadesPorProvincia(idProvincia);
        }
    }
}
