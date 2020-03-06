-- 
-- Pregunta
-- ===========================================================================
--
-- Para resolver esta pregunta use el archivo `data.tsv`.
--
-- Compute la cantidad de registros por cada letra de la columna 1.
-- Escriba el resultado ordenado por letra. 
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
CREATE TABLE word_counts
AS
    SELECT letra
    FROM docs;


INSERT OVERWRITE LOCAL DIRECTORY 'output' 
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
SELECT letra, count(1) 
FROM word_counts 
GROUP BY letra;