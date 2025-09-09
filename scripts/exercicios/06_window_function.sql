-- Quantidade de usuários cadastrados (absoluto e acumulado) ao longo do tempo?
WITH tb_dia_cliente AS (
    SELECT  substr(dtCriacao, 1, 10) AS dtDia,
        count(DISTINCT idCliente) AS qtdeCliente

    FROM clientes

    GROUP BY substr(dtCriacao, 1, 10)
)

SELECT  *,
    sum(qtdeCliente) OVER (ORDER BY dtDia) as qtdeClienteAcum

FROM tb_dia_cliente

ORDER BY dtDia