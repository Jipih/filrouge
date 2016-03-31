use shop

go
--#insertion données sous rubrique#--

insert into sous_rubrique (sous_Rubrique)
	values ('instrument a corde'),
		   ('instrument a vent')
go

--#insertion données rubrique#--

insert into Rubrique (rubrique, Sous_rubrique)
	values ('guitares', 'instrument a corde'),
		   ('piano', 'instrument a corde'),
		   ('flute', 'instrument a vent')
go

--#insertion données produit#--
set identity_insert produit on

go

insert into produit (Ref_Fournisseur, Date_Achat, Photo, Prix_Ht, Libelle_Court, Libelle_Long, Rubrique)
	values (546544, '15/12/2015', 'pic007.jpg', 2550, 'fend7', 'fender stratocaster vert emeraude 1971', 'guitares'),
		   (48764, '11/11/15', 'pic54825.jpg', 8750, 'piano65', 'piano a queue noir steinway and sons mélodie 2013', 'piano')
go
	
set identity_insert produit off

go


--#insertion données fournisseurs#--
set identity_insert Fournisseurs on

go

insert into Fournisseurs (Id_Fournisseur, Nom_fournisseur, Catalogue_Article, Email_Fournisseur)
	values (22,'sené musique','steinways catalogue 2015','sené@gmail.com'),
	       (11,'sono musique','musiqua catalogue 2015','sono@gmail.com'),
	       (33,'mélodie musique','mélodie 2015','mélodie@gmail.com')

set identity_insert Fournisseurs off

go
--#insertion données fourni#--
insert into fourni (Id_Fournisseur, Ref_Fournisseur)
	values (22, 546544),
	       (11, 48764)			

--#insertion données clients#--
set identity_insert Clients on

go

insert into Clients (Ref_Client, Client_Par, Client_Pro, Nom_Client, Prenom_Client, Adresse_Client, Ville_Client, Code_Postal_Client, Email_Client)
	values (00555, 1, 0, 'Dupont', 'Pierre', '13 rue du bois', 'amiens', 80000, 'pierre.dupont@free.fr'),
		   (00666, 0, 1, 'Valjean', 'Jean', '27 rue de l eglise', 'le chaudron', 66600, 'jean.valjean@cosette.com'),
		   (00777, 1, 0, 'Skywalker', 'luc', '33 chemin du bout', 'nantes', 44000, 'luc.skywalker@tatoine.com')
		  
set identity_insert Clients off

go

--#insertion données Facturation#--
set identity_insert Facturation on

go

insert into Facturation (Numero_facture, Commercial_pro, Commercial_par, Taux_remise)
	values (000111, 'toto', 'N/A', '0'),
		   (000222, 'N/A', 'titi', '11'),
		   (000333, 'toto', 'N/A', '0')

 set identity_insert Facturation off

go

--#insertion données commandes#--
set identity_insert Commande on

go

insert into Commande (Id_Commande, Adr_Commande, Adr_Facturation, Prix_vente, date_commande, Ref_Client, Numero_facture)
	values (00111, '13 rue du bois 80000 amiens', '13 rue du bois 80000 amiens', 2550,'19/12/2015', 00555, 000111),
		   (00022, '27 rue de l eglise 66600 le chaudron', '27 rue de l eglise 66600 le chaudron', 8750, '20/12/2015', 00666, 000222),
		   (0033, '33 chemin du bout 44000 nantes', '33 chemin du bout 44000 nantes', 250, '03/03/2016', 00777, 00333)

set identity_insert Commande off

go


--#insertion données Livraison#--
set identity_insert Livraison on

go

insert into Livraison (Bon_Livraison, Liste_Produit, Adr_Livraison, Date_Livraison)
	values (001111, 'piano et accesoires', '13 rue du bois 80000 amiens', '24/12/2015'),
		   (0022, 'guitare fender', '27 rue de l eglise 66600 le chaudron', '24/12/2015'),
		   (00333, 'flute a bec', '33 chemin du bout 50000 cherbourg', null)

set identity_insert Livraison off

go

--#insertion données est propose#--
insert into est_propose (quantitee, Ref_Fournisseur, Id_Commande)
	values (1, '546544', '00111'),
		   (1, '48764', '00022')
go
--#insertion données gere #--
--insert into gere(Id_Commande, Numero_facture)
--	values (00111, 000111),
--		   (00022, 000222)


--#insertion données passe#--
--insert into passe (Ref_Client, Id_Commande)
--	values (00555,00111),
--		   (00666,00022)

--#insertion données declanche#--
insert into Declenche (Id_Commande, Bon_Livraison)
	values (00111, 001111),
		   (00111, 00022),
		   (0033, 00333)


go 

use master
