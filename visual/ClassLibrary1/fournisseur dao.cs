using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using DAL;

namespace DAL
{
    public class fournisseur_dao
    {
        SqlConnection con = new SqlConnection("server=.; database=shop; integrated security=true");

        public List<fournisseur> List()
        {
            List<fournisseur> liste = new List<fournisseur>();

            con.Open();

            SqlCommand requete = new SqlCommand("select * from Fournisseurs", con);

            SqlDataReader resultat = requete.ExecuteReader();

            while (resultat.Read())
            {
                fournisseur fou = new fournisseur();
                fou.Id_Fournisseur = Convert.ToInt32(resultat["Id_Fournisseur"]);
                fou.Catalogue_Article = Convert.ToString(resultat["Catalogue_Article"]);
                fou.Email_Fournisseur = Convert.ToString(resultat["Email_Fournisseur"]);
                fou.Nom_Fournisseur = Convert.ToString(resultat["Nom_Fournisseur"]);

                liste.Add(fou);
            }
            con.Close();
            return liste;

        }
        public void Insert(fournisseur f)
        {
            con.Open();
            SqlCommand requete = new SqlCommand("insert into Fournisseurs (Catalogue_Article,Nom_fournisseur,Email_Fournisseur) values (@p1,@p2,@p3)", con); 
            requete.Parameters.AddWithValue("@p1", f.Catalogue_Article);/// Change le nom avec ce qu'il y a dans ton founisseur.cs   
            requete.Parameters.AddWithValue("@p3", f.Email_Fournisseur);/// change l'email avec celui du fournisseur.cs    
            requete.Parameters.AddWithValue("@p2", f.Nom_Fournisseur);// change le nonfou avec celui du .cs     


            requete.ExecuteNonQuery();
            con.Close();
        }

        public List<livraison> Liv()
        {
            List<livraison> liste = new List<livraison>();

            con.Open();

            SqlCommand requete = new SqlCommand("select * from Livraison where Date_Livraison is null", con);

            SqlDataReader resultat = requete.ExecuteReader();

            while (resultat.Read())
            {
                livraison liv = new livraison();
                liv.Bon_Livraison = Convert.ToInt32(resultat["Bon_Livraison"]);
                liv.Liste_Produit = Convert.ToString(resultat["Liste_Produit"]);
                liv.Adr_Livraison = Convert.ToString(resultat["Adr_Livraison"]);

                liv.Date_Livraison = 0;
                if (resultat["Date_Livraison"] != DBNull.Value)
                {
                    liv.Date_Livraison = Convert.ToInt32(resultat["Date_Livraison"]);
                }

                liste.Add(liv);
            }
            con.Close();
            return liste;

        }

        //public  Livr()
        //{
        //    livraison li = new livraison();
        //    int res = 0;
        //    string res2 = "";
        //    string res3= "";
        //    int res4 = 0;
        //    con.Open();

        //    SqlCommand requete = new SqlCommand("select * from Livraison where Date_Livraison is null", con);

        //    SqlDataReader resultat = requete.ExecuteReader();

        //    while (resultat.Read())
        //    {
        //        res = Convert.ToInt32(resultat[0]);
        //        res2 = Convert.ToString(resultat[0]);
        //        res3 = Convert.ToString(resultat[0]);
        //        res4 = Convert.ToInt32(resultat[0]);

        //    }
        //    con.Close();
        //    return ;
        //}
    }
}




