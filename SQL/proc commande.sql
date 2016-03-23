create proc Commande_en_cours
as
select *
from Livraison
where Date_Livraison is null

exec Commande_en_cours

go
