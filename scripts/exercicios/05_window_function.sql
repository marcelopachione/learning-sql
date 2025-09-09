-- Quantidade de transações Acumuladas ao longo do tempo (diario)?

WITH tb_diario AS (

    SELECT  substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    GROUP BY substr(DtCriacao, 1, 10)

    ORDER BY substr(DtCriacao, 1, 10)

), 

tb_acum AS (

    SELECT *,
        sum(qtdeTransacao) OVER (ORDER BY dtDia) AS qtdeTransacaoAcum

    FROM tb_diario

)

-- A query abaixo responde a questao
-- SELECT  *

-- FROM tb_acum

-- Aproveitando o codigo foi gerada uma nova questao. 
-- Quando a data que foi atingida 100k transacoes?
SELECT  *

FROM tb_acum

WHERE qtdeTransacaoAcum > 100000

ORDER BY qtdeTransacaoAcum

LIMIT 1