-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.csv` escriba una consulta en Pig que genere la 
-- siguiente salida:
-- 
--   Vivian@Hamilton
--   Karen@Holcomb
--   Cody@Garrett
--   Roth@Fry
--   Zoe@Conway
--   Gretchen@Kinney
--   Driscoll@Klein
--   Karyn@Diaz
--   Merritt@Guy
--   Kylan@Sexton
--   Jordan@Estes
--   Hope@Coffey
--   Vivian@Crane
--   Clio@Noel
--   Hope@Silva
--   Ayanna@Jarvis
--   Chanda@Boyer
--   Chadwick@Knight
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
--

lines = LOAD 'data.csv' USING PigStorage(',');
f1 = FOREACH lines GENERATE $1,$2;
--f3 = FOREACH lines GENERATE f2, f3;
--letras = FOREACH f3 GENERATE FLATTEN(f2), FLATTEN(f3);
--letras = FOREACH letras GENERATE FLATTEN($0), $1;

--y = GROUP letras BY ($0, $1);
--z = FOREACH y GENERATE FLATTEN(group), COUNT(letras);
--z = FOREACH z GENERATE TOTUPLE($0,$1), $2;


--ordenada= ORDER f3 BY $0, $1, $2;
STORE f1 INTO 'output' USING PigStorage('@');
