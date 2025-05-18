CREATE DATABASE projeto_pessoal;
USE projeto_pessoal;

CREATE TABLE Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  username Varchar(30) NOT NULL,
  email VARCHAR(45) NOT NULL,
  senha VARCHAR(25) NOT NULL,
  fkGuilda INT NULL,
  PRIMARY KEY (idUsuario));

CREATE TABLE Guilda (
  idGuilda INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  lider INT NOT NULL,
  PRIMARY KEY (idGuilda),
  FOREIGN KEY (lider) REFERENCES Usuario (idUsuario));

CREATE TABLE Amizade (
  idUsuario1 INT NOT NULL,
  idUsuario2 INT NOT NULL,
  usuario1Amizade TINYINT NOT NULL,
  usuario2Amizade TINYINT NOT NULL,
  PRIMARY KEY (idUsuario1, idUsuario2),
  FOREIGN KEY (idUsuario1) REFERENCES Usuario (idUsuario),
  FOREIGN KEY (idUsuario2) REFERENCES Usuario (idUsuario));

CREATE TABLE Jogos (
  idJogos INT NOT NULL,
  nome VARCHAR(45) NULL,
  link VARCHAR(45) NULL,
  PRIMARY KEY (idJogos));

CREATE TABLE historico_jogos (
  fkUsuario INT NOT NULL,
  fkJogos INT NOT NULL,
  data_hora VARCHAR(45) NOT NULL,
  pontuacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (fkUsuario, fkJogos),
  FOREIGN KEY (fkUsuario) REFERENCES Usuario (idUsuario),
  FOREIGN KEY (fkJogos) REFERENCES Jogos (idJogos));

ALTER TABLE Usuario ADD FOREIGN KEY (fkGuilda) REFERENCES Guilda (idGuilda);

INSERT INTO Usuario (nome, username, email, senha, fkGuilda) VALUES
('Ana Silva', 'anas', 'ana@email.com', '123senha', NULL),
('Bruno Costa', 'brunoc', 'bruno@email.com', 'abc123', NULL),
('Carla Mendes', 'carlam', 'carla@email.com', 'passcarla', NULL);

INSERT INTO Guilda (nome, descricao, lider) VALUES
('Guilda dos Dragões', 'Especialistas em PvP', 1),
('Guardas da Floresta', 'Focados em exploração', 2),
('Mestres do Código', 'Guilda de programadores', 3);

UPDATE Usuario SET fkGuilda = 1 WHERE idUsuario = 1;
UPDATE Usuario SET fkGuilda = 2 WHERE idUsuario = 2;
UPDATE Usuario SET fkGuilda = 3 WHERE idUsuario = 3;

INSERT INTO Amizade (idUsuario1, idUsuario2, usuario1Amizade, usuario2Amizade) VALUES
(1, 2, 1, 1),
(1, 3, 1, 0),
(2, 3, 1, 1);

INSERT INTO Jogos (idJogos, nome, link) VALUES
(1, 'BattleQuest', 'https://bq.com'),
(2, 'CodeRun', 'https://coderun.io'),
(3, 'Floresta Mística', 'https://florestamistica.net');

INSERT INTO historico_jogos (fkUsuario, fkJogos, data_hora, pontuacao) VALUES
(1, 1, '2025-05-17 15:00', '8500'),
(1, 2, '2025-05-17 17:30', '7300'),
(2, 1, '2025-05-16 14:20', '9100'),
(3, 3, '2025-05-16 19:10', '6800');