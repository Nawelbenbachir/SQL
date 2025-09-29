SET NAMES utf8mb4;
CREATE DATABASE commandes CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci
USE commandes;

CREATE TABLE client(
   id BIGINT PRIMARY KEY AUTO_INCREMENT ,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50),
   adresse VARCHAR(50),
   email VARCHAR(50) NOT NULL,
   telephone VARCHAR(50)
   
);

CREATE TABLE article(
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   code VARCHAR(50) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   taux_tva DECIMAL(10,2) NOT NULL,
   prix_ht DECIMAL(10,2) NOT NULL,
   stock DECIMAL(10,2) NOT NULL
   
);

CREATE TABLE commande(
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   numero VARCHAR(50) NOT NULL,
   date_commande DATETIME NOT NULL,
   total_ht DECIMAL(10,2) NOT NULL,
   total_tva DECIMAL(10,2) NOT NULL,
   total_ttc DECIMAL(10,2) NOT NULL,
   id_client BIGINT NOT NULL,
   UNIQUE(numero),
   FOREIGN KEY(id_client) REFERENCES client(id)
);

CREATE TABLE commande_ligne(
   id BIGINT PRIMARY KEY AUTO_INCREMENT,
   id_commande BIGINT NOT NULL,
   id_article BIGINT NOT NULL,
   quantite DECIMAL(10,2) NOT NULL,
   FOREIGN KEY(id_article) REFERENCES article(id),
   FOREIGN KEY(id_commande) REFERENCES commande(id)
);
