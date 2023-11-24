-- Afficher les cinq premières lignes de la table 'cars'
SELECT * FROM cars LIMIT 5;

-- Afficher les cinq premières lignes de la table 'consumers'
SELECT * FROM consumers LIMIT 5;

### REPONSES AUX QUESTIONS : 

-- Question a
SELECT c."Country", c."Model", COUNT(*) as "TotalCars"
FROM "consumers" c
JOIN "cars" d ON c."Make" = d."Make" AND c."Model" = d."Model" AND c."Year" = d."Year"
GROUP BY c."Country", c."Model";

-- Question b
WITH RankedCountries AS (
    SELECT
        c."Country",
        c."Model",
        COUNT(*) AS "TotalCars",
        ROW_NUMBER() OVER (PARTITION BY c."Model" ORDER BY COUNT(*) DESC) AS "RowNum"
    FROM
        "consumers" c
        JOIN "cars" d ON c."Make" = d."Make" AND c."Model" = d."Model" AND c."Year" = d."Year"
    GROUP BY
        c."Model", c."Country"
)
SELECT
    "Model",
    "Country" AS "TopCountry"
FROM
    RankedCountries
WHERE
    "RowNum" = 1;

-- Question c
SELECT DISTINCT "Model"
FROM "consumers"
WHERE "Country" = 'USA'
AND "Model" NOT IN (
    SELECT DISTINCT "Model"
    FROM "consumers"
    WHERE "Country" = 'France'
);

-- Question d
SELECT c."Country", d."Make", d."Model", d."Engine Type", AVG(d."Price") AS "AveragePrice"
FROM "consumers" c
JOIN "cars" d ON c."Make" = d."Make" AND c."Model" = d."Model" AND c."Year" = d."Year"
GROUP BY c."Country", d."Make", d."Model", d."Engine Type";

-- Question e

-- Note moyenne des voitures électriques
SELECT AVG(c."Review Score") as "AverageScoreElectric"
FROM "consumers" c
JOIN "cars" d ON c."Make" = d."Make" AND c."Model" = d."Model" AND c."Year" = d."Year"
WHERE d."Engine Type" = 'Electric';

-- Note moyenne des voitures thermiques
SELECT AVG(c."Review Score") as "AverageScoreThermal"
FROM "consumers" c
JOIN "cars" d ON c."Make" = d."Make" AND c."Model" = d."Model" AND c."Year" = d."Year"
WHERE d."Engine Type" = 'Thermal';
