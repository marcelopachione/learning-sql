-- Como foi a curva de Churn do Curso de SQL?

-- SELECT  substr(DtCriacao, 1, 10) AS dtDia,
--         count(DISTINCT IdCliente) AS qtdeCliente

-- FROM transacoes

-- WHERE DtCriacao >= '2025-08-25'
-- AND DtCriacao < '2025-08-30'

-- GROUP BY substr(DtCriacao, 1, 10)

WITH tb_cliente_d1 AS (

    SELECT  DISTINCT IdCliente

    FROM    transacoes

    WHERE DtCriacao >= '2025-08-25'
    AND DtCriacao < '2025-08-26'

),

tb_join AS (

    SELECT  substr(t2.DtCriacao, 1, 10) AS dtDia,
        count(DISTINCT t1.IdCliente) AS qtdeCliente,
        (1.* count(DISTINCT t1.IdCliente) / (select count(*) from tb_cliente_d1)) * 100 AS pctRetencao,
        1 - 1. * count(DISTINCT t1.IdCliente) / (select count(*) from tb_cliente_d1) AS pctChurn

    FROM tb_cliente_d1 AS t1

    LEFT JOIN transacoes AS t2
        ON t1.IdCliente = t2.IdCliente

    WHERE t2.DtCriacao >= '2025-08-25'
    AND t2.DtCriacao < '2025-08-30'

    GROUP BY substr(t2.DtCriacao, 1, 10)
)

SELECT * FROM tb_join;