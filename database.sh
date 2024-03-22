CREATE TABLE IF NOT EXISTS person (
id INTEGER PRIMARY KEY AUTOINCREMENT,
name TEXT NOT NULL,
old INTEGER,
height_cm INTEGER,
nationality TEXT,
rooms_id INTEGER NOT NULL,
FOREIGN KEY (rooms_id) REFERENCES room (id)
);
CREATE TABLE IF NOT EXISTS room (
id INTEGER PRIMARY KEY AUTOINCREMENT,
size INTEGER,
maze_id INTEGER NOT NULL,
FOREIGN KEY (maze_id) REFERENCES maze (id)
);
CREATE TABLE IF NOT EXISTS note (
id INTEGER PRIMARY KEY AUTOINCREMENT,
height_cm INTEGER,
width_cm INTEGER,
data_created DATE,
pen TEXT,
rooms_id INTEGER NOT NULL,
owner_id INTEGER NOT NULL,
FOREIGN KEY (rooms_id) REFERENCES room (id),
FOREIGN KEY (owner_id) REFERENCES person (id)
);
CREATE TABLE IF NOT EXISTS photo (
id INTEGER PRIMARY KEY AUTOINCREMENT,
height_cm INTEGER,
width_cm INTEGER,
data_created DATE,
camera TEXT,
rooms_id INTEGER NOT NULL,
owner_id INTEGER NOT NULL,
FOREIGN KEY (rooms_id) REFERENCES room (id),
FOREIGN KEY (owner_id) REFERENCES person (id)
);
CREATE TABLE IF NOT EXISTS maze (
id INTEGER PRIMARY KEY AUTOINCREMENT,
country TEXT,
level TEXT,
data_created DATE,
person_id INTEGER NOT NULL,
FOREIGN KEY (person_id) REFERENCES person (id)
);
CREATE TABLE IF NOT EXISTS map (
id INTEGER PRIMARY KEY AUTOINCREMENT,
paper TEXT,
size INTEGER,
maze_id INTEGER NOT NULL,
FOREIGN KEY (maze_id) REFERENCES maze (id)
);
CREATE TABLE IF NOT EXISTS history (
data_visit DATE,
maze_id INTEGER NOT NULL,
person_id INTEGER NOT NULL,
FOREIGN KEY (maze_id) REFERENCES maze (id),
FOREIGN KEY (person_id) REFERENCES person (id)
);

INSERT INTO maze (id, country, level, create_date) VALUES (1, 'Russia', 'middle', '1978-09-25'),(2, 'France', 'easy', '2005-05-27' ),(3, 'Italia', 'hard', '2012-09-08');
INSERT INTO room (id, size, maze_id) VALUES (1, 38, 2),(2, 45, 2),(3, 59, 1), (4, 80, 3);
INSERT INTO person (id, name, old, height_cm, nationality, rooms_id) VALUES (1, 'Alex', 17, 184, 'Russia', 2),(2, 'Maria', 25, 175, 'France', 3),(3, 'Max', 20, 190, 'Russia', 1), (4, 'Andrey', 38, 194, 'Russia', 2);
INSERT INTO history (data_visit, person_id, maze_id) VALUES ('2010-04-04', 1, 2),('2012-09-18', 3, 2),('2018-11-04', 1, 3), ('2017-09-08', 2, 1);
INSERT INTO map (id, paper, size, maze_id) VALUES (1, 'white', 15, 1),(2, 'yellow', 21, 2),(3, 'blue', 19, 3);
INSERT INTO note (id, height_cm, width_cm, data_created, pen, owner_id, room_id) VALUES (1, 15, 20, '2010-04-04', 'blue', 1, 1),(2, 25, 30, '2012-09-18', 'pencil', 3, 2);
INSERT INTO photo (id, height_cm, width_cm, data_created, camera, owner_id, room_id)
 VALUES (1, 15, 20, '2018-11-04', 'huawei', 1, 4),(2, 25, 30, '2017-09-08', 'apple', 2, 3);