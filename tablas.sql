-- BD
CREATE DATABASE IF NOT EXISTS Saludable;
USE Saludable;


-- TABLAS
CREATE TABLE Estado (
    id_estado INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Dia (
    id_dia INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(20) NOT NULL UNIQUE
);

CREATE TABLE Especialidad (
    id_especialidad INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Obra_Social (
    id_obra_social INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE
);


CREATE TABLE Horario (
    id_horario INT PRIMARY KEY AUTO_INCREMENT,
    hora_inicio TIME NOT NULL,
    hora_fin TIME NOT NULL,
    id_dia INT NOT NULL,
    FOREIGN KEY (id_dia) REFERENCES Dia(id_dia)
);

CREATE TABLE Medico (
    id_medico INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    dni VARCHAR(20) UNIQUE,
    telefono VARCHAR(15),
    email VARCHAR(100) UNIQUE,
    id_especialidad INT,
    id_estado INT,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad),
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado)
);

CREATE TABLE Paciente (
    id_paciente INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dni VARCHAR(20) UNIQUE,
    telefono VARCHAR(15),
    id_obra_social INT,
    FOREIGN KEY (id_obra_social) REFERENCES Obra_Social(id_obra_social)
);

CREATE TABLE Servicio (
    id_servicio INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    id_especialidad INT,
    FOREIGN KEY (id_especialidad) REFERENCES Especialidad(id_especialidad)
);

CREATE TABLE Equipo (
    id_equipo INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    id_servicio INT,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

CREATE TABLE Practica (
    id_practica INT PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL UNIQUE,
    precio DECIMAL(10, 2),
    id_servicio INT,
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

-- TABLAS INTERMEDIAS

CREATE TABLE Medico_Servicio (
    id_medico INT,
    id_servicio INT,
    PRIMARY KEY (id_medico, id_servicio),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio)
);

CREATE TABLE Servicio_Obra_Social (
    id_servicio INT,
    id_obra_social INT,
    PRIMARY KEY (id_servicio, id_obra_social),
    FOREIGN KEY (id_servicio) REFERENCES Servicio(id_servicio),
    FOREIGN KEY (id_obra_social) REFERENCES Obra_Social(id_obra_social)
);

CREATE TABLE Medico_Horario_Dia (
    id_medico INT,
    id_horario INT,
    id_dia INT,
    PRIMARY KEY (id_medico, id_horario, id_dia),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_horario) REFERENCES Horario(id_horario),
    FOREIGN KEY (id_dia) REFERENCES Dia(id_dia)
);

-- TABLA PRINCIPAL
CREATE TABLE Turno (
    id_turno INT PRIMARY KEY AUTO_INCREMENT,
    fecha DATE NOT NULL,
    id_horario INT,
    id_medico INT,
    id_estado INT,
    id_paciente INT,
    id_practica INT,
    FOREIGN KEY (id_horario) REFERENCES Horario(id_horario),
    FOREIGN KEY (id_medico) REFERENCES Medico(id_medico),
    FOREIGN KEY (id_estado) REFERENCES Estado(id_estado),
    FOREIGN KEY (id_paciente) REFERENCES Paciente(id_paciente),
    FOREIGN KEY (id_practica) REFERENCES Practica(id_practica)
);