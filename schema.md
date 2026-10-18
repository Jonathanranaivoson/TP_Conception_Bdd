# LISTE DES TABLES RELATIONNELS:
----------

_ plats (**id**, nom, prix, #id_categorie)

_ categorie (**id_categorie**, nom)

_ commandes (**id_**, date_commande)

_ lignes_commande (#id_commande, #id_plat, quantite,  )

_ CREATE TABLE lignes_commande (
    id_commande INT NOT NULL, -- mety anaty commndes iray manko be plat be dia tsy atao primary key
    id_plat INT NOT NULL,
    quantite INT NOT NULL,
    PRIMARY KEY (id_commande, id_plat), 
    CONSTRAINT fk_lignes_commandes FOREIGN KEY (id_commande) REFERENCES commandes(id) ON DELETE CASCADE,
    CONSTRAINT fk_lignes_plats FOREIGN KEY (id_plat) REFERENCES plats(id)
);