CREATE DATABASE formula1;

USE FORMULA1;

CREATE TABLE circuitos (
circuito_id INTEGER NOT NULL,
circuito_apelido VARCHAR(20) NOT NULL,
nome VARCHAR (40) NOT NULL,
cidade VARCHAR (25) NOT NULL,
pais VARCHAR (25) NOT NULL,
latitude VARCHAR (12) NOT NULL,
longitude VARCHAR (12) NOT NULL,
url VARCHAR (80) NOT NULL,
PRIMARY KEY (circuito_id)
);

SELECT * FROM circuitos;

CREATE TABLE pilotos (
piloto_id INTEGER NOT NULL,
piloto_apelido VARCHAR (20) NOT NULL,
numero VARCHAR(2) NULL,
codigo VARCHAR (5) NOT NULL,
nome VARCHAR (20) NOT NULL,
sobrenome VARCHAR (25) NOT NULL,
data_nascimento VARCHAR(10) NOT NULL,
nacionalidade VARCHAR(20) NOT NULL,
url VARCHAR(80) NOT NULL,
PRIMARY KEY (piloto_id)
);

SELECT * FROM pilotos;

CREATE TABLE construtores (
construtores_id INTEGER NOT NULL,
construtor_apelido VARCHAR(20) NOT NULL,
nome VARCHAR(25) NOT NULL,
nacionalidade VARCHAR (20) NOT NULL,
url VARCHAR (80) NOT NULL,
PRIMARY KEY (construtores_id)
);

SELECT * FROM construtores;

CREATE TABLE corridas (
corrida_id INTEGER NOT NULL,
ano VARCHAR (4) NOT NULL,
etapa INTEGER NOT NULL,
circuito_id INTEGER NOT NULL,
nome VARCHAR (35) NOT NULL,
data_corrida DATE NOT NULL,
horario VARCHAR (8) NULL,
url VARCHAR (80) NOT NULL,
PRIMARY KEY (corrida_id),
FOREIGN KEY (circuito_id) REFERENCES circuitos (circuito_id)
);

SELECT * FROM corridas;

CREATE TABLE temporadas (
ano VARCHAR(4) NOT NULL,
url VARCHAR (80) NOT NULL,
PRIMARY KEY (ano)
);

SELECT * FROM temporadas;

CREATE TABLE construtores_resultados (
construtores_resultado_id INTEGER NOT NULL,
corrida_id INTEGER NOT NULL,
construtores_id INTEGER NOT NULL,
pontos INTEGER NOT NULL,
PRIMARY KEY (construtores_resultado_id),
FOREIGN KEY (construtores_id) REFERENCES construtores (construtores_id),
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id)
);

SELECT * FROM construtores_resultados;

CREATE TABLE construtores_classificacao (
construtores_classificacao_id INTEGER NOT NULL,
corrida_id INTEGER NOT NULL,
construtores_id INTEGER NOT NULL,
pontos INTEGER NOT NULL,
posicao INTEGER NOT NULL,
vitorias INTEGER NOT NULL,
PRIMARY KEY (construtores_classificacao_id),
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id),
FOREIGN KEY (construtores_id) REFERENCES construtores (construtores_id)
);

SELECT * FROM construtores_classificacao;

CREATE TABLE pilotos_classificacao (
pilotos_classificacao_id INTEGER NOT NULL,
corrida_id INTEGER NOT NULL,
piloto_id INTEGER NOT NULL,
pontos INTEGER NOT NULL,
posicao INTEGER NOT NULL,
vitorias INTEGER NOT NULL,
PRIMARY KEY (pilotos_classificacao_id),
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id),
FOREIGN KEY (piloto_id) REFERENCES pilotos (piloto_id)
);

SELECT * FROM pilotos_classificacao;

CREATE TABLE laptimes (
corrida_id INTEGER NOT NULL,
piloto_id INTEGER NOT NULL,
volta INTEGER NOT NULL,
posicao INTEGER NOT NULL,
tempo VARCHAR (12) NOT NULL,
milissegundos VARCHAR (9) NOT NULL,
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id),
FOREIGN KEY (piloto_id) REFERENCES pilotos (piloto_id)
);

SELECT * FROM laptimes;

CREATE TABLE pitstops (
corrida_id INTEGER NOT NULL,
piloto_id INTEGER NOT NULL,
parada INTEGER NOT NULL,
volta INTEGER NOT NULL,
tempo VARCHAR (12) NOT NULL,
duracao VARCHAR (12) NOT NULL,
milissegundos VARCHAR (9) NOT NULL,
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id),
FOREIGN KEY (piloto_id) REFERENCES pilotos (piloto_id)
);

SELECT * FROM pistops;

CREATE TABLE classificacao (
classificacao_id INTEGER NOT NULL,
corrida_id INTEGER NOT NULL,
piloto_id INTEGER NOT NULL,
construtores_id INTEGER NOT NULL,
numero VARCHAR(2) NULL,
posicao INTEGER NOT NULL,
q1 VARCHAR (10) NULL,
q2 VARCHAR (10) NULL,
q3 VARCHAR(10) NULL,
PRIMARY KEY (classificacao_id),
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id),
FOREIGN KEY (piloto_id) REFERENCES pilotos (piloto_id),
FOREIGN KEY (construtores_id) REFERENCES construtores (construtores_id)
);

SELECT * FROM classificacao;

CREATE TABLE status (
status_id INTEGER NOT NULL,
status VARCHAR (25) NOT NULL,
PRIMARY KEY (status_id)
);

SELECT * FROM status;

CREATE TABLE resultados (
resultado_id INTEGER NOT NULL,
corrida_id INTEGER NOT NULL,
piloto_id INTEGER NOT NULL,
construtores_id INTEGER NOT NULL,
numero VARCHAR(3) NULL,
grid INTEGER NOT NULL,
posicao_text VARCHAR(2) NOT NULL,
posicao_real INTEGER NOT NULL,
pontos INTEGER NOT NULL,
voltas INTEGER NOT NULL,
tempo VARCHAR (12) NULL,
milissegundos VARCHAR (9) NULL,
volta_mais_rapida VARCHAR(3) NULL,
tempo_mais_rapido VARCHAR (12) NULL,
velocidade_maxima VARCHAR (8) NULL,
status_id INTEGER NOT NULL,
PRIMARY KEY (resultado_id),
FOREIGN KEY (corrida_id) REFERENCES corridas (corrida_id),
FOREIGN KEY (piloto_id) REFERENCES pilotos (piloto_id),
FOREIGN KEY (construtores_id) REFERENCES construtores (construtores_id),
FOREIGN KEY (status_id) REFERENCES status (status_id)
);

SELECT * FROM resultados;
