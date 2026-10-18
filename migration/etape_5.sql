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
