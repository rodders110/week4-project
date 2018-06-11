DROP TABLE  IF EXISTS inventory;
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS stock;


CREATE TABLE stock (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE manufacturers (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255),
  address TEXT
);

CREATE TABLE inventory (
  id SERIAL4 PRIMARY KEY,
  stock_id INT4 REFERENCES stock(id) ON DELETE CASCADE,
  manufacturers_id INT4 REFERENCES manufacturers(id) ON DELETE CASCADE,
  volume INT
);
