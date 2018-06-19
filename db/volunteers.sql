DROP TABLE bookings;
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
  volunteer_list integer ARRAY[4],
  capacity INT4
);

CREATE TABLE bookings(
  id SERIAL4 PRIMARY KEY,
  volunteer_id INT4 references volunteers(id) ON DELETE CASCADE,
  project_id INT4 references projects(id) ON DELETE CASCADE
);
