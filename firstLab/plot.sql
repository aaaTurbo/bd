CREATE TABLE characteristics (
                         id     bigint primary key,
                         value  varchar unique
);

CREATE TABLE humans (
                        id     bigint primary key,
                        name  varchar,
                        surname varchar,
                        characteristic_ID bigint REFERENCES characteristics
);

CREATE TABLE manipulators (
                              id bigint primary key,
                              name varchar unique
);

CREATE TABLE states (
                              id bigint primary key,
                              value varchar unique,
                              characteristic_ID bigint REFERENCES characteristics,
                              manipulator_ID bigint REFERENCES manipulators
);

CREATE TABLE operator (
                            humans_ID  INTEGER REFERENCES humans,
                            manipulator_ID INTEGER REFERENCES manipulators,
                            PRIMARY KEY (humans_ID, manipulator_ID)
);
