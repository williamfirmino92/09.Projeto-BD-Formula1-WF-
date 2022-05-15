/* QUAIS PILOTOS BRITÂNICOS POSSUEM MAIS DE 100 PONTOS NA HISTÓRIA? */
SELECT CONCAT( p.nome, ' ', p.sobrenome) AS nome_completo,
(SELECT SUM(r.pontos) FROM resultados AS r WHERE r.piloto_id = p.piloto_id) 
AS pontos_totais FROM pilotos AS p WHERE p.nacionalidade = 'British' 
GROUP BY (piloto_id) HAVING pontos_totais >= 100 ORDER BY pontos_totais DESC;

/* QUANTOS PONTOS OS PAÍSES DA ÁMERICA DO SUL POSSUEM?*/
/* PAÍSES SEM PILOTOS NA BASE DE DADOS: PERU, EQUADOR, GUIANAS E SURINAME */
SELECT p.nacionalidade, sum(r.pontos) AS quantidade_pontos
FROM pilotos p JOIN resultados r USING(piloto_id) 
WHERE p.nacionalidade in ('Brazilian', 'Argentine', 'Chilean', 'Uruguayan', 'Paraguayan', 'Bolivian', 'Colombian', 'Venezuelan') 
GROUP BY(p.nacionalidade) ORDER BY sum(r.pontos) DESC;

/* Quais são as construtoras mais vitoriosas? */
SELECT c.nome, count(cc.posicao) AS vitorias_totais
FROM construtores_classificacao AS cc 
INNER JOIN construtores AS c USING (construtores_id) 
GROUP BY (construtores_id) HAVING count(cc.posicao) >= 1 ORDER BY vitorias_totais DESC LIMIT 15;


