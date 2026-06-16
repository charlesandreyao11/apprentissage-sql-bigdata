-- SEMAINE 1 - JOUR 1 : Bases SQL
-- Auteur : YAO POKOU KOUAME CHARLES-ANDRE
-- Date   : 2026
-- Projet : Apprentissage Big Data Analytics


-- Création de la base de données
-- (créée directement dans DBeaver : cacao_ci)

-- Table producteurs 
CREATE TABLE producteurs (
    id               SERIAL PRIMARY KEY,
    nom              VARCHAR(100) NOT NULL,
    prenom           VARCHAR(100) NOT NULL,
    region           VARCHAR(50)  NOT NULL,
    superficie       DECIMAL(5,2),
    telephone        VARCHAR(20),
    date_inscription DATE DEFAULT CURRENT_DATE
);

-- Insertion des données
INSERT INTO producteurs (nom, prenom, region, superficie, telephone)
VALUES
    ('KOUASSI', 'Amani',   'Soubré',    3.5, '0701234567'),
    ('YAO',     'Kouamé',  'Daloa',     2.8, '0712345678'),
    ('KONÉ',    'Fatima',  'Gagnoa',    4.2, '0723456789'),
    ('BAMBA',   'Ibrahim', 'San-Pédro', 1.5, '0734567890'),
    ('DJAHI',   'Marie',   'Soubré',    5.0, '0745678901');

-- Requêtes SELECT

-- Tous les producteurs
SELECT * FROM producteurs;

-- Noms et régions seulement
SELECT nom, prenom, region FROM producteurs;

-- Producteurs de Soubré
SELECT * FROM producteurs
WHERE region = 'Soubré';

-- Triés par superficie décroissante
SELECT nom, prenom, superficie
FROM producteurs
ORDER BY superficie DESC;

-- Producteurs avec plus de 3 hectares
SELECT nom, prenom, region, superficie
FROM producteurs
WHERE superficie > 3.0
ORDER BY superficie DESC;