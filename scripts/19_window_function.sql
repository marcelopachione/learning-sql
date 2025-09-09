WITH tb_cliente_dia AS (

    SELECT  DISTINCT IdCliente,
        substr(DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT IdTransacao) AS qtdeTrasacao

    FROM    transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-30'

    GROUP BY IdCliente, substr(DtCriacao, 1, 10)

),

tb_lag AS (

    SELECT *,
        sum(qtdeTrasacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS Acumulado,
        lag(qtdeTrasacao) OVER (PARTITION BY IdCliente ORDER BY dtDia) AS lagTransacao
    
    FROM tb_cliente_dia
)

SELECT  *,
    1.* qtdeTrasacao / lagTransacao

FROM tb_lag

