﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using DAL;
using System.Text.RegularExpressions;

namespace WindowsFormsApplication1
{
    public partial class livraisonWindow : Form
    {
        public livraisonWindow()
        {
            InitializeComponent();
            MAJList();
        }

        string strRegex = @"^([a-zA-Z0-9_\-\.]+)@((\[[0-9]{1,3}" +//le regex qui vérifie la validité des emails
                @"\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([a-zA-Z0-9\-]+\" +
                @".)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$";
        public void button1_Click(object sender, EventArgs e)
        {
            Regex re = new Regex(strRegex);

            if (re.IsMatch(textBox3.Text))
            {
                try
                {
                    fournisseur f = new fournisseur(); // Fais appel a ton fichier fournisseur.cs pour avoir la liste des fournisseur
                    f.Nom_Fournisseur = textBox1.Text;//
                    f.Catalogue_Article = textBox2.Text;//------------------- RECUPERE LES VALEURS DES TB
                    f.Email_Fournisseur = textBox3.Text;//-------------------------
                    fournisseur_dao data = new fournisseur_dao(); //-- Appel de ton fichier DAO pour effectuer une requete
                    try
                    {
                        data.Insert(f);//------------------------------- Appel la requete Insert (f et l'alias donné pour la liste des fournisseurs et data du fichier DAO contenant les requetes )
                        MessageBox.Show("Ajout du fournisseur reussi", "Ajout d'un Fournisseur");
                        MAJList();
                    }
                    catch (Exception er)
                    {
                        MessageBox.Show("Une erreur est survenue !\n\n" + er);
                    }
                }
                catch (Exception er)
                {
                    MessageBox.Show("Une erreur est survenue !\n\n" + er);
                }
            }
            else
            {
                MessageBox.Show("erreur de mail");
                textBox3.Text = "";
            }

        }
        public void MAJList()
        {
            fournisseur_dao database = new fournisseur_dao();
            listBox1.DisplayMember = "Catalogue_Article"; // Correspond à mon catalogue article dans le DAO et c'est ce qui va etre afficher dans mon cb
            listBox1.ValueMember = "Id_Fournisseur"; // Sert à recuperer l'id de mon fournisseur sans l'afficher
            listBox1.DataSource = database.List();
        }
        public void textBox3_TextChanged(object sender, EventArgs e)
        {

            Regex re = new Regex(strRegex); // change la couleur du textbox pour indiquer un mauvais format d'email

            if (re.IsMatch(textBox3.Text))
            {
                textBox3.BackColor = Color.Green;
            }
            else
            {
                textBox3.BackColor = Color.Red;
            }

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            Regex re_nom = new Regex(@"^[a-z]{2,30}$"); // vérifie que la nom a le bon format


            if (re_nom.IsMatch(textBox2.Text))
            {
                textBox2.BackColor = Color.LightGreen;  // couleur du cadre passe en vert si ok
                label1.Visible = false;
            }
            else
            {
                textBox2.BackColor = Color.Red; // couleur du cadre passe en rouge si caractere ou format interdit
                label1.Visible = true;
            }
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {
            Regex re_nom = new Regex(@"^[a-z]{2,30}$"); // vérifie que la nom a le bon format


            if (re_nom.IsMatch(textBox2.Text))
            {
                textBox2.BackColor = Color.LightGreen;  // couleur du cadre passe en vert si ok
                label1.Visible = false;
            }
            else
            {
                textBox2.BackColor = Color.Red; // couleur du cadre passe en rouge si caractere ou format interdit
                label1.Visible = true;
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
