using System.Collections.Generic; // korzysta z niej List oraz IList
using System.Windows; //klasa dziedziczy po Window
using System.Windows.Controls;
using System.Windows.Data;
using Student.BLL; // umozliwa korzystanie z klas znajdujących się w projekcie Student.BLL


namespace Student.WpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public IList<Student1> Students { get; set; } //Konflikt z nazwą solucji Student!!! Zmieniono nazwe klasy na Student1
        private AddStudentWindow _addStudentWindow;
        private AddGradeWindow _addGradeWindow;
        private DisplayGradesWindow _displayGradesWindow;
        public MainWindow()
        {
            InitializeComponent();
            
            //Dodanie poczatkowej listy studentow
            Students = new List<Student1>
            {
                new Student1() { FirstName = "Jan", LastName = "Kowalski", Faculty = "Informatyka", Id = 1 },
                new Student1() { FirstName = "Anna", LastName = "Nowak", Faculty = "Matematyka", Id = 2 },
                new Student1() { FirstName = "Wojciech", LastName = "Las", Faculty = "Elektryka", Id = 3 },
            };
            //Ustawiamy kolumny DataGrid
            DataGridStudents.Columns.Add(item:new DataGridTextColumn() { Header = "First name", Binding = new Binding(path: "FirstName") }); //Binding - odwolanie
            DataGridStudents.Columns.Add(item: new DataGridTextColumn() { Header = "Last name", Binding = new Binding(path: "LastName") });
            DataGridStudents.Columns.Add(item: new DataGridTextColumn() { Header = "Faculty", Binding = new Binding(path: "Faculty") });
            DataGridStudents.Columns.Add(item: new DataGridTextColumn() { Header = "Id", Binding = new Binding(path: "Id") });
            DataGridStudents.AutoGenerateColumns = false; //prawda, jeśli kolumny są tworzone automatycznie; w przeciwnym razie fałsz. Zarejestrowana wartość domyślna to prawda. 
            DataGridStudents.ItemsSource = Students;
        }

        private void ButtonAddStudent_Click(object sender, RoutedEventArgs e)
        {
            
            _addStudentWindow = new AddStudentWindow(); //tworzymy nowe okno
            _addStudentWindow.ShowDialog();//powoduje wyświetlenie i zablokowanie okna macierzystego aż do jegozamknięcia
            if (_addStudentWindow.DialogResult == true) //jeśli okienko wykonało zamierzone działanie to należy zwrócić „true”, jeśli operacja została przerwana to „false” 
                Students.Add(_addStudentWindow.Student);//Dodaje studenta
            DataGridStudents.Items.Refresh(); // Odswieza liste
        }

        private void ButtonDelete_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridStudents.SelectedItem is Student1 studentToRemove)//Jezeli zaznaczony obiekt jest studentem
            {
                Students.Remove(studentToRemove);//Usun go
                DataGridStudents.Items.Refresh();//Odswiez liste
            }
        }

        private void ButtonAddGrade_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridStudents.SelectedItem is Student1 selectStudent)//Jezeli zaznaczony obiekt jest studentem
            {
                _addGradeWindow = new AddGradeWindow();
                _addGradeWindow.ShowDialog();
                if (_addGradeWindow.DialogResult == true)
                    selectStudent.Grades.Add(_addGradeWindow.Grade);
            }
        }

        private void ButtonDisplayGrade_Click(object sender, RoutedEventArgs e)
        {
            if (DataGridStudents.SelectedItem is Student1 selectStudent)//Jezeli zaznaczony obiekt jest studentem
            {
                _displayGradesWindow = new DisplayGradesWindow( selectStudent);
                _displayGradesWindow.ShowDialog();
            }
        }
    }
}
