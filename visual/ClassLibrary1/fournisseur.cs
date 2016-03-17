using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class fournisseur

    {
        public int Id_Fournisseur { get; set; }
        public string Catalogue_Article { get; set; }
        public string Email_Fournisseur { get; set; }
        public string Nom_Fournisseur { get; set; }
    }
    public class livraison
    {
        public int Bon_Livraison { get; set; }
        public string Liste_Produit { get; set; }
        public string Adr_Livraison { get; set; }
        public int Date_Livraison { get; set; }
  }
}
