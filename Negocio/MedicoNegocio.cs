using System;
using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocio
{
    public class MedicoNegocio
    {
        MedicoDatos datos = new MedicoDatos();

        public void AgregarMedico(Medico m)
        {
            if (datos.ExisteDNIoLegajo(m.DNI, m.Legajo)) throw new Exception("Ya existe un médico con ese DNI o Legajo.");

            datos.AgregarMedico(m);
        }

        public Medico BuscarMedicoPorDNI(string dni)
        {
            return datos.BuscarPorDNI(dni);
        }

        public Medico BuscarMedicoPorLegajo(string legajo)
        {
            return datos.BuscarPorLegajo(legajo); // mismo código que BuscarPorDNI pero cambia el WHERE
        }
        public void ModificarMedico(Medico medico)
        {
            MedicoDatos datos = new MedicoDatos();
            if (datos.ExisteIdMedico(medico.IdMedico))
            {
                datos.Modificar(medico);
            }
            else
            {
                throw new Exception("No se encontró el Id del médico.");
            }
        }
        public Medico BuscarPorId(int idMedico)
        {
            return datos.BuscarPorId(idMedico);
        }
        public List<Medico> ObtenerPorEspecialidad(int idEspecialidad)
        {
            MedicoDatos datos = new MedicoDatos();
            return datos.ObtenerPorEspecialidad(idEspecialidad);
        }

        public bool EliminarMedico(int idMedico)
        {
            if (idMedico <= 0)
                return false;

            MedicoDatos datos = new MedicoDatos();
            return datos.EliminarMedico(idMedico);
        }
        public List<Medico> ObtenerTodos()
        {
            MedicoDatos datos = new MedicoDatos();
            return datos.ObtenerTodos();
        }
        public List<Medico> FiltrarMedicos(string especialidad, string dias, string provincia)
        {
            return datos.FiltrarMedicos(especialidad, dias, provincia);
        }
        public int ObtenerIdMedicoPorIdUsuario(int idUsuario)
        {
            MedicoDatos datos = new MedicoDatos();
            return datos.ObtenerIdMedicoPorIdUsuario(idUsuario);
        }
    }
}
