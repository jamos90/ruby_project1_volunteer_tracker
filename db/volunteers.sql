DROP TABLE bookings;
DROP TABLE special_bookings;
DROP TABLE special_projects;
DROP TABLE projects;
DROP TABLE volunteers;

CREATE TABLE volunteers(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  specialism VARCHAR(255),
  age INT4
);

CREATE TABLE projects(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  location VARCHAR(255),
  specialism_required VARCHAR(255),
  age_requirement INT4,
  capacity INT4
);

CREATE TABLE special_projects(
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  type VARCHAR(255),
  location VARCHAR(255),
  specialism_required VARCHAR(255),
  age_requirement INT4,
  capacity INT4
);

CREATE TABLE bookings(
  id SERIAL4 PRIMARY KEY,
  volunteer_id INT4 references volunteers(id) ON DELETE CASCADE,
  project_id INT4 references projects(id) ON DELETE CASCADE
);

CREATE TABLE special_bookings(
  id SERIAL4 PRIMARY KEY,
  volunteer_id INT4 references volunteers(id) ON DELETE CASCADE,
  special_project_id INT4 references special_projects(id) ON DELETE CASCADE
);
