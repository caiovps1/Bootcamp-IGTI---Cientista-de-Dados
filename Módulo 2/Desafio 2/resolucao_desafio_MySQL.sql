-- Pergunta 1: Quantas pessoas possuem idade maior ou igual a 50 anos?
SELECT COUNT(*)
FROM tb_pessoa
WHERE idade >= 50;
-- Resposta 1: 30

-- Pergunta 2: Qual a média de idade das pessoas que moram em Mato Grosso?
SELECT AVG(idade)
FROM tb_pessoa p
INNER JOIN tb_cidade c ON p.id_cidade = c.id
INNER JOIN tb_estado e ON c.id_estado = e.id
WHERE e.sigla = 'MT';
-- Resposta 2: 44.6

-- Pergunta 3: Quantas pessoas nasceram nos anos de 1968 a 1978 (incluindo 1968 e 1978)?
SELECT COUNT(*)
FROM tb_pessoa
WHERE YEAR(data_nasc) BETWEEN 1968 AND 1978;
-- Resposta 3: 14

-- Pergunta 4: Ao executar o seguinte comando SQL no banco de dados criado, qual é o valor retornado?
		/*
        select count(*) from tb_pessoa inner join
		tb_tiposanguineo on tb_pessoa.id_tiposanguineo =
		tb_tiposanguineo.id inner join tb_cidade on
		tb_pessoa.id_cidade = tb_cidade.id inner join
		tb_estado on tb_cidade.id_estado = tb_estado.id where
		tb_tiposanguineo.tipo like "AB-" and (tb_estado.sigla
		like "AP" or tb_estado.sigla like "PE")
        */
select count(*) from tb_pessoa inner join
tb_tiposanguineo on tb_pessoa.id_tiposanguineo =
tb_tiposanguineo.id inner join tb_cidade on
tb_pessoa.id_cidade = tb_cidade.id inner join
tb_estado on tb_cidade.id_estado = tb_estado.id where
tb_tiposanguineo.tipo like "AB-" and (tb_estado.sigla
like "AP" or tb_estado.sigla like "PE")
-- Resposta 4: 4

-- Pergunta 5: Qual o nome da pessoa mais velha na base de dados?
SELECT nome
FROM tb_pessoa
ORDER BY data_nasc ASC
LIMIT 1;
-- Resposta 5: Thales Bento

-- Pergunta 6: Qual o nome da pessoa mais nova da base de dados?
SELECT nome
FROM tb_pessoa
ORDER BY data_nasc DESC
LIMIT 1;
-- Resposta 6: João Pedro


