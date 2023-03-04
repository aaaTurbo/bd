CREATE TABLE characteristics (
                         id     bigint primary key,
                         value  varchar unique
);

CREATE TABLE humans (
                        id     serial primary key,
                        name  varchar,
                        surname varchar,
                        characteristic_ID bigint REFERENCES characteristics
);

CREATE TABLE manipulators (
                              id bigint primary key,
                              name varchar unique,
                              type varchar
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

INSERT INTO characteristics (id, value) values
                            (1, 'умелый'),
                            (2, 'метровая труба, заканчивающаяся башмаком, вроде тех, на которые приземляются межпланетные аппараты'),
                            (3, 'раздвигается в несколько раз, похож на помело и непростой в обращении');
                            
INSERT INTO humans (name, surname, characteristic_id)  values
                   ('Letchik', 'Pilotov', 1);
                   
INSERT INTO manipulators (id, name, type)  values
                         (1, 'MP0432', 'универсальный');
                         
INSERT INTO states (id, value, characteristic_id, manipulator_id)  values
                   (1, 'сложенный', 2, 1),
                   (2, 'разложенный', 3, 1);
                  
INSERT INTO operator (humans_id, manipulator_id)  values
                     (1, 1);
