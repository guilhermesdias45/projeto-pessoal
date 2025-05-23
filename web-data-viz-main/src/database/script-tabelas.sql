CREATE DATABASE projeto_pessoal;
USE projeto_pessoal;

CREATE TABLE Categoria (
	idCategoria INT AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL,
    descricao VARCHAR(100) NOT NULL,
    PRIMARY KEY (idCategoria)
);

CREATE TABLE Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  username Varchar(30) NOT NULL,
  email VARCHAR(45) NOT NULL,
  senha VARCHAR(25) NOT NULL,
  categoria_favorita int NOT NULL,
  fkGuilda INT NULL,
  PRIMARY KEY (idUsuario),
  FOREIGN KEY (categoria_favorita) REFERENCES Categoria(idCategoria));

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

CREATE TABLE Jogo (
  idJogo INT NOT NULL,
  nome VARCHAR(45) NULL,
  fkCategoria INT NOT NULL,
  link VARCHAR(150) NULL,
  PRIMARY KEY (idJogo),
  FOREIGN KEY (fkCategoria) REFERENCES Categoria (idCategoria)
);

CREATE TABLE Historico_Jogo (
  fkUsuario INT NOT NULL,
  fkJogo INT NOT NULL,
  data_hora VARCHAR(45) NOT NULL,
  pontuacao VARCHAR(45) NOT NULL,
  PRIMARY KEY (fkUsuario, fkJogo),
  FOREIGN KEY (fkUsuario) REFERENCES Usuario (idUsuario),
  FOREIGN KEY (fkJogo) REFERENCES Jogo (idJogo));

ALTER TABLE Usuario ADD FOREIGN KEY (fkGuilda) REFERENCES Guilda (idGuilda);

INSERT INTO Categoria (nome, descricao) VALUES
("RPG", "Jogos de RPG"),
("Ação", "Jogos de Ação"),
("Aventura", "Jogos de Aventura"),
("Estratégia", "Jogos de Estratégia"),
("Simulação", "Jogos de Simulação"),
("Esportes", "Jogos de Esportes");

INSERT INTO Usuario (nome, username, email, senha, fkGuilda, categoria_favorita) VALUES
('Ana Silva', 'anas', 'ana@email.com', '123senha', NULL, 1),
('Bruno Costa', 'brunoc', 'bruno@email.com', 'abc123', NULL, 2),
('Carla Mendes', 'carlam', 'carla@email.com', 'passcarla', NULL, 3);

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

select * from Usuario;

INSERT INTO Jogo (idJogo, nome, link, fkCategoria) VALUES
(1, 'BattleQuest', 'https://bq.com', 1),
(2, 'CodeRun', 'https://coderun.io', 2),
(3, 'Floresta Mística', 'https://florestamistica.net', 3);

INSERT INTO Historico_Jogo (fkUsuario, fkJogo, data_hora, pontuacao) VALUES
(1, 1, '2025-05-17 15:00', '8500'),
(1, 2, '2025-05-17 17:30', '7300'),
(2, 1, '2025-05-16 14:20', '9100'),
(3, 3, '2025-05-16 19:10', '6800');