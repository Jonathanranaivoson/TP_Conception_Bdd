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
    id_plat INT NOT NULL,
    quantite INT NOT NULL,
    date_commande TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_commandes_plats FOREIGN KEY (id_plat) REFERENCES plats(id)
);

INSERT INTO commandes (id_plat, quantite) VALUES 
(1, 2),
(2, 1),
(3, 3),
(4, 1),
(5, 2);