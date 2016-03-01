select quantite, Libelle_Court
from Produit as p
full join se_compose as sc on p.Libelle_Long=sc.Ref_Fournisseur


create view produit_fournisseur
as
select *
from Produit as p
full join Fournisseurs f on f.Id_Fournisseur=p.Ref_Fournisseur

select * from produit_fournisseur
