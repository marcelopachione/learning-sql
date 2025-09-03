-- Lista de produtos que são “chapéu”;
SELECT IdProduto,
    DescProduto
FROM produtos
WHERE UPPER(DescProduto) LIKE UPPER('%chapéu%')
