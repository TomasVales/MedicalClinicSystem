using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocio
{
    public class ProvinciaNegocio
    {
        private ProvinciaDatos datos = new ProvinciaDatos();

        public List<Provincia> ObtenerProvincias()
        {
            return datos.ObtenerProvincias();
        }
    }
}
