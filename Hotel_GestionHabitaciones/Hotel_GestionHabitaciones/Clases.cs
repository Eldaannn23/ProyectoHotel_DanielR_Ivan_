using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Hotel_GestionHabitaciones
{
    public class Habitacion
    {
        public int Id { get; set; }
        public int Numero { get; set; }
        public string Tipo { get; set; }
        public decimal Precio { get; set; }
        public string Estado { get; set; } = "Disponible";
    }

    public class Cliente
    {
        public int Id { get; set; }
        public string Dni { get; set; } = "";
        public string Nombre { get; set; } = "";
        public string Apellidos { get; set; } = "";
        public string Telefono { get; set; } = "";
        public string Email { get; set; } = "";

        // Texto que se ve en el ComboBox de reservas
        public string NombreCompleto { get { return Nombre + " " + Apellidos; } }
    }
    public class Reserva
    {
        public int Id { get; set; }
        public int IdHabitacion { get; set; }    // clave foranea
        public DateTime FechaEntrada { get; set; } = DateTime.Today;
        public DateTime FechaSalida { get; set; } = DateTime.Today.AddDays(1);
        public string PrecioTotal { get; set; }  
        public string Estado { get; set; } = "Pendiente";
    }

}
