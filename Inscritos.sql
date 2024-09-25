--desafio2-karen-limari-123=# 
 SELECT * FROM inscritos;

-- cantidad |   fecha    | fuente
----------+------------+--------
--       44 | 2021-01-01 | Blog
--       56 | 2021-01-01 | Página
--       39 | 2021-02-01 | Blog
--       81 | 2021-02-01 | Página
--       12 | 2021-03-01 | Blog
--       91 | 2021-03-01 | Página
--       48 | 2021-04-01 | Blog
--       45 | 2021-04-01 | Página
--       55 | 2021-05-01 | Blog
--       33 | 2021-05-01 | Página
--       18 | 2021-06-01 | Blog
--       12 | 2021-06-01 | Página
--       34 | 2021-07-01 | Blog
--       24 | 2021-07-01 | Página
--       83 | 2021-08-01 | Blog
--       99 | 2021-08-01 | Página
--(16 filas)

-- 1. ¿Cuántos registros hay?

--desafio2-karen-limari-123=# 
SELECT COUNT(*) AS registros_totales FROM inscritos;
registros_totales
-------------------
              16
--(1 fila)

--2. ¿Cuántos inscritos hay en total?

--desafio2-karen-limari-123=# 
SELECT SUM(cantidad) AS total_inscritos FROM inscritos;
 total_inscritos
-----------------
             774
--(1 fila)

--3.¿Cuál o cuáles son los registros de mayor antiguedad?

--desafio2-karen-limari-123=#  
SELECT * FROM inscritos WHERE fecha = (SELECT MIN(fecha) FROM inscritos);
 cantidad |   fecha    | fuente
----------+------------+--------
       44 | 2021-01-01 | Blog
       56 | 2021-01-01 | Página
--(2 filas)

--4. ¿Cuántos inscritos hay por día?

--desafio2-karen-limari-123=# 
SELECT fecha, SUM(cantidad) AS total_inscritos FROM inscritos GROUP BY fecha ORDER BY fecha;
   fecha    | total_inscritos
------------+-----------------
 2021-01-01 |             100
 2021-02-01 |             120
 2021-03-01 |             103
 2021-04-01 |              93
 2021-05-01 |              88
 2021-06-01 |              30
 2021-07-01 |              58
 2021-08-01 |             182
--(8 filas)

--5.¿Qué día se inscribieron la mayor cantidad de personas y cuántas personas se inscribieron en ese día?

--desafio2-karen-limari-123=# 
SELECT fecha, SUM(cantidad) AS total_inscritos FROM inscritos GROUP BY fecha ORDER BY total_inscritos DESC LIMIT 1;
   fecha    | total_inscritos
------------+-----------------
 2021-08-01 |             182
--(1 fila)