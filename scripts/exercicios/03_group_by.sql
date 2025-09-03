-- Qual cliente fez mais transações no ano de 2024?

SELECT IdCliente,
    COUNT(*),
    COUNT(DISTINCT IdTransacao)

FROM transacoes

-- WHERE DtCriacao >= '2024-01-01' AND DtCriacao < '2025-01-01'
WHERE strftime('%Y', substr(DtCriacao, 1, 19)) = '2024' -- melhor maneira

GROUP BY IdCliente

ORDER BY COUNT(*) DESC

LIMIT 1;