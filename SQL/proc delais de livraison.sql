create proc delais_de_livraison
as

select avg(convert(int,day(Date_Livraison))-convert(int,day(Date_commande))) as 'delais de livraison'
from livraison as l
join Declenche as d on d.Bon_Livraison=l.Bon_Livraison
join Commande as c on c.Id_Commande=d.Id_Commande

exec delais_de_livraison

go