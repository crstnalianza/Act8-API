using System;
using System.Data.SqlClient;
using System.Net.Http;
using System.Windows.Forms;
using System.Globalization;
using Newtonsoft.Json;
using System.Text;
using System.Linq;

namespace CsharpApi
{
    public partial class OrderingSystem : Form
    {
        private string connectionString = "Server=localhost;Database=ordering_system;Uid=root;Pwd=;";
        private HttpClient client = new HttpClient();

        public OrderingSystem()
        {
            InitializeComponent();
        }

        private void guna2Panel2_Paint(object sender, PaintEventArgs e)
        {
        }

        private void guna2CircleButton1_Click(object sender, EventArgs e)
        {
        }

        private void label1_Click(object sender, EventArgs e)
        {
        }

        private void label3_Click(object sender, EventArgs e)
        {
        }

        private void addkimchi_Click(object sender, EventArgs e)
        {
            string item = "Kimchi";
            decimal price = 250.00m;

            // Add the item to the ListBox
            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            // Update the total due
            UpdateTotalDue();
        }

        private void guna2TextBox1_TextChanged(object sender, EventArgs e)
        {
        }

        private async void Get_ClickAsync(object sender, EventArgs e)
        {
            try
            {
                gettxtbox.Clear();
                HttpResponseMessage response = await client.GetAsync("http://localhost/edp/api.php");
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                gettxtbox.Text = responseBody;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }

        private void totaldue_TextChanged(object sender, EventArgs e)
        {
        }

        private void addtteokbokki_Click(object sender, EventArgs e)
        {
            string item = "Tteokbokki";
            decimal price = 200.00m;

            // Add the item to the ListBox
            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            // Update the total due
            UpdateTotalDue();
        }

        private void guna2GradientButton11_Click(object sender, EventArgs e)
        {
            Orders.Items.Clear();
            TotalDue.Clear();
        }

        private void OrderingSystem_Load(object sender, EventArgs e)
        {
        }

        private void UpdateTotalDue()
        {
            decimal total = 0;

            foreach (var item in Orders.Items)
            {
                string[] parts = item.ToString().Split(new[] { " - Price: " }, StringSplitOptions.RemoveEmptyEntries);


                if (parts.Length == 2)
                {
                    string priceString = parts[1].Trim();
                    if (decimal.TryParse(priceString, NumberStyles.Currency, new CultureInfo("en-PH"), out decimal price))
                    {
                        total += price;
                    }
                }
            }

            TotalDue.Text = total.ToString("C", new CultureInfo("en-PH"));
        }

        private void addbibimbap_Click(object sender, EventArgs e)
        {
            string item = "Bibimbap";
            decimal price = 350.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addbulgogi_Click(object sender, EventArgs e)
        {
            string item = "Bulgogi";
            decimal price = 450.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addbibim_Click(object sender, EventArgs e)
        {
            string item = "Bibim Naengmyeon";
            decimal price = 380.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addjajangmyeon_Click(object sender, EventArgs e)
        {
            string item = "Jajangmyeon";
            decimal price = 320.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addgalbi_Click(object sender, EventArgs e)
        {
            string item = "Galbi";
            decimal price = 500.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addjapchae_Click(object sender, EventArgs e)
        {
            string item = "Japchae";
            decimal price = 300.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addsamgyeopsal_Click(object sender, EventArgs e)
        {
            string item = "Samgyeopsal";
            decimal price = 400.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private void addjjigae_Click(object sender, EventArgs e)
        {
            string item = "Kimchi Jjigae";
            decimal price = 280.00m;

            Orders.Items.Add(item + " - Price: " + price.ToString("C", new CultureInfo("en-PH")));

            UpdateTotalDue();
        }

        private async void guna2GradientButton10_Click(object sender, EventArgs e)
        {
            var productNames = string.Join(", ", Orders.Items.Cast<string>().Select(item => item.ToString().Split(new[] { " - Price: " }, StringSplitOptions.None)[0]));
            decimal.TryParse(TotalDue.Text.Replace("₱", "").Replace(",", "").Trim(), out decimal totalDue);

            var orderData = new
            {
                product_names = productNames,
                total_due = totalDue
            };

            string json = JsonConvert.SerializeObject(orderData);
            HttpContent content = new StringContent(json, Encoding.UTF8, "application/json");

            try
            {
                HttpResponseMessage response = await client.PostAsync("http://localhost/edp/api.php", content);
                response.EnsureSuccessStatusCode();
                string responseBody = await response.Content.ReadAsStringAsync();
                gettxtbox.Text = responseBody;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error: " + ex.Message);
            }
        }
        public class OrderData
        {
            public string ProductNames { get; set; }
            public decimal TotalDue { get; set; }
        }

        private void Orders_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
