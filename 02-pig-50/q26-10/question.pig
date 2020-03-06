-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname 
--    FROM 
--        u 
--    WHERE 
--        SUBSTRING(firstname, 0, 1) >= 'm';
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

z = FOREACH u GENERATE firstname, SUBSTRING(firstname, 0, 1) as subs;
--z = FOREACH z GENERATE firstname, SUBSTRING(subs, 0, 1);
--z = FOREACH z GENERATE SIZE((chararray)$0) as firstname, SIZE((chararray)$1) as subst;

x = FILTER z BY subs >= 'M';
x = FOREACH x GENERATE firstname;


STORE x INTO 'output' USING PigStorage(',');