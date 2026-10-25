USE `bd_taxbelalcazar_v2`;

SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE sexos;
TRUNCATE TABLE estados_civil;
TRUNCATE TABLE roles;
TRUNCATE TABLE categorias_licencia;
TRUNCATE TABLE categorias_multa;
TRUNCATE TABLE categorias_ruta;
TRUNCATE TABLE regiones;
TRUNCATE TABLE departamentos;
TRUNCATE TABLE municipios;
TRUNCATE TABLE marcas;
TRUNCATE TABLE modelos;
TRUNCATE TABLE tipos_vehiculo;
TRUNCATE TABLE rutas_transporte;
TRUNCATE TABLE usuarios;
TRUNCATE TABLE licencias_conductores;
TRUNCATE TABLE vehiculos;
TRUNCATE TABLE horarios;
TRUNCATE TABLE revisiones_tecnicas;
TRUNCATE TABLE despachos;
TRUNCATE TABLE multas;
SET FOREIGN_KEY_CHECKS = 1;

-- C:/Users/SENA/Downloads/CSV/taxbelalcazar_v2/nombre.csv

-- /home/joan/Downloads/CSV/taxbelalcazar_v2/nombre.csv

-- 1. SEXOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/sexos.csv'
INTO TABLE sexos
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cod_sexo_pk, 
nombre_sexo);

-- 2. ESTADOS CIVILES
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/estados_civil.csv'
INTO TABLE estados_civil
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_estado_civil);

-- 8. TIPOS DE DOCUMENTO
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/tipos_documento.csv'
INTO TABLE tipos_documento
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cod_tipo_documento_pk,
nombre_tipo_documento);

-- 8. ROLES
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/roles.csv'
INTO TABLE roles
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_rol);

-- 3. CATEGORÍAS DE LICENCIA
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/categorias_licencia.csv'
INTO TABLE categorias_licencia
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_categoria_licencia,
descripcion_categoria_licencia);

-- 3. CATEGORÍAS DE MULTA
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/categorias_multa.csv'
INTO TABLE categorias_multa
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_categoria_multa,
descripcion_categoria_multa);

-- 3. CATEGORÍAS DE RUTA
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/categorias_ruta.csv'
INTO TABLE categorias_ruta
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_categoria_ruta);

-- 6. REGIONES
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/regiones.csv'
INTO TABLE regiones
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_region);

-- 4. DEPARTAMENTOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/departamentos.csv'
INTO TABLE departamentos
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(cod_departamento_pk, 
nombre_departamento,
id_region_departamento_fk);

-- 6. MUNICIPIOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/municipios.csv'
INTO TABLE municipios
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS
(cod_municipio_pk, 
nombre_municipio, 
cod_departamento_municipio_fk);

-- 5. MARCAS 
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/marcas.csv'
INTO TABLE marcas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_marca);

-- 7. MODELOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/modelos.csv'
INTO TABLE modelos
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_modelo,
fabricacion_modelo,
id_marca_modelo_fk);

-- 8. TIPOS DE VEHÍCULO
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/tipos_vehiculo.csv'
INTO TABLE tipos_vehiculo
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_tipo_vehiculo);

-- 11. RUTAS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/rutas_transporte.csv'
INTO TABLE rutas_transporte
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombre_ruta,
id_categoria_ruta_fk,
cod_municipio_origen_ruta_fk,
cod_municipio_destino_ruta_fk,
tiempo_promedio_ruta,
distancia_ruta);

-- 8. USUARIOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/usuarios.csv'
INTO TABLE usuarios
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_rol_usuario_fk,
cod_tipo_documento_usuario_fk,
numero_documento_usuario,
nombres_usuario,
apellidos_usuario,
cod_sexo_usuario_fk,
correo_usuario,
telefono_usuario,
clave_usuario,
fecha_nacimiento_usuario,
id_estado_civil_usuario_fk,
fecha_registro_usuario,
estado_usuario);

-- 8. CONDUCTORES
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/conductores.csv'
INTO TABLE conductores
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(numero_licencia_conductor,
nombres_conductor,
apellidos_conductor,
cod_sexo_conductor_fk,
correo_conductor,
telefono_conductor,
clave_conductor,
fecha_nacimiento_conductor,
id_estado_civil_conductor_fk,
estado_conductor);

-- 9. TÉCNICOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/tecnicos.csv'
INTO TABLE tecnicos
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(nombres_tecnico,
apellidos_tecnico,
cod_sexo_tecnico_fk,
correo_tecnico,
telefono_tecnico,
clave_tecnico,
fecha_nacimiento_tecnico,
id_estado_civil_tecnico_fk,
estado_tecnico);

-- 8. LICENCIAS Y CONDUCTORES
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/licencias_conductores.csv'
INTO TABLE licencias_conductores
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_conductor_fk,
id_categoria_licencia_conductor_fk,
numero_licencia_conductor,
fecha_vencimiento_licencia);

-- 10. VEHÍCULOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/vehiculos.csv'
INTO TABLE vehiculos
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_tipo_vehiculo_fk,
id_modelo_vehiculo_fk,
capacidad_vehiculo,
fecha_vigencia_matricula,
placa_vehiculo,
estado_vehiculo);

-- 13. HORARIOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/horarios.csv'
INTO TABLE horarios
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_ruta_horario_fk,
id_tipo_vehiculo_horario_fk,
hora_salida_programada_horario,
estado_horario);

-- 12. REVISIONES TÉCNICAS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/revisiones_tecnicas.csv'
INTO TABLE revisiones_tecnicas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(estado_carretera_revisada,
estado_ruedas_revisadas,
estado_sistema_frenos_revisado,
estado_sistema_luces_revisado,
estado_motor_revisado,
id_vehiculo_revisado_fk,
id_tecnico_encargado_fk,
fecha_revision,
estado_revision,
observacion_revision);

-- 13. DESPACHOS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/despachos.csv'
INTO TABLE despachos
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_horario_despacho_fk,
id_despachador_fk,
id_conductor_despachado_fk,
id_revision_despacho_fk,
fecha_salida_despacho,
id_vehiculo_despachado_fk,
estado_despacho,
observacion_despacho);

-- 14. MULTAS
LOAD DATA LOCAL INFILE '/home/joan/Downloads/CSV/taxbelalcazar_v2/multas.csv'
INTO TABLE multas
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(id_conductor_multado_fk,
id_vehiculo_multado_fk,
id_categoria_multa_fk,
monto_multa,
fecha_multa,
estado_multa);