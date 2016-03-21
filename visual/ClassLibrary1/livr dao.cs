using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace DAL
{
   public class livr
    {
        SqlConnection con = new SqlConnection("server=.; database=shop; integrated security=true");
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

        }
    }
