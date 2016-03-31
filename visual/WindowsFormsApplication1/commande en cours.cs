using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;

namespace WindowsFormsApplication1
{
    public partial class commande_en_cours : Form
    {
        public commande_en_cours()
        {
            InitializeComponent();
        }

        private void commande_en_cours_Load(object sender, EventArgs e)
        {
            livr li = new livr();
            List<livraison> listlivraison = li.Liv();

            DGV.DataSource = listlivraison;
            DGV.SelectionMode = DataGridViewSelectionMode.FullRowSelect;

            DGV.RowHeadersVisible = false;
            DGV.Columns[0].Visible = true;
           

            DGV.AutoSizeColumnsMode = DataGridViewAutoSizeColumnsMode.AllCells;

            DGV.Columns["Bon_Livraison"].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            DGV.Columns["Liste_Produit"].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            DGV.Columns["Adr_Livraison"].AutoSizeMode = DataGridViewAutoSizeColumnMode.DisplayedCells;
            DGV.Columns["Date_Livraison"].AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
            DGV.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.DisplayedCellsExceptHeaders;
           
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
