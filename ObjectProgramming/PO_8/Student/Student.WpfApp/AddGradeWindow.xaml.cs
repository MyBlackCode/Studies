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
    /// Interaction logic for AddGradeWindow.xaml
    /// </summary>
    public partial class AddGradeWindow : Window
    {
        public Grade Grade { get; set; }
        public AddGradeWindow(Grade grade = null)
        {
            InitializeComponent();
            if(Grade != null)
            {
                TextBoxSubjectName.Text = grade.SubjectName;
                TextBoxDate.Text = grade.Date;
                TextBoxValue.Text = grade.Value;
            }
            Grade = grade ?? new Grade();
        }

        private void ButtonAddGrade_Click(object sender, RoutedEventArgs e)
        {
            if (!Regex.IsMatch(input: TextBoxSubjectName.Text, pattern: @"^\p{L}{1,12}$") ||
               !Regex.IsMatch(input: TextBoxDate.Text, pattern: @"^\d*\.\d*\.\d{1,10}$") ||
               !Regex.IsMatch(input: TextBoxValue.Text, pattern: @"^\d*\.\d{1,4}$"))
            {
                MessageBox.Show(messageBoxText: "Invalid input data");
               return;
            }
            Grade.SubjectName = TextBoxSubjectName.Text;
            Grade.Date = TextBoxDate.Text;  
            //if (!double.TryParse(TextBoxValue.Text, out double value))
              //  MessageBox.Show(messageBoxText: "Student is not a number.");
            //Grade.Value = value;
            Grade.Value = TextBoxValue.Text;
            DialogResult = true;

        }
    }
}
