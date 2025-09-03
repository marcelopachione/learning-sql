-- Lista de produtos com nome que termina com “Lover”;
SELECT IdProduto,
    DescProduto
FROM produtos
WHERE DescProduto LIKE '%Lover'