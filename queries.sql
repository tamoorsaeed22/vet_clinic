/*Queries that provide answers to the questions from all projects.*/

 SELECT * FROM animals WHERE  name LIKE '%mon';
 SELECT name FROM  animals WHERE   date_of_birth BETWEEN '2016-01-01'  AND '2019-12-31';
SELECT  name FROM animals WHERE  neutered = TRUE AND escape_attempts < 3;
SELECT  name FROM animals WHERE  neutered = TRUE AND escape_attempts < 3;
SELECT  date_of_birth FROM animals WHERE  (  name = 'Agumon'  OR name = 'Pikachu'  );
 SELECT  name, escape_attempts FROM animals WHERE weight_kg > 10.5;
  SELECT * FROM animals WHERE neutered = TRUE;
  SELECT * FROM animals WHERE name != 'Gabumon';
   SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3;
  -- Beginning a transaction
BEGIN;

UPDATE
    animals
SET
    species = 'unspecified';

-- Verifying that change was made
SELECT
    *
FROM
    animals;

-- Roll Back the change
ROLLBACK;

-- verifying that the species columns went back to the state before the transaction.
SELECT
    *
FROM
    animals;

UPDATE
    animals
SET
    species = 'digimon'
WHERE
    name LIKE '%mon';

UPDATE
    animals
SET
    species = 'pokemon'
WHERE
    species IS NULL;

BEGIN;

-- Deleting all records
DELETE FROM
    animals;

-- rolling back the transaction.
ROLLBACK;

DELETE FROM
    animals
WHERE
    date_of_birth > 'Jan 1, 2022';

SAVEPOINT SP1;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1;

ROLLBACK TO SP1;

UPDATE
    animals
SET
    weight_kg = weight_kg * -1
WHERE
    weight_kg < 0;

COMMIT;

SELECT
    COUNT(*)
FROM
    animals;

SELECT
    COUNT(*)
FROM
    animals
WHERE
    escape_attempts = 0;

SELECT
    AVG(weight_kg)
FROM
    animals;

SELECT
    MAX(escape_attempts),
    neutered
FROM
    animals
GROUP BY
    neutered;

SELECT
    MIN(weight_kg)
FROM
    animals;

SELECT
    MAX(weight_kg)
FROM
    animals;

SELECT
    AVG(escape_attempts)
FROM
    animals
WHERE
    date_of_birth BETWEEN 'Jan 01,1990'
    AND 'Dec 31,2000';

SELECT
    name
FROM
    animals
    INNER JOIN owners ON animals.owner_id = owners.full_name
WHERE
    animals.owner_id = 'Melody Pond';

SELECT
    animals.name
FROM
    animals
    INNER JOIN species ON animals.species_id = species.name
WHERE
    animals.species_id = 'Pokemon';

SELECT
    full_name,
    name
FROM
    animals
    RIGHT JOIN owners ON animals.owner_id = owners.full_name;

SELECT
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.full_name
WHERE
    animals.species_id = 'Digimon'
    AND owners.full_name = 'Jennifer Orwell';

SELECT
    animals.name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.full_name
WHERE
    animals.escape_attempts = 0
    AND owners.full_name = 'Dean Winchester';

SELECT
    full_name
FROM
    animals
    JOIN owners ON animals.owner_id = owners.full_name
GROUP BY
    full_name
ORDER BY
    COUNT(animals.owner_id) DESC
LIMIT
    1;

SELECT
    animals.species_id,
    COUNT(animals.species_id) AS animals
FROM
    animals
    JOIN species ON animals.species_id = species.name
GROUP BY
    animals.species_id;
