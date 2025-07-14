using System;
using System.Collections.Generic;
using Datos;
using Entidades;

namespace Negocio
{
    public class PacienteNegocio
    {
        public void AgregarPaciente(Paciente paciente)
        {
            // Validaciones simples 
            if (string.IsNullOrWhiteSpace(paciente.Nombre) || string.IsNullOrWhiteSpace(paciente.Apellido) || string.IsNullOrWhiteSpace(paciente.DNI))
            {
                throw new ArgumentException("Nombre, Apellido y DNI son obligatorios.");
            }

            PacienteDatos datos = new PacienteDatos();
            datos.Agregar(paciente);
        }
        public bool ExisteDni(string dni)
        {
            PacienteDatos datos = new PacienteDatos();
            return datos.ExisteDni(dni);
        }


        public PacienteDatos datos = new PacienteDatos();
        public Paciente BuscarPaciente(string dni)
        {

            return datos.BuscarPorDNI(dni);
        }

        public void ModificarPaciente(Paciente paciente)
        {
            PacienteDatos datos = new PacienteDatos();
            datos.Modificar(paciente);
        }
        public List<Paciente> BuscarFiltrar(string texto, string sexo, string idProvincia)
        {
            PacienteDatos datos = new PacienteDatos();
            return datos.BuscarFiltrarPacientes(texto, sexo, idProvincia);
        }

        public bool EliminarPaciente(int id)
        {
            if (id <= 0) return false;

            PacienteDatos datos = new PacienteDatos();
            return datos.Eliminar(id);
        }
        public List<Paciente> ObtenerTodos()
        {
            PacienteDatos datos = new PacienteDatos();
            return datos.ObtenerTodos();
        }
    }
}
