-- Dos clientes que começaram SQL no primeiro dia, quantos chegaram ao 5o dia?

SELECT COUNT(DISTINCT t1.IdCliente)

FROM transacoes AS t1

WHERE t1.IdCliente IN  (
    SELECT DISTINCT t2.IdCliente
    FROM transacoes AS t2

    WHERE substr(t2.DtCriacao, 1, 10) = '2025-08-25'
)

AND substr(t1.DtCriacao, 1, 10) = '2025-08-29'

