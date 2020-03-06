--
-- Pregunta
-- ===========================================================================
-- 
-- El archivo `truck_event_text_partition.csv` tiene la siguiente estructura:
-- 
--   driverId       INT
--   truckId        INT
--   eventTime      STRING
--   eventType      STRING
--   longitude      DOUBLE
--   latitude       DOUBLE
--   eventKey       STRING
--   correlationId  STRING
--   driverName     STRING
--   routeId        BIGINT
--   routeName      STRING
--   eventDate      STRING
-- 
-- Escriba un script en Pig que carge los datos y obtenga los primeros 10 
-- registros del archivo para las primeras tres columnas, y luego, ordenados 
-- por driverId, truckId, y eventTime. 
--
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
-- 
--  >>> Escriba su respuesta a partir de este punto <<<
-- 
lines = LOAD 'truck_event_text_partition.csv' USING PigStorage(',') AS (driverId:INT,
truckId:INT,
eventTime:CHARARRAY,
eventType:CHARARRAY,
longitude:DOUBLE,
latitude:DOUBLE,
eventKey:CHARARRAY,
correlationId:CHARARRAY,
driverName:CHARARRAY,
routeId:CHARARRAY,
routeName:CHARARRAY,
eventDate:CHARARRAY);
lines = LIMIT lines 10;
lines = FOREACH lines GENERATE driverId, truckId, eventTime;
ordenado = ORDER lines by driverId, truckId, eventTime;


--Se guardan los datos en output
STORE ordenado INTO 'output' USING PigStorage(',');