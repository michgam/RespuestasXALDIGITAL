USE Aerolinea; 
CREATE TABLE Aerolineas (ID_AEROLINEA int PRIMARY KEY, NOMBRE_AEROLINEA varchar(40)); 
CREATE TABLE Aeropuertos (ID_AEROPUERTO int PRIMARY KEY, NOMBRE_AEROPUERTO varchar(40)); 
CREATE TABLE Movimientos (ID_MOVIMIENTO int PRIMARY KEY, DESCRIPCION varchar(40));

CREATE TABLE Vuelos (ID_AEROLINEA int, ID_AEROPUERTO int, ID_MOVIMIENTO int, DIA date);


INSERT INTO Aerolineas VALUES (1,'Volaris'),(2,'Aeromar'), (3, 'Interjet'),(4,'Aeromexico');
INSERT INTO Aeropuertos VALUES (1,'Benito Juarez'),(2,'Guanajuato'), (3, 'La paz'),(4,'Oaxaca');
INSERT INTO Movimientos VALUES (1,'Salida'),(2,'Llegada');
SELECT * FROM Movimientos;


ALTER TABLE Vuelos ADD CONSTRAINT FK_IDAEROLINEA foreign key (ID_AEROLINEA) REFERENCES Aerolineas(ID_AEROLINEA);
ALTER TABLE Vuelos ADD CONSTRAINT FK_IDAEROPUERTO foreign key (ID_AEROPUERTO) REFERENCES Aeropuertos(ID_AEROPUERTO);
ALTER TABLE Vuelos ADD CONSTRAINT FK_IDMOVIMIENTO foreign key (ID_MOVIMIENTO) REFERENCES Movimientos(ID_MOVIMIENTO);

describe Vuelos;

INSERT INTO Vuelos VALUES (1,1,1,'2021-05-02');
INSERT INTO Vuelos VALUES (2,1,1,'2021-05-02');
INSERT INTO Vuelos VALUES (3,2,2,'2021-05-02');
INSERT INTO Vuelos VALUES (4,3,2,'2021-05-02');
INSERT INTO Vuelos VALUES (1,3,2,'2021-05-02');
INSERT INTO Vuelos VALUES (2,1,1,'2021-05-02');

INSERT INTO Vuelos VALUES (2,3,1,'2021-05-04');
INSERT INTO Vuelos VALUES (3,4,1,'2021-05-04');
INSERT INTO Vuelos VALUES (3,4,1,'2021-05-04');


/*RESPUESTAS RETO 1*/
/*QUERY PREGUNTA 1*/
select Aero.NOMBRE_AEROPUERTO FROM Aeropuertos as Aero JOIN Vuelos as Vuelo 
ON Vuelo.ID_AEROPUERTO=Aero.ID_AEROPUERTO 
 order by count(*) DESC;
/*QUERY PREGUNTA 2*/

select Aeroline.NOMBRE_AEROLINEA FROM Aerolineas as Aeroline JOIN Vuelos as Vuelo 
ON Vuelo.ID_AEROLINEA=Aeroline.ID_AEROLINEA
 order by count(*) DESC;
 
 /* QUERY PREGUNTA 3*/ 
Select DIA as DIA from Vuelos order by count(*);
 
 /* QUERY PREGUNTA 4 */

select Aeroline.NOMBRE_AEROLINEA FROM Aerolineas as Aeroline INNER JOIN Vuelos as Vuelo ON count(Vuelo.DIA)>1;

select ID_AEROLINEA, count(DIA)>=2 from Vuelos group by ID_AEROLINEA;

select Aeroline.NOMBRE_AEROLINEA  FROM Aerolineas as Aeroline JOIN Vuelos as Vuelo 
ON Vuelo.ID_AEROLINEA=Aeroline.ID_AEROLINEA group by Aeroline.NOMBRE_AEROLINEA
Having count(Vuelo.DIA)>2;


 


 
 





