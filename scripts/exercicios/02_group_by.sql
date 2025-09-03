-- Qual cliente juntou mais pontos positivos em 2025-05?
SELECT IdCliente,
    sum(QtdePontos) as TotalPontos

FROM transacoes

WHERE DtCriacao >= '2025-05-01'
AND DtCriacao < '2025-06-01'
AND QtdePontos > 0

GROUP BY IdCliente

ORDER BY sum(QtdePontos) DESC

LIMIT 1;


