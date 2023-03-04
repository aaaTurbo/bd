CREATE TABLE characteristics (
                         id     serial primary key,
                         value  varchar unique
);

CREATE TABLE humans (
                        id     serial primary key,
                        name  varchar,
                        surname varchar,
                        characteristic_ID bigint REFERENCES characteristics
);

CREATE TABLE manipulators (
                              id serial primary key,
                              name varchar unique,
                              type varchar
);

CREATE TABLE states (
                              id serial primary key,
                              value varchar unique,
                              characteristic_ID bigint REFERENCES characteristics,
                              manipulator_ID bigint REFERENCES manipulators
);

CREATE TABLE operator (
                            humans_ID  INTEGER REFERENCES humans,
                            manipulator_ID INTEGER REFERENCES manipulators,
                            PRIMARY KEY (humans_ID, manipulator_ID)
);

INSERT INTO characteristics (value) values
                                          ('метровая труба, заканчивающаяся башмаком, вроде тех, на которые приземляются межпланетные аппараты'),
                                          ('раздвигается в несколько раз, похож на помело и непростой в обращении');

INSERT INTO humans (name, surname, characteristic_id)  values
                   ('Letchik', 'Pilotov', 1);

INSERT INTO manipulators (name, type)  values
    ('MP0432', 'универсальный');

INSERT INTO states (value, characteristic_id, manipulator_id)  values
    ('сложенный', 1, 1),
    ('разложенный', 2, 1);

INSERT INTO operator (humans_id, manipulator_id)  values
                     (1, 1);

SELECT human.name, human.surname, manipulator.name, state.value, characteristic.value FROM operator
    INNER JOIN manipulators manipulator on operator.manipulator_id = manipulator.id
    INNER JOIN humans human on operator.humans_id = human.id
    INNER JOIN states state on operator.manipulator_id = state.manipulator_id
    INNER JOIN characteristics characteristic on state.characteristic_id = characteristic.id
