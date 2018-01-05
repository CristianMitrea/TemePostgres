-- Cerinte

-- C1


-- Database: "7Cristian"

-- DROP DATABASE "7Cristian";

CREATE DATABASE "7Cristian"
  WITH OWNER = fasttrackit_dev
       ENCODING = 'UTF8'
       TABLESPACE = pg_default
       LC_COLLATE = 'en_US.UTF-8'
       LC_CTYPE = 'en_US.UTF-8'
       CONNECTION LIMIT = -1;


-- Table: users

-- DROP TABLE users;

CREATE TABLE users
(
  iduser bigserial NOT NULL,
  username character(20),
  parola character(20) NOT NULL,
  varsta integer,
  orasul character(30),
  blocat boolean NOT NULL,
  CONSTRAINT pkuser PRIMARY KEY (iduser)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE users
  OWNER TO fasttrackit_dev;

  
-- Table: postare

-- DROP TABLE postare;

CREATE TABLE postare
(
  idpostare bigserial NOT NULL,
  mesaj character(200),
  data_postarii date,
  fkuser bigint,
  CONSTRAINT pk PRIMARY KEY (idpostare),
  CONSTRAINT fk FOREIGN KEY (fkuser)
      REFERENCES users (iduser) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE postare
  OWNER TO fasttrackit_dev;
  
-- Adding Users
INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('IronMan', 'FlyF@st', '29', 'Seattle', '0');

INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('Ionel', 'Alg0ritmic', '25', 'Cluj', '0');

INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('Ticris', 'PreQuel', '43', 'Turda', '0');

INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('Tyson', 'PunchH@rd', '38', 'Dej', '1');

INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('Trump', 'R3t@rd', '71', 'Washington DC', '1');

INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('Donald', 'Gr33nF@t', '26', 'Dej', '0');

INSERT INTO users (username, parola, varsta, orasul, blocat)
VALUES ('IronMan', 'Zb0ar@', '15', 'Cluj', '0'); 

-- Adding Postings

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Sept 01, 2017 Ironman din Seattle', '2017-09-01', '2');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Oct 05, 2017 Ironman din Seattle', '2017-10-05', '2');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Oct 13, 2017 Ironman din Seattle', '2017-10-13', '2');

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Sept 01, 2017 Ionel', '2017-09-01', '3');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Oct 05, 2017 Ionel', '2017-10-05', '3');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Oct 13, 2017 Ionel', '2017-10-13', '3');

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Jan 01, 2017 Ticris', '2017-01-01', '4');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Feb 05, 2017 Ticris', '2017-02-05', '4');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Aug 23, 2017 Ticris', '2017-08-23', '4');

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Jan 01, 2017 Tyson', '2017-01-01', '5');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare May 05, 2017 Tyson', '2017-05-05', '5');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare June 26, 2017 Tyson', '2017-06-26', '5');

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare politica June 26, 2017 Trump', '2017-06-26', '6');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare nepolitica Oct 05, 2017 Trump', '2017-10-05', '6');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare  Politica Nov 11, 2017 Trump', '2017-11-11', '6');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare  Jan 05, 2018 Trump', '2018-01-05', '6');

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare March 02, 2016 Donald', '2016-03-02', '7');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare March 15, 2016 Donald', '2016-03-15', '7');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare March 26, 2016 Donald', '2017-03-26', '7');

INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare politica Sept 01, 2017 Ironman Cluj', '2017-09-01', '8');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare aPOlitica Oct 05, 2017 Ironman Cluj', '2017-10-05', '8');
INSERT INTO postare (mesaj, data_postarii, fkuser)
VALUES ('Postare Oct 13, 2017 Ironman Cluj', '2017-10-13', '8');

-- C2 - sa se afiseze toate postarile lui Ionel
SELECT mesaj, data_postarii, username FROM postare
INNER JOIN users ON postare.fkuser = users.iduser
WHERE users.username = 'Ionel';

-- C3 - sa se afiseze toti userii
SELECT * FROM users;

-- C4 - sa se afiseze toti userii neblocati
SELECT * FROM users
WHERE blocat = false;

-- C5 - sa se afiseze userul cu varsta cea mai mica
--v1
SELECT *
FROM users
WHERE varsta =  ( SELECT MIN(varsta) FROM users );

--v2
SELECT * FROM users
ORDER BY varsta
LIMIT 1;

-- C6 - sa se afiseze userii cu varsta intre 23 si 33 ordonati dupa varsat
SELECT * FROM users
WHERE varsta BETWEEN 23 AND 33
ORDER BY varsta;

-- C7 - media varstei userilor blocati
SELECT AVG(varsta) FROM users
WHERE blocat = true;

-- C8 - useri neblocati din Dej
SELECT * FROM users
WHERE orasul = 'Dej' AND blocat=false;

-- C9 - postarile userilor neblocati din Turda cu varsta > 40
SELECT mesaj, data_postarii, username FROM postare
INNER JOIN users ON postare.fkuser = users.iduser
WHERE users.orasul='Turda' AND users.varsta>40 AND users.blocat=false;

-- C10 - userul cu cele mai multe postari
SELECT username, COUNT(postare.mesaj) FROM users
INNER JOIN postare ON users.iduser=postare.fkuser
GROUP BY users.username
ORDER BY COUNT(postare.mesaj) DESC
LIMIT 1;

-- C11 - postarile userilor ce incep cu D si postate intre 1-31 martie 2016
SELECT mesaj, data_postarii, username FROM postare
INNER JOIN users ON postare.fkuser = users.iduser
WHERE users.username LIKE 'D%' AND postare.data_postarii BETWEEN '2016-03-01' AND '2016-03-31';

-- C12 - toate postarile ordonate descendent dupa data postarii
SELECT * FROM postare
ORDER BY data_postarii DESC;

-- C13 - stergerea postarilor userilor < 18 ani ce contin 'politica'
DELETE FROM postare
WHERE LOWER(mesaj) LIKE '%politica%' AND fkuser IN (SELECT iduser FROM users where varsta<18);
