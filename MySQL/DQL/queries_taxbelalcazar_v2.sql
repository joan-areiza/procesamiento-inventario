II. Consultas de Manipulación (DML e inserción)
1. Alias de tablas y columnas: Listar conductores con alias.

SELECT nombres_usuario AS nombre_conductor
FROM usuarios AS c
WHERE id_rol_usuario_fk = 1;

2. Filtro con LIKE: Buscar rutas que contengan la palabra "Pereira".

SELECT *
FROM rutas_transporte
WHERE nombre_ruta LIKE '%Pereira%';

3. Filtro con WHERE: Listar vehículos con capacidad mayor a 40 pasajeros.

SELECT *
FROM vehiculos
WHERE capacidad_vehiculo > 40;

4. Consulta compuesta: Conductores con licencias que empiezan por '76'.

SELECT a.nombres_usuario,b.numero_licencia_conductor
FROM usuarios a
INNER JOIN licencias_conductores b
ON a.id_usuario_pk=b.id_conductor_fk
WHERE b.numero_licencia_conductor LIKE '76%';

IV. Consultas con Joins y Agrupaciones
1. Inner Join: Ver todos los despachos con el nombre del conductor.

SELECT a.id_despacho_pk,b.nombres_usuario
FROM despachos a
INNER JOIN usuarios b
ON a.id_conductor_despachado_fk=b.id_usuario_pk;

2. Join múltiple: Relacionar despacho, vehículo y ruta.

SELECT a.id_despacho_pk,b.placa_vehiculo,c.nombre_ruta
FROM despachos a
INNER JOIN vehiculos b ON a.id_vehiculo_despachado_fk=b.id_vehiculo_pk
INNER JOIN horarios h ON a.id_horario_despacho_fk=h.id_horario_pk
INNER JOIN rutas_transporte c ON h.id_ruta_horario_fk=c.id_ruta_pk;

3. Agrupación (GROUP BY): Contar cuántos despachos tiene cada ruta.

SELECT r.nombre_ruta,COUNT(*) AS total_despachos
FROM despachos d
INNER JOIN horarios h ON d.id_horario_despacho_fk=h.id_horario_pk
INNER JOIN rutas_transporte r ON h.id_ruta_horario_fk=r.id_ruta_pk
GROUP BY r.nombre_ruta;

4. Agrupación con filtro (HAVING): Rutas que tengan más de cinco despachos realizados.

SELECT r.nombre_ruta,COUNT(*) AS total_despachos
FROM despachos d
INNER JOIN horarios h ON d.id_horario_despacho_fk=h.id_horario_pk
INNER JOIN rutas_transporte r ON h.id_ruta_horario_fk=r.id_ruta_pk
GROUP BY r.nombre_ruta
HAVING COUNT(*)>5;

5. Promedios: Tiempo promedio de viaje por categoría de ruta.

SELECT c.nombre_categoria_ruta,AVG(r.tiempo_promedio_ruta) AS promedio_viaje
FROM rutas_transporte r
INNER JOIN categorias_ruta c ON r.id_categoria_ruta_fk=c.id_categoria_ruta_pk
GROUP BY c.nombre_categoria_ruta;

V. Consultas de Control y Validación
1. Verificar revisiones pendientes: Buscar revisiones no aprobadas.

SELECT * FROM revisiones_tecnicas WHERE estado_revision='No Aprobado';

2. Consulta con ordenamiento: Ver los últimos despachos realizados.

SELECT * FROM despachos ORDER BY fecha_salida_despacho DESC;

3. Consulta de integración: Listar los vehículos que no han tenido revisiones registradas.

SELECT v.placa_vehiculo
FROM vehiculos v
LEFT JOIN revisiones_tecnicas r ON v.id_vehiculo_pk=r.id_vehiculo_revisado_fk
WHERE r.id_revision_pk IS NULL;
