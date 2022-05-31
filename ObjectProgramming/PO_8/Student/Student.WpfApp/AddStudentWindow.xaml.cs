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
using System.Text.RegularExpressions;

namespace Student.WpfApp
{
    /// <summary>
    /// Interaction logic for AddStudentWindow.xaml
    /// </summary>
    public partial class AddStudentWindow : Window
    {
        public Student1 Student { get; set;}
        public AddStudentWindow(Student1 student =null)
        {
            InitializeComponent();
            if (Student != null)
            {
                TextBoxFirstName.Text = student.FirstName;
                TextBoxLastName.Text = student.LastName;
                TextBoxFaculty.Text = student.Faculty;
                TextBoxId.Text = student.Id.ToString();
            }
            Student = student ?? new Student1();
        }

        private void ButtonAddStudent_Click(object sender, RoutedEventArgs e)
        {
            if (!Regex.IsMatch(input: TextBoxFirstName.Text, pattern: @"^\p{L}{1,12}$") ||
                !Regex.IsMatch(input: TextBoxLastName.Text, pattern: @"^\p{L}{1,12}$") ||
                !Regex.IsMatch(input: TextBoxFaculty.Text, pattern: @"^\p{L}{1,12}$") ||
                !Regex.IsMatch(input: TextBoxId.Text, pattern: @"^[0-9]{4,10}$"))
            {
                MessageBox.Show(messageBoxText: "Invalid input data");
                return;
            }
            Student.FirstName = TextBoxFirstName.Text;
            Student.LastName = TextBoxLastName.Text;
            Student.Faculty = TextBoxFaculty.Text;
            if (!int.TryParse(TextBoxId.Text, out int id))
                MessageBox.Show(messageBoxText: "Student is not a number.");
            Student.Id = id;
            DialogResult = true;
        }
    }
}
