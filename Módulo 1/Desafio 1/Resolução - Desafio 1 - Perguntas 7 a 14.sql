-- RESOLUÇÃO DAS QUESTÕES 7 A 14

-- Questão 7
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Qual a média salarial nessa empresa?

SELECT AVG(salario)
FROM empregado;

-- Resultado: 35125


-- Questão 8
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Quantos empregados do departamento 5 trabalham mais de 10h por semana 
-- no projeto chamado "ProductX"?

SELECT  e.pnome nome_empregado,
        e.dno departamento,
        pr.pjnome nome_projeto, 
        te.horas horas_dedicadas
FROM empregado e
INNER JOIN trabalha_em te on e.ssn = te.essn
INNER JOIN projeto pr ON pr.pnumero = te.pno
WHERE e.dno = 5
AND pr.pjnome = 'ProductX'
AND te.horas > 10;

-- Ou, de maneira mais generalista:

SELECT COUNT(e.pnome) quantidade
FROM empregado e
INNER JOIN trabalha_em te on e.ssn = te.essn
INNER JOIN projeto pr ON pr.pnumero = te.pno
WHERE e.dno = 5
AND pr.pjnome = 'ProductX'
AND te.horas > 10;

-- Resultado: 2


-- Questão 9
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Quantos empregados possuem um dependente com o mesmo primeiro nome que o deles?

SELECT COUNT(e.pnome) quantidade
FROM empregado e
INNER JOIN dependente d ON e.ssn = d.essn
WHERE e.pnome = d.nome_dependente;

-- Resultado: 0


-- Questão 10
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Quais os nomes de todos os empregados que são diretamente supervisionados 
-- por Franklin Wong?

SELECT e.pnome
FROM (SELECT (pnome || ' ' || unome) nome_do_supervisor,
      ssn,
      pnome
     FROM empregado) tab
INNER JOIN empregado e ON tab.ssn = e.superssn
WHERE tab.nome_do_supervisor = 'Franklin Wong';

-- Resultado: Joyce e Ramesh


-- Questão 11
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Quem é a pessoa que possui mais tempo de alocação no projeto'Newbenefits'?

WITH max_horas AS (  
    SELECT  te.pno pno,
            MAX(te.horas) max_horas
    FROM trabalha_em te
    INNER JOIN projeto pr ON pr.pnumero = te.pno
    GROUP by te.pno
    )

SELECT  e.pnome empregado, 
        te.horas horas
FROM empregado e
INNER JOIN trabalha_em te on e.ssn = te.essn
INNER JOIN projeto pr ON pr.pnumero = te.pno
LEFT JOIN max_horas mh on mh.pno = pr.pnumero
WHERE pr.pjnome = 'Newbenefits'
AND te.horas = mh.max_horas;

-- Resultado: Alicia


-- Questão 12
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Qual é a soma dos salários de todos os empregados do departamento 
-- chamado 'Research'?

SELECT SUM(e.salario) soma_salarios
FROM empregado e
INNER JOIN departamento d ON e.dno = d.dnumero
WHERE d.dnome = 'Research';

-- Resultado: 133.000


-- Questão 13
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Qual seria o custo do projeto com folha salarial (soma de todos os salários) 
-- caso a empresa desse 10% de aumento para todos os empregados que trabalham 
-- no projeto 'ProductX'?

SELECT (SUM(e.salario)*1.1) soma_salarios_aumento
FROM empregado e
INNER JOIN trabalha_em te on e.ssn = te.essn
INNER JOIN projeto pr ON pr.pnumero = te.pno
WHERE pr.pjnome = 'ProductX';

-- Resultado: 60.500


-- Questão 14
-- Considere o banco de dados do enunciado. 
-- Crie uma consulta em SQL e responda: 
-- Qual o nome do departamento com a menor média de salário entre seus funcionários?

SELECT  d.dnome dept,
        AVG(e.salario) media_salarios
FROM empregado e
INNER JOIN departamento d ON e.dno = d.dnumero
GROUP BY d.dnome;

-- Resultado: Administration (31.000)