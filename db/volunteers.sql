DROP TABLE projects;
DROP TABLE volunteers;

CREATE TABLE volunteers(
  id SERIAL4,
  name VARCHAR(255),
  specilsm VARCHAR(255)
);

CREATE TABLE projects(
  id SERIAL4,
  name VARCHAR(255),
  type VARCHAR(255),
  location VARCHAR(255),
  specilsm_required VARCHAR(255)
);
