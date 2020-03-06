-- Pregunta
-- ===========================================================================
-- 
-- Obtenga los cinco (5) valores más pequeños de la 3ra columna.
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
ordenado = ORDER lines BY f3;
ordenado = LIMIT ordenado 5;
numeros = FOREACH ordenado GENERATE f3;
--z = FOREACH y GENERATE FLATTEN(group), COUNT(letra);

--Se guardan los datos en output
STORE numeros INTO 'output' USING PigStorage('\t');

