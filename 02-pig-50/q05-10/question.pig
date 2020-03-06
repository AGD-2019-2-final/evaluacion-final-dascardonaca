-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute Calcule la cantidad de registros en que 
-- aparece cada letra minúscula en la columna 2.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:CHARARRAY);
f2 = FOREACH lines GENERATE f2;
letras = FOREACH f2 GENERATE FLATTEN(f2) AS p:CHARARRAY;
y = GROUP letras BY p;
z = FOREACH y GENERATE FLATTEN(group), COUNT(letras);

STORE z INTO 'output' USING PigStorage('\t');