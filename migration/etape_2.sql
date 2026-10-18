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
  