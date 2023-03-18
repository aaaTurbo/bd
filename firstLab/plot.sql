CREATE TABLE humans
(
    id   serial primary key,
    name varchar
);

CREATE TABLE manipulators
(
    id   serial primary key,
    name varchar unique
);

CREATE TABLE parts
(
    id  serial primary key ,
    name varchar,
    functional varchar,
    manipulator_id bigint REFERENCES manipulators
);

CREATE TABLE states
(
    id             serial primary key,
    name           varchar unique,
    manipulator_ID bigint REFERENCES manipulators
);

CREATE TABLE endings
(
    id             serial primary key,
    name           varchar,
    state_ID bigint REFERENCES states
);

CREATE TABLE characteristics
(
    id       serial primary key,
    value    varchar unique,
    state_id bigint REFERENCES states
);

CREATE TABLE operator
(
    humans_ID      INTEGER REFERENCES humans,
    manipulator_ID INTEGER REFERENCES manipulators,
    PRIMARY KEY (humans_ID, manipulator_ID)
);

INSERT INTO humans (name)
values ('Letchik');

INSERT INTO manipulators (name)
values ('1st');

INSERT INTO parts (name, functional, manipulator_id)
values ('кнопка', 'разложить манипулятор', 1), ('накопители импульса', 'управление', 1);

INSERT INTO states (name, manipulator_ID)
values ('сложенный', 1),
       ('разложенный', 1);

INSERT INTO endings (name, state_ID)
values ('клешня', 2),
       ('крюк', 2),
       ('башмак', 2),
       ('башмак', 1);

INSERT INTO characteristics (value, state_id)
values ('метровая труба', 1),
       ('заканчивающаяся башмаком', 1),
       ('вроде тех, на которые приземляются межпланетные аппараты', 1),
       ('раздвигается в несколько раз', 2),
       ('похож на помело', 2),
       ('непростой в обращении', 2);

INSERT INTO operator (humans_id, manipulator_id)
values (1, 1);

SELECT human.name, manipulator.name, state.name, characteristic.value, ending.name
FROM operator
         INNER JOIN manipulators manipulator on operator.manipulator_id = manipulator.id
         INNER JOIN humans human on operator.humans_id = human.id
         INNER JOIN states state on operator.manipulator_id = state.manipulator_id
         INNER JOIN characteristics characteristic on characteristic.state_id = state.id
         LEFT JOIN endings ending on state.id = ending.state_ID
