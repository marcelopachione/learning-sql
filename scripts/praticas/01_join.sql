-- Qual a categoria tem mais produtos vendidos?

SELECT p.DescCateogriaProduto,
    COUNT(DISTINCT tp.IdTransacao) AS QtdeTransacao

FROM transacao_produto AS tp

LEFT JOIN produtos p ON tp.IdProduto = p.IdProduto

GROUP BY p.DescCateogriaProduto

ORDER BY COUNT(DISTINCT tp.IdTransacao);