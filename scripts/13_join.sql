SELECT tp.*,
    p.DescProduto

FROM transacao_produto AS tp

LEFT JOIN produtos p ON tp.IdProduto = p.IdProduto;


