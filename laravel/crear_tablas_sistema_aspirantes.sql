
CREATE TABLE tipo_documento (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR NOT NULL,
    descripcion VARCHAR
);

CREATE TABLE persona (
    id INTEGER PRIMARY KEY,
    id_tipo_documento INTEGER NOT NULL,
    primer_nombre VARCHAR NOT NULL,
    segundo_nombre VARCHAR,
    primer_apellido VARCHAR NOT NULL,
    segundo_apellido VARCHAR,
    numero_documento VARCHAR NOT NULL UNIQUE,
    correo VARCHAR UNIQUE,
    telefono VARCHAR UNIQUE,
    direccion VARCHAR,
    fecha_nacimiento DATE NOT NULL,
    grupo_sanguineo VARCHAR,
    fecha_registro TIMESTAMP NOT NULL,
    FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id)
);

CREATE TABLE usuario (
    id INTEGER PRIMARY KEY,
    id_persona INTEGER NOT NULL,
    username VARCHAR NOT NULL,
    password VARCHAR NOT NULL,
    estado BOOLEAN,
    ultimo_acceso TIMESTAMP,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
);

CREATE TABLE rol (
    id INTEGER PRIMARY KEY,
    nombre_rol VARCHAR NOT NULL,
    descripcion VARCHAR
);

CREATE TABLE usuario_Rol (
    id INTEGER PRIMARY KEY,
    id_usuario INTEGER NOT NULL,
    id_rol INTEGER NOT NULL,
    fecha_asignacion TIMESTAMP,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id),
    FOREIGN KEY (id_rol) REFERENCES rol(id)
);

CREATE TABLE aspirante (
    id INTEGER PRIMARY KEY,
    id_persona INTEGER NOT NULL,
    estado VARCHAR,
    observaciones TEXT,
    FOREIGN KEY (id_persona) REFERENCES persona(id)
);

CREATE TABLE programa_formacion (
    id INTEGER PRIMARY KEY,
    codigo VARCHAR NOT NULL UNIQUE,
    nombre VARCHAR NOT NULL,
    descripcion TEXT,
    estado VARCHAR
);

CREATE TABLE estado_programa (
    id INTEGER PRIMARY KEY,
    nombre VARCHAR NOT NULL
);

CREATE TABLE aspirante_Programa (
    id INTEGER PRIMARY KEY,
    id_aspirante INTEGER NOT NULL,
    id_programa INTEGER NOT NULL,
    id_estado_programa INTEGER NOT NULL,
    fecha_inscripcion TIMESTAMP,
    FOREIGN KEY (id_aspirante) REFERENCES aspirante(id),
    FOREIGN KEY (id_programa) REFERENCES programa_formacion(id),
    FOREIGN KEY (id_estado_programa) REFERENCES estado_programa(id)
);

CREATE TABLE documento (
    id INTEGER PRIMARY KEY,
    id_persona INTEGER NOT NULL,
    id_tipo_documento INTEGER NOT NULL,
    ruta_archivo VARCHAR NOT NULL,
    fecha_carga TIMESTAMP,
    estado_lectura BOOLEAN,
    fecha_procesamiento TIMESTAMP,
    FOREIGN KEY (id_persona) REFERENCES persona(id),
    FOREIGN KEY (id_tipo_documento) REFERENCES tipo_documento(id)
);
