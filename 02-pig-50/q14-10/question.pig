--
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        color 
--    FROM 
--        u 
--    WHERE 
--        color NOT LIKE 'b%';
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
z= FOREACH u GENERATE color;
SPLIT z INTO z IF color < 'c', x IF color >= 'c';
SPLIT z INTO z IF color > 'b', y IF color <= 'b';
z = UNION x, y;
--z= FOREACH z GENERATE surname, STRSPLIT(surname, '');

STORE z INTO 'output' USING PigStorage(',');