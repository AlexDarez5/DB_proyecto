DROP DATABASE IF EXISTS citas;

CREATE DATABASE IF NOT EXISTS citas CHARACTER SET utf8mb4;
USE citas;

CREATE TABLE especialidad(
	id_especialidad INT NOT NULL,
    nombre_esp VARCHAR(50) NOT NULL,
    PRIMARY KEY (id_especialidad)
);

CREATE TABLE doctor(
	id_profesional INT NOT NULL,
    id_esp INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    correo VARCHAR(30) NOT NULL,
    consultorio VARCHAR(30) NOT NULL,
	FOREIGN KEY (id_esp) REFERENCES especialidad (id_especialidad),
    /*especialidad ENUM('medicina_general', 'medicina_interna') NOT NULL,*/
    PRIMARY KEY(id_profesional)
);/*Fin doctor*/

CREATE TABLE paciente(
	id_numeroCedula INT NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    apellido VARCHAR(20) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    edad DATE NOT NULL,
    PRIMARY KEY(id_numeroCedula)
);/*Fin paciente*/

CREATE TABLE citas(
	fecha_hora DATETIME NOT NULL,
    id_prof INT NOT NULL,
    id_numeroCed INT NOT NULL,
    FOREIGN KEY (id_prof) REFERENCES doctor (id_profesional),
    FOREIGN KEY (id_numeroCed) REFERENCES paciente (id_numeroCedula),
    PRIMARY KEY (
		id_prof,
        id_numeroCed,
        fecha_hora
    )
    /* ON DELETE CASCADE */
);/*Fin citas*/