CREATE TABLE client(
   id INT,
   nom VARCHAR(50) NOT NULL,
   prenom VARCHAR(50),
   adresse VARCHAR(50),
   email VARCHAR(50) NOT NULL,
   telephone VARCHAR(50),
   PRIMARY KEY(id)
);

CREATE TABLE article(
   id INT,
   code VARCHAR(50) NOT NULL,
   nom VARCHAR(50) NOT NULL,
   taux_tva DECIMAL(15,4) NOT NULL,
   prix_ht DECIMAL(15,4) NOT NULL,
   stock DECIMAL(15,4) NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(code)
);

CREATE TABLE commande(
   id INT,
   numero VARCHAR(50) NOT NULL,
   date_ DATETIME NOT NULL,
   total_ht DECIMAL(15,4) NOT NULL,
   total_tva DECIMAL(15,4) NOT NULL,
   total_ttc DECIMAL(15,4) NOT NULL,
   id_1 INT NOT NULL,
   PRIMARY KEY(id),
   UNIQUE(numero),
   FOREIGN KEY(id_1) REFERENCES client(id)
);

CREATE TABLE Concerne(
   id INT,
   id_1 INT,
   quantite DOUBLE NOT NULL,
   PRIMARY KEY(id, id_1),
   FOREIGN KEY(id) REFERENCES article(id),
   FOREIGN KEY(id_1) REFERENCES commande(id)
);
