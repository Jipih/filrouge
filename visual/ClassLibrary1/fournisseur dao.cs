using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

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

 
          
    }
}




