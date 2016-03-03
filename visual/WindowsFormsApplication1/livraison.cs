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
    public partial class livraison : Form
    {
        public livraison()
        {
            InitializeComponent();
            MAJList();
        }
        private void button1_Click(object sender, EventArgs e)
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
        public void MAJList()
        {
            fournisseur_dao database = new fournisseur_dao();
            listBox1.DisplayMember = "Catalogue_Article"; // Correspond à mon catalogue article dans le DAO et c'est ce qui va etre afficher dans mon cb
            listBox1.ValueMember = "Id_Fournisseur"; // Sert à recuperer l'id de mon fournisseur sans l'afficher
            listBox1.DataSource = database.List();
        }
    }
}
