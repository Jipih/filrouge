use master

drop database shop

go

create database shop

go

use shop

go
--#------------------------------------------------------------
--# Table: Produit
--#------------------------------------------------------------

CREATE TABLE Produit(
        Ref_Fournisseur int NOT NULL,
        Date_Achat      Date ,
        Photo           Varchar(25) NOT NULL,
        Prix_Ht         Int ,
        Libelle_Court   Varchar(12) NOT NULL,
        Libelle_Long    Varchar(100),
        Rubrique        Varchar(100) NOT NULL,
        PRIMARY KEY (Ref_Fournisseur)
)


--#------------------------------------------------------------
--# Table: Clients
--#------------------------------------------------------------

CREATE TABLE Clients(
        Ref_Client int  NOT NULL,
        Client_Par Varchar (4) NOT NULL,
        Client_Pro Varchar (4) NOT NULL,
        Adresse    Varchar (100),
        PRIMARY KEY (Ref_Client)
)


--#------------------------------------------------------------
--# Table: Fournisseurs
--#------------------------------------------------------------

CREATE TABLE Fournisseurs(
        Id_Fournisseur    int   NOT NULL,
        Catalogue_Article Varchar (400) NOT NULL,
        PRIMARY KEY (Id_Fournisseur)
)


--#------------------------------------------------------------
--# Table: Commande
--#------------------------------------------------------------

CREATE TABLE Commande(
        Id_Commande     int  NOT NULL,
        Adr_Commande    Varchar (100) NOT NULL,
        Adr_Facturation Varchar (100) NOT NULL,
        Prix_vente      Varchar (25) NOT NULL,
        PRIMARY KEY (Id_Commande)
)


--#------------------------------------------------------------
--# Table: Facturation
--#------------------------------------------------------------

CREATE TABLE Facturation(
        Numero_facture int   NOT NULL ,
        Commercial_pro Varchar (100) NOT NULL ,
        Commercial_par Varchar (100) NOT NULL ,
        Taux_remise    Int ,
        PRIMARY KEY (Numero_facture)
)


--#------------------------------------------------------------
--# Table: Livraison
--#------------------------------------------------------------

CREATE TABLE Livraison(
        Bon_Livraison int  NOT NULL ,
        Liste_Produit Varchar (400) NOT NULL ,
        Adr_Livraison Varchar (100) ,
        PRIMARY KEY (Bon_Livraison)
)


--#------------------------------------------------------------
--# Table: rubrique
--#------------------------------------------------------------

CREATE TABLE Rubrique(
        rubrique      Varchar (100) NOT NULL ,
        sous_rubrique Varchar (50) NOT NULL ,
        PRIMARY KEY (rubrique)
)


--#------------------------------------------------------------
--# Table: sous rubrique
--#------------------------------------------------------------

CREATE TABLE Sous_rubrique(
        sous_Rubrique Varchar (50) NOT NULL ,
        PRIMARY KEY (sous_rubrique)
)


--#------------------------------------------------------------
--# Table: fourni
--#------------------------------------------------------------

CREATE TABLE fourni(
        Id_Fournisseur  Int NOT NULL ,
        Ref_Fournisseur Int NOT NULL ,
        PRIMARY KEY (Id_Fournisseur ,Ref_Fournisseur)
)


--#------------------------------------------------------------
--# Table: est proposé
--#------------------------------------------------------------

CREATE TABLE est_propose(
        quantitee       Int ,
        Ref_Fournisseur Int NOT NULL ,
        Id_Commande     Int NOT NULL ,
        PRIMARY KEY (Ref_Fournisseur ,Id_Commande)
)


--#------------------------------------------------------------
--# Table: gére
--#------------------------------------------------------------

CREATE TABLE gere(
        Id_Commande    Int NOT NULL ,
        Numero_facture Int NOT NULL ,
        PRIMARY KEY (Id_Commande ,Numero_facture)
)


--#------------------------------------------------------------
--# Table: Déclenche
--#------------------------------------------------------------

CREATE TABLE Declenche(
        Id_Commande   Int NOT NULL ,
        Bon_Livraison Int NOT NULL ,
        PRIMARY KEY (Id_Commande ,Bon_Livraison)
)


--#------------------------------------------------------------
--# Table: Passe
--#------------------------------------------------------------

CREATE TABLE Passe(
        Ref_Client  Int NOT NULL ,
        Id_Commande Int NOT NULL ,
        PRIMARY KEY (Ref_Client ,Id_Commande)
)
ALTER TABLE Produit ADD CONSTRAINT FK_Produit_rubrique FOREIGN KEY (rubrique) REFERENCES rubrique(rubrique);
ALTER TABLE rubrique ADD CONSTRAINT FK_rubrique_sous_rubrique FOREIGN KEY (sous_rubrique) REFERENCES sous_rubrique(sous_rubrique);
ALTER TABLE fourni ADD CONSTRAINT FK_fourni_Id_Fournisseur FOREIGN KEY (Id_Fournisseur) REFERENCES Fournisseurs(Id_Fournisseur);
ALTER TABLE fourni ADD CONSTRAINT FK_fourni_Ref_Fournisseur FOREIGN KEY (Ref_Fournisseur) REFERENCES Produit(Ref_Fournisseur);
ALTER TABLE est_propose ADD CONSTRAINT FK_est_propose_Ref_Fournisseur FOREIGN KEY (Ref_Fournisseur) REFERENCES Produit(Ref_Fournisseur);
ALTER TABLE est_propose ADD CONSTRAINT FK_est_propose_Id_Commande FOREIGN KEY (Id_Commande) REFERENCES Commande(Id_Commande);
ALTER TABLE gere ADD CONSTRAINT FK_gere_Id_Commande FOREIGN KEY (Id_Commande) REFERENCES Commande(Id_Commande);
ALTER TABLE gere ADD CONSTRAINT FK_gere_Numero_facture FOREIGN KEY (Numero_facture) REFERENCES Facturation(Numero_facture);
ALTER TABLE Declenche ADD CONSTRAINT FK_Declenche_Id_Commande FOREIGN KEY (Id_Commande) REFERENCES Commande(Id_Commande);
ALTER TABLE Declenche ADD CONSTRAINT FK_Declenche_Bon_Livraison FOREIGN KEY (Bon_Livraison) REFERENCES Livraison(Bon_Livraison);
ALTER TABLE Passe ADD CONSTRAINT FK_Passe_Ref_Client FOREIGN KEY (Ref_Client) REFERENCES Clients(Ref_Client);
ALTER TABLE Passe ADD CONSTRAINT FK_Passe_Id_Commande FOREIGN KEY (Id_Commande) REFERENCES Commande(Id_Commande);
