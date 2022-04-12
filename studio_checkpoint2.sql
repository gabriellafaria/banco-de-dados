/*É um banco de dados de um studio de tatuagens, que solicita ao cliente um cadastro prévio para fazer os orçamentos. Para cada sessão de tatuagem, deve-se ter realizado o orçamento com o tatuador anteriormente. 
O mesmo orçamento pode ter mais de uma sessão. Para fazer um orçamento, o cliente pode escolher somente mandar as informações ou agendar uma visita para mais informações e detalhes da sua tatuagem.
Se o cliente decidir realizar uma sessão, ele deve completar o seu cadastro. 
*/

CREATE DATABASE studio;
USE studio;

CREATE TABLE pagamento(
	idPagamento INT AUTO_INCREMENT,
    descricao VARCHAR(20) NOT NULL,
    PRIMARY KEY (idPagamento)
);

CREATE TABLE endereco(
	idEndereco INT AUTO_INCREMENT,
    rua VARCHAR(40) NOT NULL,
    numero TINYINT NOT NULL,
    bairro VARCHAR(30) NOT NULL,
    complemento VARCHAR(30),
    municipio VARCHAR(30) NOT NULL, 
    cep CHAR(8) NOT NULL,
    uf VARCHAR(2) NOT NULL,
    PRIMARY KEY (idEndereco) 
);

CREATE TABLE studio(
	idStudio INT AUTO_INCREMENT,
    nomeStudio VARCHAR(40) NOT NULL,
    informacoesStudio VARCHAR(60) NOT NULL,
	idEndereco INT NOT NULL,
    PRIMARY KEY (idStudio),
    FOREIGN KEY (idEndereco) REFERENCES endereco(idEndereco)
);

CREATE TABLE tatuador(
	idTatuador INT AUTO_INCREMENT, 
    nomeTatuador VARCHAR(30) NOT NULL,
    sobrenomeTatuador VARCHAR(30) NOT NULL, 
    instagramTatuador VARCHAR(35),
    emailTatuador VARCHAR(75) NOT NULL, 
    idStudio INT NOT NULL,
    PRIMARY KEY (idTatuador),
    FOREIGN KEY (idStudio) REFERENCES studio(idStudio)
);

CREATE TABLE telefones(
	idTelefone INT AUTO_INCREMENT, 
    telefone CHAR(11) NOT NULL,
    idTatuador INT NOT NULL, 
    PRIMARY KEY (idTelefone),
    FOREIGN KEY (idTatuador) REFERENCES tatuador(idTatuador)
);

CREATE TABLE cliente(
	idCliente INT AUTO_INCREMENT,
    nomeCliente VARCHAR(30) NOT NULL,
    sobrenomeCliente VARCHAR(30), 
    dataNascimentoCliente DATE NOT NULL, 
    telefoneCliente CHAR(11) NOT NULL,
    declaracaoSaude VARCHAR(100),
    cpfCliente CHAR(11),
    emailCliente VARCHAR(70) NOT NULL,
    PRIMARY KEY (idCliente)
);

CREATE TABLE orcamento(
	idOrcamento INT AUTO_INCREMENT,
    valorOrcamento DECIMAL(5,2) NOT NULL,
    fotoOrcamento BLOB, 
    descricaoOrcamento TEXT(200) NOT NULL,
	idTatuador INT NOT NULL, 
    idCliente INT NOT NULL, 
    PRIMARY KEY (idOrcamento),
    FOREIGN KEY (idTatuador) REFERENCES tatuador(idTatuador),
	FOREIGN KEY (idCliente) REFERENCES cliente(idCliente)
);

CREATE TABLE sessao(
	idSessao INT AUTO_INCREMENT,
    dataSessao DATE NOT NULL,
    horarioSessao TIME NOT NULL,
    idOrcamento INT NOT NULL,
    idPagamento INT NOT NULL, 
    PRIMARY KEY (idSessao),
	FOREIGN KEY (idPagamento) REFERENCES pagamento(idPagamento),
	FOREIGN KEY (idOrcamento) REFERENCES orcamento(idOrcamento)
);

ALTER TABLE orcamento 
ADD dataVisita DATE,
ADD visitaOrcamento TINYINT,
ADD horarioVisita TIME;

INSERT INTO pagamento(idPagamento, descricao)
VALUES
	(default, 'a vista'),
    (default, 'credito 2x');

INSERT INTO endereco(idendereco,rua, numero, bairro, municipio, cep, uf)
VALUES(
	default, 'R. Leopoldina', '61', 'Santo Antônio', 'Belo Horizonte', '30330230', 'MG');

INSERT INTO studio(idStudio, nomeStudio, informacoesStudio, idEndereco)
VALUES(
	default, 'Inkonik Tattoo Studio', 'As informações do studio são...' ,1);

INSERT INTO tatuador(idTatuador, nomeTatuador, sobrenomeTatuador, instagramTatuador, emailTatuador, idStudio)
VALUES
	(default, 'Flavia', 'Tavares', 'sakuratattoos', 'sakuratattoos@gmail.com', 1),
    (default, 'Lucas', 'Nogueira', 'lucas_tattoo', 'lucas@email.com.br', 1),
    (default, 'Icaro', 'Ferreira', NULL, 'contato@ferreira.com.br', 1);
    
INSERT INTO telefones(idTelefone, telefone, idTatuador)
VALUES
	(default, 31111111111, 1),
    (default, 99965845891, 1),
    (default, 31888888888, 2),
    (default, 37456852158, 3),
    (default, 31789415518, 2),
    (default, 49988111111, 3);
    
INSERT INTO cliente(idCliente, nomeCliente, dataNascimentoCliente, telefoneCliente, emailCliente)
VALUES
	(default, 'Gabriella', '1999-11-04', '31222222222', 'gabisouf@gmail.com'),
	(default, 'Hugo', '1991-05-26', '32999885522', 'meu@email.com'),
    (default, 'Vitoria', '1997-07-19', '31999999999', 'email@meu.com.br'),
    (default, 'Italo', '1986-12-01', '371111111', 'um@contato.com.br');
    
INSERT INTO orcamento(idOrcamento, valorOrcamento, descricaoOrcamento, idTatuador, idCliente, dataVisita, visitaOrcamento, horarioVisita)
VALUES
	(default, 520.00, 'Como eu quero minha tattoo...', 1, 1, '2022-04-04', 1, '14:00'),
    (default, 950.00, 'Essa tatuagem que será feita', 2, 3, NULL, NULL, NULL),
	(default, 200.00, 'Somente sombreamento', 1, 2, NULL, NULL, NULL),
    (default, 760.00, 'Minha ideia é...', 3, 4, '2022-07-04', 1, '10:00');

INSERT INTO sessao(idSessao, dataSessao, horarioSessao, idOrcamento, idPagamento)
VALUES
	(default, '2022-04-11', '15:00', 2, 1),
    (default, '2022-05-01', '08:00', 1, 1),
    (default, '2022-04-22', '10:00', 2, 1),
    (default, '2022-04-25', '13:00', 4, 2);

SET SQL_SAFE_UPDATES =0;

DELETE FROM telefones WHERE telefone LIKE '9%';

UPDATE cliente SET sobrenomeCliente = 'Sousa', cpfCliente = 12312312312, declaracaoSaude = 'Minha saude é ótima...', emailCliente = 'meu@email.com'
WHERE idCliente = 1;

UPDATE cliente SET sobrenomeCliente = 'Di Loreto', cpfCliente = 45645645644, declaracaoSaude = 'Eu tenho um problema de saude, que é...', emailCliente = 'um@email.com'
WHERE idCliente = 2;

UPDATE cliente SET sobrenomeCliente = 'Arrais', cpfCliente = 78978978978, declaracaoSaude = 'Sem nenhum problema...', emailCliente = 'contato@email.com'
WHERE idCliente = 4;

-- Orçamentos com visita agendada

SELECT orcamento.dataVisita AS 'Data da Visita', 
		orcamento.horarioVisita AS 'Horário da Visita', 
		cliente.nomeCliente AS Cliente, 
		tatuador.nomeTatuador AS Tatuador 
FROM orcamento
	INNER JOIN cliente 
		ON cliente.idCliente = orcamento.idCliente
	INNER JOIN tatuador
		ON tatuador.idTatuador = orcamento.idTatuador
	WHERE visitaOrcamento = 1;

-- Pesquisa de orcamento sem sessão agendada

SELECT c.nomeCliente AS 'Nome Cliente', 
	c.telefoneCliente AS 'Contato do Cliente',
	o.valorOrcamento AS 'Valor do Orçamento', 
    t.nomeTatuador AS 'Tatuador responsável' 
FROM orcamento AS o 
	INNER JOIN cliente AS c
		ON c.idCliente = o.idCliente
	INNER JOIN tatuador AS t
		ON t.idTatuador = o.idTatuador
	LEFT JOIN sessao AS s 
		ON o.idOrcamento = s.idOrcamento
	WHERE s.idOrcamento IS NULL;
    
-- sessões agendadas para o mês de abril 
SELECT * FROM sessao
WHERE dataSessao LIKE '____%04%__';

DELETE FROM orcamento WHERE idOrcamento = 3;

SELECT * FROM orcamento;