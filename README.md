# Taller Practico: Base de Datos para TaxBelalcazar

## Contexto del Proyecto

TaxBelalcazar es una empresa de transporte publico que viaja por el departamento del Cauca y otras partes de Colombia. Actualmente organizan los viajes, buses y conductores en planillas de papel, lo que causa desorden y fallas en la operacion.

Para solucionar esto, la empresa pide que ningún vehiculo salga a carretera si no tiene una revision tecnica aprobada el mismo dia del viaje. Este proyecto busca crear la base de datos central en MySQL para gestionar todo el sistema de despachos.

## Reglas del Sistema

1. Conductores: Se guarda nombre completo, telefono y numero de licencia de conduccion. La licencia es obligatoria y no se puede repetir.
2. Vehiculos: Se identifican por su placa unica. Tambien se registra la marca, modelo y la cantidad maxima de pasajeros.
3. Rutas: Hay rutas dentro del Cauca (departamentales) y hacia otras partes del pais (nacionales). Se guarda el nombre de la ruta y la duracion aproximada del viaje en minutos.
4. Revisiones Tecnicas: Se registra fecha, hora, notas del mecanico y si el carro esta aprobado o no para salir.
5. Despachos: Es el registro oficial de la salida de un viaje. Conecta de forma obligatoria el vehiculo, el conductor, la ruta, la revision tecnica aprobada y la fecha/hora de salida.

## Fases de Entrega

### Fase 1: Diagrama y Modelado
- Creacion del diagrama de tablas y relaciones (DER).
- Identificacion de llaves primarias, llaves foraneas y tipo de relacion entre tablas.

### Fase 2: Creacion de la Base de Datos (DDL)
- Script SQL para crear la base de datos `taxbelalcazar`.
- Creacion de tablas especificando el tipo de dato adecuado para cada campo.
- Configuracion de llaves foraneas y restricciones para evitar datos repetidos o vacios.

### Fase 3: Carga de Datos y Normalizacion (DML)
- Insercion de datos de prueba realistas (placas colombianas, telefonos validos, etc.).
- Comprobacion de que la base de datos esta normalizada correctamente.

### Fase 4: Consultas SQL

1. Modificacion de tablas (DDL):
   - Agregar columna de estado civil al conductor.
   - Cambiar el tamaño o tipo del campo telefono.
   - Crear una tabla para registrar multas de transito.

2. Manejo de datos (DML):
   - Insertar nuevos conductores.
   - Actualizar el telefono de un conductor.
   - Borrar registros de revisiones creados por error.

3. Filtros y lecturas basicas:
   - Uso de alias (AS) para mostrar nombres claros en los resultados.
   - Busqueda de rutas especificas usando LIKE (ejemplo: buscar rutas a Pereira).
   - Filtrar vehiculos con capacidad mayor a 40 pasajeros.
   - Buscar licencias que comiencen por numeros especificos.

4. Uniones y agrupaciones (JOINs y GROUP BY):
   - Unir despachos con los nombres de los conductores.
   - Unir en una sola consulta el despacho, el vehiculo y la ruta.
   - Contar cuantos viajes ha realizado cada conductor.
   - Mostrar solo las rutas que superen los 5 despachos.
   - Calcular el promedio de tiempo de viaje segun la ruta.

5. Revision de control:
   - Identificar revisiones tecnicas que no fueron aprobadas.
   - Ordenar los despachos para ver los mas recientes.
   - Detectar vehiculos que aun no tienen revisiones registradas.

## Datos del Taller

- Programa: Gestion de Bases de Datos y SQL (SENA)
- Herramientas: MySQL / MariaDB / phpMyAdmin
