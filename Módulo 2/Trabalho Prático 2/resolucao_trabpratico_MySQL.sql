-- Pergunta 1: Quantos registros são retornados ao executar o seguinte comando sql
-- no banco de dados após ter povoado a tabela de estados: 
-- 			SELECT *
-- 			FROM estado 
-- 			WHERE NomeEstado like 'P%';		?
SELECT *
FROM estado 
WHERE NomeEstado like 'P%';
-- Resultado 1: 5

-- Pergunta 2: Após executar todos os passos do enunciado do trabalho prático e ter
-- povoado todas as tabelas do banco de dados, qual o total de registros
-- da tabela ‘caracteristicasgerais’?
SELECT COUNT(*)
FROM caracteristicasgerais;
-- Resposta 2: 13

-- Pergunta 3: Crie uma consulta sql para verificar a quantidade de imóveis
-- cadastrados no estado de RS. Após executar esse sql, qual o valor retornado?
SELECT COUNT(*)
FROM imovel i 
INNER JOIN cidade c ON c.CodigoCompletoIBGE = i.CodigoCompletoIBGE
INNER JOIN estado e ON e.CodEstadoIBGE = c.CodEstadoIBGE
WHERE e.SiglaEstado = 'RS';
-- Resposta 3: 8

-- Perguntas 4 a 10 são de teor teórico ou de teste e erro.

-- Pergunta 11: Crie uma consulta sql para contar quantos estados possuem imóveis
-- cadastrados em que o valor do IPTU é igual a R$ 0,00. Após executar
-- esse sql, qual o valor retornado?
SELECT COUNT(DISTINCT e.SiglaEstado)
FROM estado e
INNER JOIN cidade c ON c.CodEstadoIBGE = e.CodEstadoIBGE
INNER JOIN imovel i ON i.CodigoCompletoIBGE = c.CodigoCompletoIBGE
WHERE i.valorCondominio = 0;
-- Resposta 11: 7

-- Perguntas 12 e 13 são de teor teórico ou de teste e erro.

-- Pergunta 14: Quantos registros foram inseridos na tabela
-- ‘caracteristicageralimovel’? Crie um sql que realize a consulta.
SELECT COUNT(*)
FROM caracteristicageralimovel;
-- Resposta 14: 103 (resposta correta é 104, porém a questão veio com erro)

-- Pergunta 15: Qual o número do registro do imóvel (coluna codRegistro) que possui o
-- maior valor de condomínio? Crie um sql que realize a consulta.
SELECT codRegistro
FROM imovel
ORDER BY valorCondominio DESC
LIMIT 1;
-- Resultado 15: 8004320000000
