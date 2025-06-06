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
  PRIMARY KEY (idUsuario),
  FOREIGN KEY (categoria_favorita) REFERENCES Categoria(idCategoria));

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

CREATE TABLE Quizz (
 	idPartida INT NOT NULL AUTO_INCREMENT,
    idPergunta INT NOT NULL,
	fkUsuario INT NOT NULL,
    acerto INT NOT NULL,
	PRIMARY KEY (idPartida, fkUsuario, idPergunta),
    FOREIGN KEY (idPergunta) REFERENCES Quizz_Questao(idPergunta),
    FOREIGN KEY (fkUsuario) REFERENCES Usuario(idUsuario)
);

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
('Ana Silva', 'anas', 'ana@email.com', '123@senha', 1),
('Bruno Costa', 'brunoc', 'bruno@email.com', 'abc@12345', 2),
('Carla Mendes', 'carlam', 'carla@email.com', 'passcarla!', 3);

select * from Usuario;

INSERT INTO Jogo (idJogo, nome, link, fkCategoria) VALUES
(1, 'Quizz', '#', 18),
(2, 'Sudoku', '#', 18);

select * from Quizz;

INSERT INTO Quizz_Questao (pergunta, alternativaA, alternativaB, alternativaC, alternativaD, alternativaCorreta)
VALUES
    ("Em qual console foi lançado o jogo 'Super Mario 64'?", "PlayStation", "Nintendo 64", "Sega Saturn", "Dreamcast", "alternativaB"),
    ("Qual o nome do protagonista da série 'The Legend of Zelda'?", "Zelda", "Ganondorf", "Link", "Samus", "alternativaC"),
    ("No jogo 'Minecraft', qual é o recurso necessário para fazer tochas?", "Ferro", "Madeira e carvão", "Pedra", "Diamante", "alternativaB"),
    ("No jogo 'Among Us', o que um impostor NÃO pode fazer?", "Sabotar", "Reportar corpos", "Fazer tarefas", "Matar tripulantes", "alternativaC"),
    ("Qual é o nome do reino onde se passa a maior parte dos jogos da série 'Mario'?", "Hyrule", "Mushroom Kingdom", "Tamriel", "Kanto", "alternativaB"),
    ("Qual desses é um famoso jogo de corrida da Nintendo?", "Need for Speed", "Forza Horizon", "Gran Turismo", "Mario Kart", "alternativaD"),
    ("Qual destes jogos foi lançado primeiro?", "Doom (1993)", "Half-Life (1998)", "Quake (1996)", "Duke Nukem 3D (1996)", "alternativaA"),
	("No universo de 'League of Legends', qual desses campeões é conhecido como 'O Curador das Florestas'?", "Maokai", "Zyra", "Ivern", "Soraka", "alternativaA"),
    ("Qual o nome da cidade onde se passa 'Resident Evil 2'?", "Silent Hill", "Midgar", "Raccoon City", "Arkham", "alternativaC"),
    ("Qual o nome do personagem principal do jogo indie 'Hollow Knight'?", "The Knight", "Hornet", "The Hollow", "Wanderer", "alternativaA"),
	("Qual é o nome do vilão principal em muitos jogos da série 'Super Mario'?", "Wario", "Bowser", "Donkey Kong", "Luigi", "alternativaB"),
    ("Em qual animal Sonic se transforma ao coletar todas as esmeraldas do caos?", "Lobo", "Raposa", "Ouriço dourado", "Coelho", "alternativaC"),
    ("Qual é o nome do campeão considerado a 'Caçadora das Sombras' em League of Legends?", "Ahri", "Ashe", "Vayne", "Leona", "alternativaC"),
    ("Qual é o nome da cidade fictícia onde se passa o jogo 'The Simpsons: Hit & Run'?", "Springfield", "Shelbyville", "Quahog", "South Park", "alternativaA"),
    ("Em qual plataforma foi lançado o primeiro jogo do 'Sonic the Hedgehog'?", "Nintendo", "PlayStation", "Sega Genesis/Mega Drive", "Xbox", "alternativaC"),
	("Em 'League of Legends', qual é o papel principal de Janna?", "Atiradora", "Mago de explosão", "Suporte", "Caçador", "alternativaC"),
	("Em 'The Sims', o que acontece se você remover a escada da piscina enquanto um Sim está nadando?", "Ele aprende a nadar melhor", "Nada acontece", "Ele não consegue sair e pode morrer", "Ele vira um tubarão", "alternativaC"),
	("Qual desses personagens não pertence ao universo de 'Super Smash Bros'?", "Kirby", "Samus", "Lara Croft", "Pikachu", "alternativaC"),
    ("Em 'Minecraft', qual mob explode ao se aproximar do jogador?", "Esqueleto", "Zumbi", "Creeper", "Enderman", "alternativaC"),
	("Em 'Pokémon', qual é o nome do vilão que lidera a Equipe Rocket?", "Brock", "Giovanni", "Ash", "James", "alternativaB"),
	("Em 'Counter-Strike: Global Offensive', o que o time terrorista precisa fazer para vencer uma rodada?", "Salvar reféns", "Desarmar a bomba", "Plantá-la e fazê-la explodir", "Defender a base", "alternativaC"),
	("Qual personagem é o mascote oficial da Nintendo?", "Sonic", "Mario", "Pikachu", "Link", "alternativaB");

INSERT INTO Quizz (idPergunta, fkUsuario, acerto) VALUES
(10, 1, 0);

SELECT * FROM Quizz;