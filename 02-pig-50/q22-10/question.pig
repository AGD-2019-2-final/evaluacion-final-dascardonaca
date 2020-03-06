-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u
--    WHERE 
--        color REGEXP '.n';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
z = FOREACH u GENERATE firstname, color;
--y = FOREACH z GENERATE (chararray)SUBSTRING(color, (int)SIZE(color)-2, (int)SIZE(color)-1) as (S:CHARARRAY);
x = FILTER z BY (SUBSTRING(color, (int)(SIZE(color)-1), (int)(SIZE(color)-0))=='n');
--z= FOREACH z GENERATE surname, STRSPLIT(surname, '');
STORE x INTO 'output' USING PigStorage(',');
