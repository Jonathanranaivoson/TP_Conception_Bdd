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

