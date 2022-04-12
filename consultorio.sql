CREATE DATABASE Consultorio;
USE Consultorio;

 CREATE TABLE Paciente (
	id_paciente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(30) NOT NULL,
    sobrenome VARCHAR(45) NOT NULL,
    numero_identificacao CHAR(11) NOT NULL
 );
  
 CREATE TABLE Consultas(
	id_consultas INT AUTO_INCREMENT PRIMARY KEY,
    horario_consulta TIME NOT NULL,
    data_consulta DATE NOT NULL
 );
 
 CREATE TABLE Medico (
	id_consultas INT AUTO_INCREMENT PRIMARY KEY,
    nome_medico VARCHAR(45) NOT NULL,
    sobrenome_medico VARCHAR(45) NOT NULL
 );
 
 CREATE TABLE Especialidade(
	id_especialidade INT AUTO_INCREMENT PRIMARY KEY,
    especialidades VARCHAR(50) NOT NULL
 ); 
