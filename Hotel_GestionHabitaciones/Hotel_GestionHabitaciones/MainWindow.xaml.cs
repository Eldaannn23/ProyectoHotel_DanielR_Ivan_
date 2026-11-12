
using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;

namespace Hotel
{
    public partial class MainWindow : Window
    {
        List<Habitacion> habitaciones = new List<Habitacion>();

        public MainWindow()
        {
            InitializeComponent();

            // Creamos las habitaciones
            // PISO 1
            habitaciones.Add(new Habitacion(101, "Individual", 45, "Disponible"));
            habitaciones.Add(new Habitacion(102, "Doble", 65, "Disponible"));
            habitaciones.Add(new Habitacion(103, "Doble", 70, "Ocupada"));
            habitaciones.Add(new Habitacion(104, "Suite", 120, "Disponible"));

            // PISO 2
            habitaciones.Add(new Habitacion(201, "Individual", 40, "Disponible"));
            habitaciones.Add(new Habitacion(202, "Familiar", 95, "Ocupada"));
            habitaciones.Add(new Habitacion(203, "Suite", 150, "Mantenimiento"));
            habitaciones.Add(new Habitacion(204, "Doble", 60, "Disponible"));

            // PISO 3
            habitaciones.Add(new Habitacion(301, "Individual", 45, "Disponible"));
            habitaciones.Add(new Habitacion(302, "Doble", 65, "Disponible"));
            habitaciones.Add(new Habitacion(303, "Familiar", 95, "Disponible"));
            habitaciones.Add(new Habitacion(304, "Suite", 120, "Disponible"));

            // PISO 4
            habitaciones.Add(new Habitacion(401, "Individual", 40, "Disponible"));
            habitaciones.Add(new Habitacion(402, "Doble", 70, "Ocupada"));
            habitaciones.Add(new Habitacion(403, "Familiar", 95, "Disponible"));
            habitaciones.Add(new Habitacion(404, "Suite", 150, "Disponible"));

            // PISO 5
            habitaciones.Add(new Habitacion(501, "Individual", 45, "Disponible"));
            habitaciones.Add(new Habitacion(502, "Doble", 60, "Disponible"));
            habitaciones.Add(new Habitacion(503, "Familiar", 95, "Ocupada"));
            habitaciones.Add(new Habitacion(504, "Suite", 120, "Disponible"));

            // PISO 6
            habitaciones.Add(new Habitacion(601, "Individual", 40, "Disponible"));
            habitaciones.Add(new Habitacion(602, "Doble", 65, "Disponible"));
            habitaciones.Add(new Habitacion(603, "Familiar", 95, "Disponible"));
            habitaciones.Add(new Habitacion(604, "Suite", 150, "Disponible"));

            // PISO 7
            habitaciones.Add(new Habitacion(701, "Individual", 45, "Disponible"));
            habitaciones.Add(new Habitacion(702, "Doble", 70, "Disponible"));
            habitaciones.Add(new Habitacion(703, "Familiar", 95, "Disponible"));
            habitaciones.Add(new Habitacion(704, "Suite", 120, "Mantenimiento"));

            // PISO 8
            habitaciones.Add(new Habitacion(801, "Individual", 40, "Disponible"));
            habitaciones.Add(new Habitacion(802, "Doble", 60, "Ocupada"));
            habitaciones.Add(new Habitacion(803, "Familiar", 95, "Disponible"));
            habitaciones.Add(new Habitacion(804, "Suite", 150, "Disponible"));

            // PISO 9
            habitaciones.Add(new Habitacion(901, "Individual", 45, "Disponible"));
            habitaciones.Add(new Habitacion(902, "Doble", 65, "Disponible"));
            habitaciones.Add(new Habitacion(903, "Familiar", 95, "Disponible"));
            habitaciones.Add(new Habitacion(904, "Suite", 120, "Disponible"));

            // PISO 10
            habitaciones.Add(new Habitacion(1001, "Individual", 40, "Disponible"));
            habitaciones.Add(new Habitacion(1002, "Doble", 70, "Disponible"));
            habitaciones.Add(new Habitacion(1003, "Familiar", 95, "Ocupada"));
            habitaciones.Add(new Habitacion(1004, "Suite", 150, "Disponible"));




            // Mostramos las habitaciones

            tablaHabitaciones.ItemsSource = habitaciones;
        }

        private void Buscar_Click(object sender, RoutedEventArgs e)
        {
            string tipo = ((ComboBoxItem)cmbTipo.SelectedItem).Content.ToString();

            if (tipo == "Todas")
            {
                tablaHabitaciones.ItemsSource = habitaciones;
            }
            else
            {
                List<Habitacion> resultado = new List<Habitacion>();

                foreach (Habitacion h in habitaciones)
                {
                    if (h.Tipo == tipo)
                    {
                        resultado.Add(h);
                    }
                }

                tablaHabitaciones.ItemsSource = resultado;
            }
        }

        private void Reservar_Click(object sender, RoutedEventArgs e)
        {
            Habitacion seleccionada = tablaHabitaciones.SelectedItem as Habitacion;

            if (seleccionada == null)
            {
                MessageBox.Show("Selecciona una habitacion");
            }
            else if (seleccionada.Estado == "Reservada")
            {
                MessageBox.Show("Esta habitacion ya esta reservada");
            }
            else
            {
                seleccionada.Estado = "Reservada";

                tablaHabitaciones.Items.Refresh();

                MessageBox.Show("Habitacion reservada correctamente");
            }
        }
    }

    // Clase Habitacion
    public class Habitacion
    {
        public int Numero { get; set; }
        public string Tipo { get; set; }
        public double Precio { get; set; }
        public string Estado { get; set; }

        public Habitacion(int numero, string tipo, double precio, string estado)
        {
            Numero = numero;
            Tipo = tipo;
            Precio = precio;
            Estado = estado;
        }
    }
}
