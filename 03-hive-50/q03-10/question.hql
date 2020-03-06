-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Escriba una consulta que devuelva los cinco valores diferentes más pequeños 
-- de la tercera columna.
--
-- Escriba el resultado a la carpeta `output` de directorio de trabajo.
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
DROP TABLE IF EXISTS docs;
DROP TABLE IF EXISTS word_counts;
CREATE TABLE docs (letra STRING,
                    fecha STRING,
                    numero INT) 
                    ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t';

LOAD DATA LOCAL INPATH "data.tsv" OVERWRITE INTO TABLE docs;


INSERT OVERWRITE LOCAL DIRECTORY 'output' 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT DISTINCT numero
FROM docs
ORDER BY numero
LIMIT 5;