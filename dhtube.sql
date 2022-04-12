CREATE DATABASE dhtube;
USE dhtube;

CREATE TABLE avatar (
	idAvatar INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45), 
    urlimagem VARCHAR(100)
);

CREATE TABLE pais (
	idPais INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100)
);

CREATE TABLE usuario (
	idUsuario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    email VARCHAR(45),
    senha VARCHAR(45),
    dataNascimento DATETIME,
    cep VARCHAR(45),
    idPais INT NOT NULL,
    idAvatar INT NOT NULL,
    FOREIGN KEY (idPais) REFERENCES pais(idPais),
    FOREIGN KEY (idAvatar) REFERENCES avatar(idAvatar)
);

CREATE TABLE canal(
	idCanal INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    descricao TEXT,
    dataCriacao DATETIME,
    idUsuario INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE video(
	 idVideo INT AUTO_INCREMENT PRIMARY KEY,
     titulo VARCHAR(100),
     descricao TEXT,
     tamanho DOUBLE,
     nomeArquivo VARCHAR(100),
     duracao DOUBLE,
     imagem VARCHAR(100),
     qtdReproducoes INT, 
     qtdLikes INT,
     qtdDislikes INT,
     privado SMALLINT,
     dataPublicacao DATETIME,
     idUsuario INT NOT NULL,
     FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE playlist (
	idPlaylist INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45),
    dataDescricao DATETIME,
    private SMALLINT,
    idUsuario INT NOT NULL,
    FOREIGN KEY (idUsuario) REFERENCES usuario(idUsuario)
);

CREATE TABLE playlist_video (
	idVideo INT NOT NULL,
    idPlaylist INT NOT NULL,
	FOREIGN KEY (idVideo) REFERENCES video(idVideo),
    FOREIGN KEY (idPlaylist) REFERENCES playlist(idPlaylist)
);
