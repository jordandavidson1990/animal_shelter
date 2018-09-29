DROP TABLE IF EXISTS adoptions;
DROP TABLE IF EXISTS owners;
DROP TABLE IF EXISTS pets;


CREATE TABLE owners
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) not null
);

CREATE TABLE pets
(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255) not null,
  age INT2,
  type VARCHAR(255),
  breed VARCHAR(255),
  admission_date VARCHAR(255)
);

CREATE TABLE adoptions
(
  id SERIAL4 PRIMARY KEY,
  owner_id INT4 REFERENCES owners(id) ON DELETE CASCADE,
  pet_id INT4 REFERENCES pets(id) ON DELETE CASCADE
);
