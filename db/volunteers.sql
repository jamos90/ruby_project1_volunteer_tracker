DROP TABLE bookings;
DROP TABLE projects;
DROP TABLE volunteers;

CREATE TABLE volunteers(
  id SERIAL4 PRIMARY KEY ON DELETE CASCADE,
  name VARCHAR(255),
  specilsm VARCHAR(255),
  age INT4
);

CREATE TABLE projects(
  id SERIAL4 PRIMARY KEY ON DELETE CASCADE,
  name VARCHAR(255),
  type VARCHAR(255),
  location VARCHAR(255),
  specilsm_required VARCHAR(255),
  age_requirement INT4
);

CREATE TABLE bookings(
  id SERIAL4 PRIMARY KEY,
  volunteer_id INT4 references volunteers(id) ON DELETE CASCADE,
  project_id INT4 references projects(id) ON DELETE CASCADE
);
