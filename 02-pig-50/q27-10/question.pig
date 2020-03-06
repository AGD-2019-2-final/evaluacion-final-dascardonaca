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
--        LOCATE('ia', firstname) 
--    FROM 
--        u;
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
z = FOREACH u GENERATE firstname, FLATTEN((STRSPLIT(firstname, 'ia')));
z = FOREACH z GENERATE $0 as firstname, $1 as subst;
z = FOREACH z GENERATE SIZE((chararray)$0) as firstname, SIZE((chararray)$1) as subst;

x = FOREACH z GENERATE ( firstname == subst ? -1:subst);


STORE x INTO 'output' USING PigStorage(',');