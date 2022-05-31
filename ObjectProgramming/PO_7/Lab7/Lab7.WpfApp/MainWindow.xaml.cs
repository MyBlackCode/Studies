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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab7.WpfApp
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public MainWindow()
        {
            InitializeComponent();
            CurrentOperctionText.Text = String.Empty;
            
        }

        private void Button_Click(object sender, RoutedEventArgs e)
        {
            if (sender is Button buttonOk)                                 
            {                                                              
               CurrentOperctionText.Text += buttonOk.Content;              
            }                                                              
                                                                           
        }                                                                  
                                                                           
        private void Button_Click_Add(object sender, RoutedEventArgs e)
        {
            var operation = CurrentOperctionText.Text;
            if(ContainsOperation(operation))
            {
                CurrentOperctionText.Text = CalculateResults(operation).ToString();
            }
            CurrentOperctionText.Text += "+";
        }
        private void Button_Click_Sub(object sender, RoutedEventArgs e)
        {
            var operation = CurrentOperctionText.Text;
            if (ContainsOperation(operation))
            {
                CurrentOperctionText.Text = CalculateResults(operation).ToString();
            }
            CurrentOperctionText.Text += "-";
        }
        private void Button_Click_Mul(object sender, RoutedEventArgs e)
        {
            var operation = CurrentOperctionText.Text;
            if (ContainsOperation(operation))
            {
                CurrentOperctionText.Text = CalculateResults(operation).ToString();
            }
            CurrentOperctionText.Text += "*";
        }
        private void Button_Click_Div(object sender, RoutedEventArgs e)
        {
            var operation = CurrentOperctionText.Text;
            if (ContainsOperation(operation))
            {
                CurrentOperctionText.Text = CalculateResults(operation).ToString();
            }
            CurrentOperctionText.Text += "/";
        }
        private void Button_Click_Result(object sender, RoutedEventArgs e)
        {
            var operation = CurrentOperctionText.Text;
            CurrentOperctionText.Text = CalculateResults(operation).ToString();
        }
        private double CalculateResults(string operation)
        {
            CurrentOperctionText.Text += "=";

            if (operation.Contains('+'))
            {
                var elements = operation.Split('+');

                if (double.TryParse(elements[0], out var v))
                {
                    if (double.TryParse(elements[1], out var k))
                    {
                        var result = v + k;
                        return result;
                    }
                }
                else
                {
                    Console.WriteLine("parse error instructions");
                }

            }
            else if (operation.Contains('-'))
            {
                var elements = operation.Split('-');

                if (double.TryParse(elements[0], out var v))
                {
                    if (double.TryParse(elements[1], out var k))
                    {
                        var result = v - k;
                        return result;
                    }
                }
                else
                {
                    Console.WriteLine("parse error instructions");
                }

            }
            else if (operation.Contains('*'))
            {
                var elements = operation.Split('*');

                if (double.TryParse(elements[0], out var v))
                {
                    if (double.TryParse(elements[1], out var k))
                    {
                        var result = v * k;
                        return result;
                    }
                }
                else
                {
                    Console.WriteLine("parse error instructions");
                }

            }
            else if (operation.Contains('/'))
            {
                var elements = operation.Split('/');

                if (double.TryParse(elements[0], out var v))
                {
                    if (double.TryParse(elements[1], out var k))
                    {
                        var result = v / k;
                        return result;
                    }
                }
                else
                {
                    Console.WriteLine("parse error instructions");
                }


            }
            return 0;
        }
        private bool ContainsOperation(string operation) => operation.Contains('+') || operation.Contains('-') || operation.Contains('*') || operation.Contains('/');
        private void Button_Click_Przecinek(object sender, RoutedEventArgs e)
        {
            CurrentOperctionText.Text += ".";
        }
        private void Button_Click_C(object sender, RoutedEventArgs e)
        {
            CurrentOperctionText.Text = "0";
        }
    }
}
