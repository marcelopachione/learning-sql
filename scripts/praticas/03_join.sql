-- Qual mês tivemos mais lista de presença assinada?

SELECT 
    substr(t.DtCriacao, 1, 7) AS anoMes,
    COUNT(DISTINCT t.IdTransacao) AS qtdTransacao

FROM transacoes AS t

LEFT JOIN transacao_produto AS tp ON t.IdTransacao = tp.IdTransacao

LEFT JOIN produtos AS p ON tp.IdProduto = p.IdProduto

WHERE p.DescProduto = 'Lista de presença'
--AND substr(t.DtCriacao,1,4) = '2024'

GROUP BY substr(t.DtCriacao, 1, 7)

ORDER BY COUNT(DISTINCT t.IdTransacao) DESC