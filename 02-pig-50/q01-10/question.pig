-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:CHARARRAY, f3:INT);
letra = FOREACH lines GENERATE f1;
y = GROUP letra by f1;
z = FOREACH y GENERATE FLATTEN(group), COUNT(letra);

--Se guardan los datos en output
STORE z INTO 'output' USING PigStorage('\t');
