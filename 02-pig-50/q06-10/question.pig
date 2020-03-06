-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` Calcule la cantidad de registros por clave de la 
-- columna 3. En otras palabras, cuántos registros hay que tengan la clave 
-- `aaa`?
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:CHARARRAY, f3:MAP[]);
f3 = FOREACH lines GENERATE f3;
letras = FOREACH f3 GENERATE FLATTEN(f3);
letras = FOREACH letras GENERATE $0;
y = GROUP letras BY $0;
z = FOREACH y GENERATE FLATTEN(group), COUNT(letras);

STORE z INTO 'output' USING PigStorage(',');