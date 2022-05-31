using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using Student.BLL;

namespace Student.WpfApp
{
    /// <summary>
    /// Interaction logic for DisplayGradesWindow.xaml
    /// </summary>
    public partial class DisplayGradesWindow : Window
    {
        public DisplayGradesWindow(Student1 student)
        {
            InitializeComponent();
            DataGridGrades.Columns.Add(item: new DataGridTextColumn() { Header = "Subject name", Binding = new Binding(path: "SubjectName") }); //Binding - odwolanie
            DataGridGrades.Columns.Add(item: new DataGridTextColumn() { Header = "Date", Binding = new Binding(path: "Date") });
            DataGridGrades.Columns.Add(item: new DataGridTextColumn() { Header = "Value", Binding = new Binding(path: "Value") });
            DataGridGrades.AutoGenerateColumns = false; //prawda, jeśli kolumny są tworzone automatycznie; w przeciwnym razie fałsz. Zarejestrowana wartość domyślna to prawda. 
            DataGridGrades.ItemsSource = student.Grades;
        }
    }
}
