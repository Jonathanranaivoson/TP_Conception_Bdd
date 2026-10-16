-- Etapes 1
SELECT nom,prix FROM Plats ORDER BY prix DESC;

-- Etapes 2
--mbola tsy izy io fa test fotsiny
SELECT nom, prix FROM Plats WHERE id_categorie = '1';
SELECT nom, prix FROM Plats WHERE id_categorie = '2';
SELECT nom, prix FROM Plats WHERE id_categorie = '3';
SELECT nom, prix FROM Plats WHERE id_categorie = '4';
SELECT nom, prix FROM Plats WHERE id_categorie = '5';