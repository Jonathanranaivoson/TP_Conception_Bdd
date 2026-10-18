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