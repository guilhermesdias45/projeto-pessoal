CREATE DATABASE projeto_pessoal;
USE projeto_pessoal;

CREATE TABLE Categoria (
	idCategoria INT AUTO_INCREMENT,
    nome VARCHAR(40) NOT NULL UNIQUE,
    descricao VARCHAR(200) NOT NULL,
    PRIMARY KEY (idCategoria)
);

CREATE TABLE Usuario (
  idUsuario INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(60) NOT NULL,
  username Varchar(30) NOT NULL UNIQUE,
  email VARCHAR(45) NOT NULL UNIQUE,
  senha VARCHAR(25) NOT NULL,
  categoria_favorita int NOT NULL,
--   fkGuilda INT NULL,
  PRIMARY KEY (idUsuario),
  FOREIGN KEY (categoria_favorita) REFERENCES Categoria(idCategoria));

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
  nome VARCHAR(45) NULL UNIQUE,
  fkCategoria INT NOT NULL,
  link VARCHAR(150) NULL,
  PRIMARY KEY (idJogo),
  FOREIGN KEY (fkCategoria) REFERENCES Categoria (idCategoria)
);

CREATE TABLE Historico_Jogo (
  fkUsuario INT NOT NULL,
  fkJogo INT NOT NULL,
  data_hora DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP(),
  pontos_numero INT,
  pontos_tempo TIME,
  PRIMARY KEY (fkUsuario, fkJogo, data_hora),
  FOREIGN KEY (fkUsuario) REFERENCES Usuario (idUsuario),
  FOREIGN KEY (fkJogo) REFERENCES Jogo (idJogo)
  );

-- CREATE TABLE Quizz (
-- 	idPartida INT NOT NULL AUTO_INCREMENT,
--     qtdAcertos INT NOT NULL,
--     PRIMARY KEY (idPergunta),
--     FOREIGN KEY (fkJogo) REFERENCES Jogo(idJogo)
-- );

CREATE TABLE Quizz_Questao (
	idPergunta INT NOT NULL AUTO_INCREMENT,
    pergunta VARCHAR(200) NOT NULL,
    alternativaA VARCHAR(50) NOT NULL,
    alternativaB VARCHAR(50) NOT NULL,
    alternativaC VARCHAR(50) NOT NULL,
    alternativaD VARCHAR(50) NOT NULL,
    alternativaCorreta VARCHAR(50) NOT NULL,
    PRIMARY KEY (idPergunta)
);

-- ALTER TABLE Usuario ADD FOREIGN KEY (fkGuilda) REFERENCES Guilda (idGuilda);

INSERT INTO Categoria (nome, descricao) VALUES
("RPG", "Jogos onde o jogador assume o papel de um personagem, evolui suas habilidades e explora narrativas complexas, geralmente com escolhas que afetam o enredo"),
("Ação", "Jogos focados na destreza, tempo de reação e coordenação motora, com combates rápidos e desafios constantes."),
("Aventura", "Jogos que priorizam a exploração, resolução de enigmas e desenvolvimento de histórias imersivas, com menos foco em combate direto."),
("Estratégia", "Jogos que exigem planejamento, tomada de decisões e administração de recursos, geralmente colocando o jogador no comando de exércitos ou civilizações."),
("Simulação", "Jogos que reproduzem aspectos da vida real ou situações específicas com alta fidelidade, como pilotar aviões, gerenciar cidades ou cuidar de fazendas."),
("Esportes", "Jogos que reproduzem competições esportivas reais ou fictícias, focando em habilidades, regras e dinâmicas típicas das modalidades."),
("FPS", "Jogos de tiro em que a perspectiva é em primeira pessoa, colocando o jogador no centro da ação com foco em mira, reflexos e precisão."),
("TPS", "Jogos de tiro com visão sobre o ombro ou atrás do personagem, que combinam combate tático, movimentação estratégica e exploração do ambiente."),
("Plataforma","Jogos focados em saltos precisos e exploração, onde o personagem avança superando obstáculos e coletando itens em ambientes cheios de plataformas."),
("Corrida","Jogos que simulam competições de velocidade, onde o principal desafio é conduzir veículos com precisão, superando adversários ou cronômetros."),
("Luta", "Jogos que colocam personagens em combates corpo a corpo ou com armas, priorizando combos, estratégias de ataque e defesa em confrontos diretos."),
("Sobrevivência", "Jogos que combinam elementos de sobrevivência com terror, explorando ambientes hostis, escassez de recursos e ameaças constantes."),
("MMORPG", "Jogos de RPG jogados online em larga escala, onde milhares de jogadores interagem simultaneamente em um mundo virtual persistente."),
("Battle Royale", "Jogos de sobrevivência onde dezenas ou centenas de jogadores competem entre si até restar apenas um vencedor, geralmente em mapas que vão se reduzindo."),
("Sandbox", "Jogos que oferecem liberdade quase total ao jogador para explorar, construir ou modificar o mundo virtual, com pouca ou nenhuma limitação linear."),
("Ritmo", "Jogos que desafiam o jogador a realizar ações no tempo correto, seguindo o ritmo e a melodia de músicas, exigindo precisão e coordenação."),
("Party Games", "Jogos projetados para múltiplos participantes, focando na diversão em grupo com regras simples, desafios rápidos e muita interação social."),
("Puzzle", "Jogos que desafiam o raciocínio lógico, a percepção espacial ou a memória, exigindo a solução de quebra-cabeças ou problemas.");

INSERT INTO Usuario (nome, username, email, senha, categoria_favorita) VALUES
('Ana Silva', 'anas', 'ana@email.com', '123senha', 1),
('Bruno Costa', 'brunoc', 'bruno@email.com', 'abc123', 2),
('Carla Mendes', 'carlam', 'carla@email.com', 'passcarla', 3);

select * from Usuario;

INSERT INTO Jogo (idJogo, nome, link, fkCategoria) VALUES
(1, 'BattleQuest', 'https://bq.com', 1),
(2, 'CodeRun', 'https://coderun.io', 2),
(3, 'Floresta Mística', 'https://florestamistica.net', 3);

INSERT INTO Historico_Jogo (fkUsuario, fkJogo, data_hora, pontos_numero) VALUES
(1, 1, '2025-05-17 15:00', '8500'),
(1, 2, '2025-05-17 17:30', '7300'),
(2, 1, '2025-05-16 14:20', '9100'),
(3, 3, '2025-05-16 19:10', '6800');

INSERT INTO Quizz_Questao (pergunta, alternativaA, alternativaB, alternativaC, alternativaD, alternativaCorreta)
VALUES
	("Qual mês tem 30 dias?", "Janeiro", "Dezembro", "Junho", "Agosto", "alternativaC"),
    ("Quantas horas tem em um dia?", "30 horas", "38 horas", "48 horas", "24 horas", "alternativaD"),
    ("Qual destes números é ímpar?", "Dez", "Doze", "Oito", "Onze", "alternativaD");

SELECT pergunta, alternativaA, alternativaB, alternativaC, alternativaD, alternativaCorreta
FROM Quizz_Questao;