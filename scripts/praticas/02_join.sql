-- Em 2024, quantas transações de Lovers tivemos?

SELECT p.DescCateogriaProduto,
    COUNT(DISTINCT T.IdTransacao) AS TotalTransacoes_2024

FROM transacoes AS t

LEFT JOIN transacao_produto AS tp ON t.IdTransacao = tp.IdTransacao

LEFT JOIN produtos AS p ON tp.IdProduto = p.IdProduto

WHERE substr(t.DtCriacao,1,4) = '2024'
-- AND P.DescCateogriaProduto = 'lovers'

GROUP BY p.DescCateogriaProduto
HAVING COUNT(DISTINCT T.IdTransacao) <= 1000

ORDER BY COUNT(DISTINCT T.IdTransacao) DESC
