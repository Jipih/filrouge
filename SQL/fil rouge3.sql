use master

drop database shop

go

create database shop

go

use shop

go

--#------------------------------------------------------------
--#-- Table: sous rubrique
--#------------------------------------------------------------

CREATE TABLE sous_rubrique(
        sous_rubrique Varchar (50) NOT NULL primary key ,
       
)

--#------------------------------------------------------------
--#-- Table: rubrique
--#------------------------------------------------------------

CREATE TABLE rubrique(
        rubrique      Varchar (100) NOT NULL primary key ,
        sous_rubrique Varchar (50) references Sous_Rubrique(Sous_Rubrique)  NOT NULL ,
)


--#------------------------------------------------------------
--#-- Table: Produit
--#------------------------------------------------------------

CREATE TABLE Produit(
        Ref_Fournisseur int  IDENTITY  NOT NULL ,
        Date_Achat      Date ,
        Photo           Varchar (25) NOT NULL ,
        Prix_Ht         Int ,
        Libelle_Court   Varchar (12) NOT NULL ,
        Libelle_Long    Varchar (100) ,
        rubrique        Varchar (100) references rubrique(rubrique) NOT NULL ,
        PRIMARY KEY (Ref_Fournisseur )
)


--#------------------------------------------------------------
--#-- Table: Clients
--#------------------------------------------------------------

CREATE TABLE Clients(
        Ref_Client   int Identity  NOT NULL ,
        Client_Par   Varchar (100) NOT NULL ,
        Client_Pro   Varchar (100) NOT NULL ,
        Adresse      Varchar (100) ,
        Nom_Client   Varchar (50) ,
        Ville_Client Varchar (50) ,
        Code_postal  Int ,
        PRIMARY KEY (Ref_Client )
)

--#------------------------------------------------------------
--#-- Table: Fournisseurs
--#------------------------------------------------------------

CREATE TABLE Fournisseurs(
        Id_Fournisseur    int  identity  NOT NULL ,
		Nom_fournisseur varchar (400) not null,
        Catalogue_Article Varchar (400) NOT NULL ,
		Email_Fournisseur Varchar (100) not null,
        PRIMARY KEY (Id_Fournisseur )
)


--#------------------------------------------------------------
--#-- Table: Facturation
--#------------------------------------------------------------

CREATE TABLE Facturation(
        Numero_facture   int identity  NOT NULL ,
        Commercial_pro   Varchar (100) NOT NULL ,
        Commercial_par   Varchar (100) NOT NULL ,
        Taux_remise      Int ,
        Date_facturation Date ,
        PRIMARY KEY (Numero_facture )
)

--#------------------------------------------------------------
--#-- Table: Commande
--#------------------------------------------------------------

CREATE TABLE Commande(
        Id_Commande     int identity  NOT NULL ,
        Adr_Commande    Varchar (100) NOT NULL ,
        Adr_Facturation Varchar (100) NOT NULL ,
        Prix_vente      Varchar (25) NOT NULL ,
        Date_commande   Date ,
        Numero_facture  Int references Facturation(Numero_facture) NOT NULL ,
        Ref_Client      Int references Clients(Ref_Client) NOT NULL ,
        PRIMARY KEY (Id_Commande )
)



--#------------------------------------------------------------
--#-- Table: Livraison
--#------------------------------------------------------------

CREATE TABLE Livraison(
        Bon_Livraison  int identity  NOT NULL ,
        Liste_Produit  Varchar (400) NOT NULL ,
        Adr_Livraison  Varchar (100) ,
        Date_Livraison Date ,
        PRIMARY KEY (Bon_Livraison )
)





--#------------------------------------------------------------
--#-- Table: fourni
--#------------------------------------------------------------

CREATE TABLE fourni(
        Id_Fournisseur  Int references Fournisseurs(Id_Fournisseur) NOT NULL ,
        Ref_Fournisseur Int references Produit(Ref_Fournisseur)NOT NULL ,
        PRIMARY KEY (Id_Fournisseur ,Ref_Fournisseur )
)


--#------------------------------------------------------------
--#-- Table: est proposé
--#------------------------------------------------------------

CREATE TABLE est_propose(
        quantitee       Int ,
        prixvente       DECIMAL (15,3)  ,
        Ref_Fournisseur Int references Produit(Ref_Fournisseur) NOT NULL ,
        Id_Commande     Int references Commande(Id_Commande)NOT NULL ,
        PRIMARY KEY (Ref_Fournisseur ,Id_Commande )
)


--#------------------------------------------------------------
--#-- Table: Déclenche
--#------------------------------------------------------------

CREATE TABLE Declenche(
        Id_Commande   Int references Commande(Id_Commande)NOT NULL ,
        Bon_Livraison Int references Livraison(Bon_Livraison)NOT NULL ,
        PRIMARY KEY (Id_Commande ,Bon_Livraison )
)

--#------------------------------------------------------------
--# Table: se compose
--#------------------------------------------------------------

CREATE TABLE se_compose(
        quantite        Int ,
        Bon_Livraison   Int references Livraison(Bon_Livraison)NOT NULL ,
        Ref_Fournisseur Int references Produit(Ref_Fournisseur) NOT NULL ,
        PRIMARY KEY (Bon_Livraison ,Ref_Fournisseur )
)

