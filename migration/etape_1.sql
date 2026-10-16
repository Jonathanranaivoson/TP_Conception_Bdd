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
