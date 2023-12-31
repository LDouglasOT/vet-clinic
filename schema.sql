/* Database schema to keep the structure of entire database. */

PSQL
CREATE DATABASE vet_clinic /* Creating vet clinic database */
\c vet_clinc /* Connect to the vet_clinic db using psql*/
CREATE TABLE animals (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE,
    escape_attempts INTEGER,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);
/* Create column called species */
ALTER TABLE animals
ADD species VARCHAR(255);


psql
/c mydatabases
CREATE TABLE owner (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);
SELECT * FROM animals;

ALTER TABLE animals
DROP COLUMN species;
SELECT * FROM animals;

ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owner(id);
SELECT * FROM animals;

ALTER TABLE animals
ADD COLUMN owner_id INTEGER REFERENCES owner(id);
SELECT * FROM animals;


CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INT,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INT,
  species_id INT,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);

CREATE TABLE visits (
  vet_id INT,
  animal_id INT,
  visit_date DATE,
  PRIMARY KEY (vet_id, animal_id, visit_date),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (animal_id) REFERENCES animals(id)
);
CREATE INDEX idx_email ON owners (email);
CREATE INDEX idx_animal ON visits(animal_id);
CREATE INDEX idx_vet_id ON visits (vet_id);


