/*1) Quantas voltas totais foram realizadas nas corridas “Brazilian grand Pix?”*/

/*COMANDO DE EXECUÇÃO*/
SELECT nome, COUNT(*) AS corridas_realizadas FROM corridas GROUP BY nome ORDER BY corridas_realizadas DESC;

/*3) Qual nacionalidade que teve mais vitórias entre 2000 e 2009?*/

/*CRIAÇÃO DA VIEW PARA AGRUPAR AS TABELAS PILOTOS E PILOTOS_CLASSIFICACAO*/

CREATE VIEW VITORIAS_PAIS AS 
SELECT a.piloto_apelido AS PILOTO, a.nacionalidade AS PAIS,
b.vitorias AS Vitorias
FROM pilotos a, pilotos_classificacao b
WHERE a.piloto_id = b.piloto_id;

/*COMANDO DE EXECUÇÃO*/
SELECT *, COUNT(PAIS) AS TOTAL_VITORIAS FROM vitorias_pais WHERE  vitorias=1 OR vitorias ='1' GROUP BY PAIS order by TOTAL_VITORIAS DESC;

/* 4) QUAIS PILOTOS BRITÂNICOS POSSUEM MAIS DE 100 PONTOS NA HISTÓRIA? */
SELECT CONCAT( p.nome, ' ', p.sobrenome) AS nome_completo,
(SELECT SUM(r.pontos) FROM resultados AS r WHERE r.piloto_id = p.piloto_id) 
AS pontos_totais FROM pilotos AS p WHERE p.nacionalidade = 'British' 
GROUP BY (piloto_id) HAVING pontos_totais >= 100 ORDER BY pontos_totais DESC;

/* 5) QUANTOS PONTOS OS PAÍSES DA ÁMERICA DO SUL POSSUEM?*/
/* PAÍSES SEM PILOTOS NA BASE DE DADOS: PERU, EQUADOR, GUIANAS E SURINAME */
SELECT p.nacionalidade, sum(r.pontos) AS quantidade_pontos
FROM pilotos p JOIN resultados r USING(piloto_id) 
WHERE p.nacionalidade in ('Brazilian', 'Argentine', 'Chilean', 'Uruguayan', 'Paraguayan', 'Bolivian', 'Colombian', 'Venezuelan') 
GROUP BY(p.nacionalidade) ORDER BY sum(r.pontos) DESC;

/* 6) Quais são as construtoras mais vitoriosas? */
SELECT c.nome, count(cc.posicao) AS vitorias_totais
FROM construtores_classificacao AS cc 
INNER JOIN construtores AS c USING (construtores_id) 
GROUP BY (construtores_id) HAVING count(cc.posicao) >= 1 ORDER BY vitorias_totais DESC LIMIT 15;

/*7) Quais o maiores piloto de Fórmula 1 de todos os tempos?*/

/*COMANDO DE EXECUÇÃO*/
SELECT CONCAT(pilotos.nome, ' ', pilotos.sobrenome) AS nome_completo,
COUNT(resultados.posicao_real) AS vitorias_totais FROM resultados
INNER JOIN pilotos USING (piloto_id) WHERE resultados.posicao_real = 1 GROUP BY (piloto_id) ORDER BY vitorias_totais DESC LIMIT 10;

/*8) - Laura alterou e fez;*/

/*9) Qual piloto mais correu na Fórmula 1?*/
select count(r.piloto_id) AS qtd_corridas, concat(p.nome, ' ', p.sobrenome)
from resultados AS r inner join pilotos AS p using (piloto_id) 
group by(piloto_id) order by qtd_corridas desc limit 15;



/*10) Qual o ranking de vitórias e pontuação de motoristas de F1 brasileiros em todos os anos (de 1950 a 2018)?*/
CREATE VIEW VITORIAS_PAIS AS 
SELECT a.piloto_apelido AS PILOTO, a.nacionalidade AS PAIS,
b.vitorias AS Vitorias
FROM pilotos a, pilotos_classificacao b
WHERE a.piloto_id = b.piloto_id;

/*COMANDO DE EXECUÇÃO*/
SELECT *, COUNT(PAIS) AS TOTAL_VITORIAS FROM vitorias_pais WHERE vitorias=1 OR vitorias ='1' GROUP BY PAIS order by TOTAL_VITORIAS DESC LIMIT 10;

/*11) Qual é o recorde de tempo do pitStop mais demorado (maior duração) e o mais rápido (de menor duração)? Quando e onde aconteceram?*/
/*CRIAÇÃO DA VIEW PARA AGRUPAR AS TABELAS CORRIDAS E PITSTOP*/
CREATE VIEW PITSTOP_CORRIDAS AS 
SELECT a.duracao,
b.nome, b.data_corrida
FROM pitstops a, corridas b
WHERE a.corrida_id = b.corrida_id;

/*COMANDO DE EXECUÇÃO*/

SELECT * FROM PITSTOP_CORRIDAS ORDER BY duracao DESC LIMIT 10; /*MENOR DURAÇÃO*/
SELECT * FROM PITSTOP_CORRIDAS ORDER BY duracao ASC LIMIT 10; /*MAIOR DURAÇÃO*/

/*12) Qual é a escudaria com maior quantidade de vitórias de 1950 a 2018? E a com o menor número de vitórias nesse período?*/
/*CRIAÇÃO DA VIEW PARA AGRUPAR AS TABELAS CONSTRUTORES E CONSTRUTORES_CLASSIFICAÇÃO*/
CREATE VIEW ESCUDERIA_CORRIDAS AS 
SELECT a.corrida_id, a.construtores_id, a.vitorias,
b.nome
FROM construtores_classificacao a, construtores b
WHERE a.construtores_id = b.construtores_id;

/*COMANDO DE EXECUÇÃO*/
SELECT *, SUM(vitorias) AS ESCUDERIA_VITORIAS FROM ESCUDERIA_CORRIDAS GROUP BY nome order by ESCUDERIA_VITORIAS DESC LIMIT 10; /*MAIOR QUANTIDADE*/
SELECT *, SUM(vitorias) AS ESCUDERIA_VITORIAS FROM ESCUDERIA_CORRIDAS GROUP BY nome order by ESCUDERIA_VITORIAS ASC; /*MENOR QUANTIDADE*/









