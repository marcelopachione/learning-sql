WITH tb_sumario_dias AS (

    SELECT  substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdeTrasacao

    FROM    transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY substr(DtCriacao, 1, 10)
)

SELECT  *,
    SUM(qtdeTrasacao) OVER (ORDER BY dtDia) AS qtdeTransacaoAcumulada

FROM tb_sumario_dias