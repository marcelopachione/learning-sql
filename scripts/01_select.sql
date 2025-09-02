SELECT 'Ola Mundo'


-- Pratica

-- 1. Selecione todos os clientes com email cadastrado
    SELECT * FROM clientes WHERE FlEmail IS NOT NULL;

-- 2. Selecione todas transações de 50 pontos (exatos)
    SELECT * FROM transacoes WHERE QtdePontos = 50;

-- 3. Selecione todos clientes com mais de 500 pontos
    SELECT IdCliente FROM transacoes WHERE QtdePontos > 500;

-- 4. Selecione produtos que contêm ‘churn’ no nome
    SELECT * FROM produtos WHERE DescCateogriaProduto like '%churn%';

