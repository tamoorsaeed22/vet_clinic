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

-- write queries (using JOIN) to answer the follwing questions:

-- what animals belong to Melody Pond ?

SELECT full_name AS OWNER, name AS ANIMALS_NAMES FROM owners O JOIN animals A ON O.id = A.owner_id WHERE full_name = 'Melody Pond';

-- List of all animals that are pokemon(their type is Pokemon)

SELECT A.name AS ANIMAL_NAMES, S.name AS SPECIES_TYPE FROM species S JOIN animals A ON S.id = A.species_id WHERE S.name = 'Pokemon';

-- List all owners and their animals, remember to include those that don't own any animal

SELECT O.full_name AS OWNER, A.name AS ANIMAL_NAMES FROM owners O LEFT JOIN animals A ON O.id = A.owner_id;

-- How many animals are there per species ?

SELECT S.name AS SPECIES_TYPE, COUNT(A.name) AS NUMBER_PER_SPECIES FROM species S JOIN animals A ON S.id = A.species_id GROUP BY S.name;

-- List all Digimon owned by Jennifer Orwell

SELECT O.full_name AS OWNER, A.name AS ANIMAL_NAMES, S.name AS SPECIES_TYPE FROM owners O JOIN animals A ON O.id = A.owner_id 
JOIN species S ON S.id = A.species_id WHERE O.full_name = 'Jennifer Orwell' AND S.name = 'Digimon';

-- List all animals owned by Dean Winchester that haven't tried to escape

SELECT owners.full_name AS OWNER, animals.name AS ANIMAL_NAMES, animals.escape_attempts AS ESCAPE_ATTEMPTS FROM animals
JOIN owners ON owners.id = animals.owner_id WHERE owners.full_name = 'Dean Winchester' AND animals.escape_attempts = 0;

-- Who owns the most animals ?

SELECT O.full_name AS OWNER, COUNT(a.name) AS TOTAL_ANIMALS FROM owners AS O LEFT JOIN animals AS A
ON A.owner_id = O.id GROUP BY O.full_name ORDER BY COUNT(A.name) DESC LIMIT 1;