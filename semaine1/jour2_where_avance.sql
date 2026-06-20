-- JOUR 2 — Créer une deuxième table et faire des filtres avancés

-- 1. Créer la table des récoltes

CREATE TABLE recoltes (
    id            SERIAL PRIMARY KEY,
    producteur_id INT NOT NULL,
    date_recolte  DATE NOT NULL,
    quantite_kg   DECIMAL(8,2) NOT NULL,
    qualite       VARCHAR(20) CHECK (qualite IN ('A','B','C')),
    prix_kg_fcfa  DECIMAL(8,2)
);

-- 2. Insérer des récoltes
INSERT INTO recoltes (producteur_id, date_recolte, quantite_kg, qualite, prix_kg_fcfa)
VALUES
    (1, '2024-10-15', 250.5, 'A', 1200),
    (2, '2024-10-16', 180.0, 'B', 1100),
    (3, '2024-10-17', 320.0, 'A', 1200),
    (1, '2024-11-01', 290.0, 'A', 1250),
    (4, '2024-11-05', 120.5, 'C', 950),
    (5, '2024-10-20', 410.0, 'A', 1200);


-- 3. Vos exercices du jour

-- a) Afficher toutes les récoltes de qualité 'A'
select * from recoltes
where qualite = 'A'

-- b) Afficher les récoltes avec plus de 300 kg
select * from recoltes
where quantite_kg > 300;

-- c) Afficher les récoltes triées par date
select * from recoltes
order by date_recolte asc;

-- d) Afficher les récoltes entre le 1er octobre et le 31 octobre 2024
select * from recoltes
where date_recolte between '2024-10-01' and '2024-10-31';

-- e) Récoltes de qualité A OU B
select * from recoltes
where qualite in ('A','B');

-- f) Récoltes de qualité A ET plus de 250 kg
select *from recoltes
where qualite = 'A' and quantite_kg > 250;

-- g) Récoltes du producteur 1 ou 3
select * from recoltes
where producteur_id in (1,3);

-- h) Calculer la valeur totale de chaque récolte
SELECT id,
       quantite_kg,
       prix_kg_fcfa,
       quantite_kg * prix_kg_fcfa AS valeur_totale_fcfa
FROM recoltes
ORDER BY valeur_totale_fcfa DESC;
