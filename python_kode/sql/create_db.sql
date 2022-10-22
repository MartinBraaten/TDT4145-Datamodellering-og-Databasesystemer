-- SQLite
-- DROP TABLE IF EXISTS user;
-- DROP TABLE IF EXISTS tasting;
-- DROP TABLE IF EXISTS coffee;
-- DROP TABLE IF EXISTS batch;
-- DROP TABLE IF EXISTS refinery;
-- DROP TABLE IF EXISTS bean_batch;
-- DROP TABLE IF EXISTS bean;
-- DROP TABLE IF EXISTS farm;
-- DROP TABLE IF EXISTS refinementMethod;
-- DROP TABLE IF EXISTS bean_farm;

CREATE TABLE IF NOT EXISTS user (
	email VARCHAR(30) PRIMARY KEY,
	password VARCHAR(30) NOT NULL,
	name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS tasting (
  tastingId INTEGER PRIMARY KEY AUTOINCREMENT,
  email VARCHAR(30) NOT NULL REFERENCES user(email),
  coffeeId INTEGER NOT NULL REFERENCES coffee(coffeeId),
  date DATE NOT NULL,
  notes TEXT NOT NULL,
  points INTEGER NOT NULL CHECK (points BETWEEN 0 AND 10)
);

CREATE TABLE IF NOT EXISTS coffee (
  coffeeId INTEGER PRIMARY KEY AUTOINCREMENT,
  refineryId INTEGER REFERENCES refinery(refineryId),
  burningGrade VARCHAR(30) NOT NULL,
  date DATE NOT NULL,
  name VARCHAR(30) NOT NULL,
  description TEXT NOT NULL,
  price FLOAT NOT NULL,
  batchId INTEGER REFERENCES batch(batchId)
);

CREATE TABLE IF NOT EXISTS refinery (
  refineryId INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS batch (
  batchId INTEGER PRIMARY KEY AUTOINCREMENT,
  year INTEGER NOT NULL,
  price FLOAT NOT NULL,
  farmId INTEGER REFERENCES farm(farmId),
  refinementType VARCHAR(30) REFERENCES refinementMethod(refinementType)
);

CREATE TABLE IF NOT EXISTS bean_batch (
  beanId INTEGER REFERENCES bean(beanId),
  batchId INTEGER REFERENCES batch(batchId),
  PRIMARY KEY (beanId, batchId)
);

CREATE TABLE IF NOT EXISTS bean (
  beanId INTEGER PRIMARY KEY AUTOINCREMENT,
  species VARCHAR(30) NOT NULL,
  name VARCHAR(30) NOT NULL
);

CREATE TABLE IF NOT EXISTS bean_farm (
  beanId INTEGER REFERENCES bean(beanId),
  farmId INTEGER REFERENCES farm(farmId),
  PRIMARY KEY (beanId, farmId)
);

CREATE TABLE IF NOT EXISTS farm (
  farmId INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(30) NOT NULL,
  country VARCHAR(30) NOT NULL,
  region VARCHAR(30) NOT NULL,
  masl INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS refinementMethod (
  refinementType VARCHAR(30) PRIMARY KEY,
  description TEXT NOT NULL
);

