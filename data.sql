/* Populate database with sample data. */

INSERT INTO
    animals (
        name,
        date_of_birth,
        escape_attempts,
        neutered,
        weight_kg
    )
VALUES
    ('Agumon', '2020-02-03', 0, TRUE, 10.23),
    ('Gabumon', '2018-11-15', 2, TRUE, 8),
    ('Pikachu', '2021-01-07', 1, FALSE, 15.04),
    ('Devimon', '2017-05-12', 5, TRUE, 11);

INSERT INTO
 animals (
        name,
        date_of_birth,
        weight_kg,
        neutered,
        escape_attempts
    )
    VALUES
    ('Charmander', 'Feb 8, 2020', -11, FALSE, 0),
    ('Plantmon', 'Nov 15, 2021', -5.7, TRUE, 2),
    ('Squirtle', 'Apr 2,1993', -12.13, FALSE, 3),
    ('Angemon', 'Jun 12 2005', -45, TRUE, 1),
    ('Boarmon', 'Jun 7, 2005', 20.4, TRUE, 7),
    ('Blossom', 'Oct 13, 1998', 17, TRUE, 3),
    ('Ditto', 'May 14, 2022', 22, TRUE, 4);

    -- inserting data into owners table

INSERT INTO owners (full_name, age)
VALUES ('Sam Smith', 34),
    ('Jennifer Orwell', 19),
    ('Bob', 45),
    ('Melody Pond', 77),
    ('Dean Winchester', 14),
    ('Jodie Whittaker', 38);

    -- inserting data into species table 

INSERT INTO species (name)
VALUES ('Pokemon'),
       ('Digimon');

       -- Modifying inserted animals so it includes the species_id:
-- if the name ends in "mon" it will be Digimon
UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Digimon') WHERE name LIKE '%mon';

-- all other animals are Pokemon

UPDATE animals SET species_id = (SELECT id FROM species WHERE name = 'Pokemon') WHERE species_id IS NULL;

-- Modify your inserted animals to include owner information (owner_id):

-- Sam Smith owns Agumon

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Sam Smith' LIMIT 1) WHERE name = 'Agumon';

-- Jennifer Orwell owns Gabumon and Pikachu

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Jennifer Orwell' LIMIT 1) WHERE name = 'Gabumon' OR name = 'Pikachu';

-- Bob owns Devimon and Plantmon

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Bob' LIMIT 1) WHERE name = 'Devimon' OR name = 'Plantmon';

-- Melody Pond owns Charmander, Squirtle, Blossom

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Melody Pond' LIMIT 1) WHERE name = 'Charmander' OR name = 'Squirtle' OR name = 'Blossom';

-- Dean Winchester owns Angemon and Boarmon

UPDATE animals SET owner_id = (SELECT id FROM owners WHERE full_name = 'Dean Winchester' LIMIT 1) WHERE name = 'Angemon' OR name = 'Boarmon';