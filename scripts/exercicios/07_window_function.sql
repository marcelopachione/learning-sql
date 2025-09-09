-- Qual o dia da semana mais ativo de cada usuário?

-- Resposta CHATGPT
-- WITH eventos AS (
--   SELECT
--     IdCliente,
--     -- pega só "YYYY-MM-DD HH:MM:SS" e converte para datetime
--     datetime(substr(DtAtualizacao, 1, 19)) AS dt
--   FROM clientes
--   WHERE DtAtualizacao IS NOT NULL
-- ),
-- por_dow AS (
--   SELECT
--     IdCliente,
--     CAST(strftime('%w', dt) AS INTEGER) AS dow_idx,  -- 0=Dom, 1=Seg, ..., 6=Sáb
--     COUNT(*) AS qtd
--   FROM eventos
--   GROUP BY IdCliente, dow_idx
-- ),
-- ranked AS (
--   SELECT
--     IdCliente,
--     dow_idx,
--     qtd,
--     ROW_NUMBER() OVER (
--       PARTITION BY IdCliente
--       ORDER BY qtd DESC, dow_idx ASC   -- desempate opcional: menor índice primeiro
--     ) AS rn
--   FROM por_dow
-- )
-- SELECT
--   IdCliente,
--   CASE dow_idx
--     WHEN 0 THEN 'Domingo'
--     WHEN 1 THEN 'Segunda'
--     WHEN 2 THEN 'Terça'
--     WHEN 3 THEN 'Quarta'
--     WHEN 4 THEN 'Quinta'
--     WHEN 5 THEN 'Sexta'
--     WHEN 6 THEN 'Sábado'
--   END AS DiaSemanaMaisAtivo,
--   qtd AS QtdeAtividadesNoDia
-- FROM ranked
-- WHERE rn = 1
-- ORDER BY IdCliente;

WITH tb_cliente_semana AS (

    SELECT  IdCliente,
        strftime('%w', substr(DtCriacao, 1, 10)) AS dtDiaSemana,
        count(DISTINCT IdTransacao) AS qtdeTransacao

    FROM transacoes

    GROUP BY IdCliente, strftime('%w', substr(DtCriacao, 1, 10))

    ORDER BY IdCliente

),

tb_rn AS (

    SELECT *,
        ROW_NUMBER() OVER (PARTITION BY IdCliente ORDER BY qtdeTransacao DESC) AS rn

    FROM tb_cliente_semana

)

SELECT  *

FROM tb_rn

WHERE rn = 1