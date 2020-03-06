-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` genere una tabla que contenga la primera columna,
-- la cantidad de elementos en la columna 2 y la cantidad de elementos en la 
-- columna 3 separados por coma. La tabla debe estar ordenada por las 
-- columnas 1, 2 y 3.
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--
-- >>> Escriba su respuesta a partir de este punto <<<
--

lines = LOAD 'data.tsv' USING PigStorage('\t') AS (f1:CHARARRAY, f2:BAG{t:(p:CHARARRAY)}, f3:MAP[]);
f3 = FOREACH lines GENERATE f1, COUNT(f2), SIZE(f3);
--letras = FOREACH f3 GENERATE FLATTEN(f3);
--letras = FOREACH letras GENERATE $0;
--y = GROUP letras BY $0;
--z = FOREACH y GENERATE FLATTEN(group), COUNT(letras);



ordenada= ORDER f3 BY $0, $1, $2;
STORE ordenada INTO 'output' USING PigStorage(',');