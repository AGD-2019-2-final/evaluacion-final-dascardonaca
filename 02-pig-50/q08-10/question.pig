-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:MAP[]);
f1 = FOREACH lines GENERATE f1;
f3 = FOREACH lines GENERATE f2, f3;
letras = FOREACH f3 GENERATE FLATTEN(f2), FLATTEN(f3);
letras = FOREACH letras GENERATE FLATTEN($0), $1;

y = GROUP letras BY ($0, $1);
z = FOREACH y GENERATE FLATTEN(group), COUNT(letras);
z = FOREACH z GENERATE TOTUPLE($0,$1), $2;


--ordenada= ORDER f3 BY $0, $1, $2;
STORE z INTO 'output' USING PigStorage('\t');