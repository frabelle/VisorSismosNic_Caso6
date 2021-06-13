CREATE EXTENSION postgis;

CREATE TABLE spatial.periodo
(
	id BIGSERIAL PRIMARY KEY,
	anio INTEGER
);

CREATE TABLE spatial.departamento
(
	id BIGSERIAL PRIMARY KEY,
	nombre VARCHAR(50)
);

CREATE TABLE spatial.sismos
(
	id BIGSERIAL PRIMARY KEY,
	magnitud FLOAT8,
	id_departamento INTEGER,
    profundida FLOAT8,
	id_periodo INTEGER,
	geom GEOMETRY(POINT, 4326)
);

/*Creación de Vistas*/

CREATE OR REPLACE VIEW spatial.RegistroSismos
 AS SELECT D.nombre "Departamento", S.magnitud "Magnitud", CONCAT(S.profundida, ' KM') "Profundidad", 
 	E.anio, S.geom "Ubicación" 
	FROM spatial.sismos S, spatial.departamento D, spatial.periodo E
		WHERE S.id_departamento=D.id AND S.id_periodo=E.id;

CREATE OR REPLACE VIEW spatial.Sismos2018
 AS SELECT D.nombre "Departamento", S.magnitud "Magnitud", CONCAT(S.profundida, ' KM') "Profundidad", 
 	E.anio, S.geom "Ubicación" 
	FROM spatial.sismos S, spatial.departamento D, spatial.periodo E
		WHERE S.id_departamento=D.id AND S.id_periodo=E.id AND E.anio=2018;
		
CREATE OR REPLACE VIEW spatial.Sismos2019
 AS SELECT D.nombre "Departamento", S.magnitud "Magnitud", CONCAT(S.profundida, ' KM') "Profundidad", 
 	E.anio, S.geom "Ubicación" 
	FROM spatial.sismos S, spatial.departamento D, spatial.periodo E
		WHERE S.id_departamento=D.id AND S.id_periodo=E.id AND E.anio=2019;
		
/*Consulta de datos*/

SELECT * FROM spatial.periodo;
SELECT * FROM spatial.departamento;
SELECT * FROM spatial.sismos;
SELECT * FROM spatial.RegistroSismos;
SELECT * FROM spatial.Sismos2018;
SELECT * FROM spatial.Sismos2019;

/*INSERT DE PERIODOS*/

INSERT INTO spatial.periodo (anio) VALUES(2018);
INSERT INTO spatial.periodo (anio) VALUES(2019);

/*INSERT DE DEPARTAMENTOS*/

INSERT INTO spatial.departamento (nombre) VALUES('Boaco');
INSERT INTO spatial.departamento (nombre) VALUES('Carazo');
INSERT INTO spatial.departamento (nombre) VALUES('Chinandega');
INSERT INTO spatial.departamento (nombre) VALUES('Chontales');
INSERT INTO spatial.departamento (nombre) VALUES('Costa Caribe Norte');
INSERT INTO spatial.departamento (nombre) VALUES('Costa Caribe Sur');
INSERT INTO spatial.departamento (nombre) VALUES('Estelí');
INSERT INTO spatial.departamento (nombre) VALUES('Granada');
INSERT INTO spatial.departamento (nombre) VALUES('Jinotega');
INSERT INTO spatial.departamento (nombre) VALUES('León');
INSERT INTO spatial.departamento (nombre) VALUES('Madriz');
INSERT INTO spatial.departamento (nombre) VALUES('Managua');
INSERT INTO spatial.departamento (nombre) VALUES('Masaya');
INSERT INTO spatial.departamento (nombre) VALUES('Matagalpa');
INSERT INTO spatial.departamento (nombre) VALUES('Nueva Segovia');
INSERT INTO spatial.departamento (nombre) VALUES('Río San Juan');
INSERT INTO spatial.departamento (nombre) VALUES('Rivas');

/*INSERT PERIODO 2018*/

INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.1, 1, 40, 1, 
		ST_GeomFromText('POINT(-85.62469482421875 12.38091631612486)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.2, 2, 74, 1, 
		ST_GeomFromText('POINT(-86.12869262695312 11.728890210912423)', 4326 ));	
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.8, 3, 35, 1, 
		ST_GeomFromText('POINT(-87.1710205078125 12.84125981830122)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (1.1, 4, 32, 1, 
		ST_GeomFromText('POINT(-85.0286865234375 11.929165073718021)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.7, 5, 45, 1, 
		ST_GeomFromText('POINT(-84.00146484374999 14.184511891326222)', 4326 ));	
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (1.4, 6, 39, 1, 
		ST_GeomFromText('POINT(-84.0673828125 11.641476279218743)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.7, 7, 24, 1,
	   ST_GeomFromText('POINT(-86.22344970703124 13.03131768257082)', 4326));

INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (5.2, 8, 40, 1,
	   ST_GeomFromText('POINT(-85.93711853027344 11.861975103494535)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.2, 9, 38, 1,
	   ST_GeomFromText('POINT(-85.90278625488281 13.179114050717942)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (6.2,10, 26, 1,
	   ST_GeomFromText('POINT(-86.87576293945312 12.432553307021802)', 4326));

INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.3,11, 12, 1,
	   ST_GeomFromText('POINT(-86.39888763427734 13.424686037729568)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (5.3,12, 101, 1,
	   ST_GeomFromText('POINT(-86.27340316772461 12.145235446426353)', 4326));	
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.1,13, 27, 1,
	   ST_GeomFromText('POINT(-86.08835220336914 11.97585230595724)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.1,14, 20, 1,
	   ST_GeomFromText('POINT(-85.9185791015625 12.922085561628819)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (1.8,15, 2, 1,
	   ST_GeomFromText('POINT(-86.0390853881836 13.757393337185569)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.3,16, 10, 1,
	   ST_GeomFromText('POINT(-84.77814674377441 11.123159888717236)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.5,17, 14, 1,
	   ST_GeomFromText('POINT(-85.82725524902344 11.438301235184616)', 4326));	

/*INSERT 2019*/

INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.9, 1, 37, 2, 
		ST_GeomFromText('POINT(-85.6581687927246 12.472279984462553)', 4326 ));

INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.1, 2, 65, 2, 
		ST_GeomFromText('POINT(-86.12783432006836 11.822241240852499)', 4326 ));	
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.7, 3, 48, 2, 
		ST_GeomFromText('POINT(-87.16621398925781 12.662782428859922)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (1.8, 4, 42, 2, 
		ST_GeomFromText('POINT(-85.36685943603516 12.100088270808788)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.9, 5, 32, 2, 
		ST_GeomFromText('POINT(-83.39859008789062 14.03834142291563)', 4326 ));	
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.6, 6, 51, 2, 
		ST_GeomFromText('POINT(-83.77143859863281 12.007756206340531)', 4326 ));
		
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.3, 7, 35, 2,
	   ST_GeomFromText('POINT(-86.34910583496094 13.095529720741494)', 4326));

INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.7, 8, 24, 2,
	   ST_GeomFromText('POINT(-85.95703125 11.924798230410486)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.2, 9, 49, 2,
	   ST_GeomFromText('POINT(-85.98999023437499 13.080815937441857)', 4326));
	   	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.4,10, 31, 2,
	   ST_GeomFromText('POINT(-86.87679290771484 12.434397295793351)', 4326));	
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.6,11, 4, 2,
	   ST_GeomFromText('POINT(-86.58239364624023 13.482784865736303)', 4326));	
	   	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.2,12, 27, 2,
	   ST_GeomFromText('POINT(-86.27340316772461 12.145235446426353)', 4326));	
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (5.2,13, 6, 2,
	   ST_GeomFromText('POINT(-86.08835220336914 11.97585230595724)', 4326));	
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (4.1,14, 7, 2,
	   ST_GeomFromText('POINT(-85.9185791015625 12.922085561628819)', 4326));		   
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (2.9,15, 2, 2,
	   ST_GeomFromText('POINT(-86.0390853881836 13.757393337185569)', 4326));
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.3,16, 8, 2,
	   ST_GeomFromText('POINT(-84.77814674377441 11.123159888717236)', 4326));	
	   
INSERT INTO spatial.sismos (magnitud, id_departamento, profundida, id_periodo, geom)
VALUES (3.5,17, 22, 2,
	   ST_GeomFromText('POINT(-85.82725524902344 11.438301235184616)', 4326));