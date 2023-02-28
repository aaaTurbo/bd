CREATE TABLE states (
                   id     bigint primary key,
                   state  varchar unique,
                   object_ID bigint
               );

CREATE TABLE objects (
                   id     bigint primary key,
                   name  varchar unique,
                   association_id bigint,
                   permanent_characteristic_ID varchar
               );

CREATE TABLE associations (
                   id bigint primary key,
                   value varchar unique
               );

CREATE TABLE characteristics (
                   id bigint primary key,
                   value varchar unique ,
                   status_Id bigint
               );

INSERT INTO states
values (1, 'сложенный', 1), (2, 'разложенный', 1), (3, 'нажата', 2);

INSERT INTO objects
values (1, 'труба', 1),
       (2, 'кнопка'),
       (3, 'оператор'),
       (4, 'аппарат'),
       (5, 'накопитель'),
       (6, 'трюк'),
       (7, 'клешня'),
       (8, 'крюк'),
       (9, 'хитрость');
       
INSERT INTO associations
values (1, 'помело');   

insert into characteristics values (1, 'умелый');
