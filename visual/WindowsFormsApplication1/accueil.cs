﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;
using DAL;

namespace WindowsFormsApplication1
{
    public partial class accueil : Form
    {
       
      
        public accueil()
        {
            InitializeComponent();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            Form4 f = new Form4();
            f.Show();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            Form f = new livraisonWindow();
            f.Show();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Form f = new Form1();
            f.Show();
        }

        private void button10_Click(object sender, EventArgs e)
        {
            Form f = new commande_en_cours();
            f.Show();
           
        }

        private void button5_Click(object sender, EventArgs e)
        {
            Form f = new home();
            f.Show();
        }

        private void button9_Click(object sender, EventArgs e)
        {

        }

        private void button11_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
