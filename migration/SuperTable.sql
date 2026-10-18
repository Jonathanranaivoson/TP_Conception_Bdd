CREATE DATABASE gargote_rado;

\c gargote_rado;

CREATE TABLE plats (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    id_categorie INT NOT NULL,
    prix INTEGER NOT NULL,
    CONSTRAINT fk_plats_categorie FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie)
);

    INSERT INTO Plats (nom, id_categorie, prix) VALUES 
    ('Romazava', 1, 7000),
    ('Ravitoto sy henakisoa', 1, 8000),
    ('Akoho sy voanio', 1, 8500),
    ('Misao', 2, 6000),
    ('Soupe chinoise', 3, 5000),
    ('Mofo gasy (les 4)', 4, 1000),
    ('Ranon"ampango', 5, 500);
    

---
-- categorie an le sakafo eto
CREATE TABLE categories (
    id_categorie SERIAL PRIMARY KEY, 
    nom_categorie VARCHAR(100) UNIQUE NOT NULL
);

    INSERT INTO categories (nom_categorie) VALUES 
    ('Plats malagasy'),
    ('Plats chinois'),
    ('Soupe'),
    ('Dessert et gouter'),
    ('Boisson');

-- Etapes 1
SELECT nom,prix FROM Plats ORDER BY prix DESC;


-----------------------------
-- Etapes 2

SELECT nom, prix FROM Plats WHERE id_categorie = '1';
SELECT nom, prix FROM Plats WHERE id_categorie = '2';
SELECT nom, prix FROM Plats WHERE id_categorie = '3';
SELECT nom, prix FROM Plats WHERE id_categorie = '4';
SELECT nom, prix FROM Plats WHERE id_categorie = '5';


SELECT COUNT(*) FROM Plats WHERE id_categorie = '1'; -- afaka atao otan ito koa ny categorie sasany
SELECT COUNT(*) FROM Plats WHERE id_categorie = '2';
SELECT COUNT(*) FROM Plats WHERE id_categorie = '3';
SELECT COUNT(*) FROM Plats WHERE id_categorie = '4';
SELECT COUNT(*) FROM Plats WHERE id_categorie = '5';

--Piege : La raison a laquelle on ne peut pas ajouter une colonne categorie VARCHAR dans la table plats est que nous avons déjà une relation de clé étrangère entre la table plats et la table categories . 
  

----------------------------------------------

-- etapes 1
CREATE TABLE plats (
    id SERIAL PRIMARY KEY,
    nom VARCHAR(200) NOT NULL,
    id_categorie INT NOT NULL,
    prix INTEGER NOT NULL,
    CONSTRAINT fk_plats_categorie FOREIGN KEY (id_categorie) REFERENCES categories(id_categorie)
);

CREATE TABLE categories (
    id_categorie SERIAL PRIMARY KEY, 
    nom_categorie VARCHAR(100) UNIQUE NOT NULL
);

-- etapes 3

CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE lignes_commande (
    id_commande INT NOT NULL, -- mety anaty commndes iray manko be plat be dia tsy atao primary key
    id_plat INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_commande, id_plat), 
    CONSTRAINT fk_lignes_commandes FOREIGN KEY (id_commande) REFERENCES commandes(id) ON DELETE CASCADE,
    CONSTRAINT fk_lignes_plats FOREIGN KEY (id_plat) REFERENCES plats(id)
);


INSERT INTO commandes (date_commande) VALUES 
    ('2024-06-01 12:00:00'),
    ('2024-06-02 13:30:00'),
    ('2024-06-03 18:45:00');

INSERT INTO lignes_commande (id_commande, id_plat, quantite) VALUES 
    (1, 1, 2),
    (1, 3, 1),
    (2, 2, 3),
    (2, 4, 2),
    (3, 5, 1),
    (3, 6, 4);

-- la quantite sera place dans la table ligne_commandes. 


-------------------------------------

-- etapes 3

CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO commandes (date_commande, nom_client) VALUES 
    ('2024-06-01 12:00:00', 'Ouhouh'),
    ('2024-06-02 13:30:00', 'Ayy'),
    ('2024-06-03 18:45:00', 'Jo');

    
CREATE TABLE lignes_commande (
    id_commande INT NOT NULL, -- mety anaty commndes iray manko be plat be dia tsy atao primary key
    id_plat INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_commande, id_plat), 
    CONSTRAINT fk_lignes_commandes FOREIGN KEY (id_commande) REFERENCES commandes(id) ON DELETE CASCADE,
    CONSTRAINT fk_lignes_plats FOREIGN KEY (id_plat) REFERENCES plats(id)
);


--------------------
-- mini update kely tao am le etape 3

ALTER TABLE commandes ADD COLUMN nom_client VARCHAR(100) NOT NULL;
CONSTRAINT fk_commandes_clients FOREIGN KEY (nom_client) REFERENCES clients(nom);


-- etape 4

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR (100) NOT NULL
);

INSERT INTO clients (nom) VALUES 
    ('Ouhouh'),
    ('Ayy'),
    ('Jo');

----------------------------------------------

-- etapes 3

CREATE TABLE commandes (
    id SERIAL PRIMARY KEY,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO commandes (date_commande, nom_client) VALUES 
    ('2024-06-01 12:00:00', 'Ouhouh'),
    ('2024-06-02 13:30:00', 'Ayy'),
    ('2024-06-03 18:45:00', 'Jo');

    
CREATE TABLE lignes_commande (
    id_commande INT NOT NULL, -- mety anaty commndes iray manko be plat be dia tsy atao primary key
    id_plat INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_commande, id_plat), 
    CONSTRAINT fk_lignes_commandes FOREIGN KEY (id_commande) REFERENCES commandes(id) ON DELETE CASCADE,
    CONSTRAINT fk_lignes_plats FOREIGN KEY (id_plat) REFERENCES plats(id)
);


--------------------
-- mini update kely tao am le etape 3

ALTER TABLE commandes ADD COLUMN nom_client VARCHAR(100) NOT NULL;
CONSTRAINT fk_commandes_clients FOREIGN KEY (nom_client) REFERENCES clients(nom);   


-- etape 4

CREATE TABLE clients (
    id SERIAL PRIMARY KEY,
    nom VARCHAR (100) NOT NULL
);

INSERT INTO clients (nom) VALUES 
    ('Ouhouh'),
    ('Ayy'),
    ('Jo');

----------------------------------------
-- mini update kely tao am le etape 4

ALTER TABLE commandes ADD COLUMN prix_total INTEGER NOT NULL DEFAULT 0;

-- Ajout colonne est_emporte dans la table ligne_commandes pour indiquer si le plat est a emporter ou pas
ALTER TABLE lignes_commande ADD COLUMN est_emporte BOOLEAN NOT NULL DEFAULT FALSE;



----------------------------------------
-- etape 5

CREATE TABLE serveurs (
    id_serveur SERIAL PRIMARY KEY,
    nom VARCHAR(100) NOT NULL,
    id_commande INT NOT NULL,
    CONSTRAINT fk_serveurs_commandes FOREIGN KEY (id_commande) REFERENCES commandes(id)
);

CREATE TABLE tables (
    id_table INT PRIMARY KEY
);


ALTER TABLE commandes ADD COLUMN numero_table INT REFERENCES tables(id_table);

ALTER TABLE serveurs ADD COLUMN nombre_commandes INT NOT NULL DEFAULT 0;

INSERT INTO serveurs (nom, id_commande) VALUES
 ('Njaka Rakoto', 1),
 ('Lalao Rasoa', 2);

INSERT INTO tables (id_table) VALUES
 (1),
 (2),
 (3),
 (4),
 (5),
 (6),
 (7),
 (8);

UPDATE serveurs SET id_serveur = 1 WHERE id_serveur = 2;
UPDATE serveurs SET id_serveur = 2 WHERE id_serveur = 3;

SELECT setval(pg_get_serial_sequence('serveurs', 'id_serveur'), 2);

------

CREATE TABLE chiffre_affaires_par_serveur (
    id_ca_par_serveur SERIAL PRIMARY KEY,
    id_serveur INT NOT NULL,
    chiffre_affaires INTEGER NOT NULL,
    CONSTRAINT fk_ca_par_serveur FOREIGN KEY (id_serveur) REFERENCES serveurs(id_serveur)
); 
