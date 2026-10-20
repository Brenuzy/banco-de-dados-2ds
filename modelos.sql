SELECT
    id,
    nome,
    categoria,
    preco,
    detalhes
FROM produtos;

-- Consulta 2: extrair propriedades específicas do JSON
SELECT
    nome,
    detalhes->>'$.marca' AS marca,
    detalhes->>'$.cor' AS cor,
    detalhes->>'$.memoria_gb' AS memoria_gb
FROM produtos;

-- Consulta 3: filtrar produtos pela marca armazenada no JSON
SELECT
    id,
    nome,
    preco,
    detalhes->>'$.marca' AS marca
FROM produtos
WHERE detalhes->>'$.marca' = 'TechMais';

-- Consulta 4: localizar produtos com pelo menos 8 GB de memória
SELECT
    id,
    nome,
    detalhes->>'$.memoria_gb' AS memoria_gb
FROM produtos
WHERE CAST(detalhes->>'$.memoria_gb' AS UNSIGNED) >= 8;

-- Consulta 5: verificar se o documento contém uma propriedade específica
SELECT
    id,
    nome,
    detalhes
FROM produtos
WHERE JSON_CONTAINS(detalhes, 'true', '$.resistencia_agua');

-- Consulta 6: atualizar uma propriedade do documento JSON
UPDATE produtos
SET detalhes = JSON_SET(detalhes, '$.garantia_meses', 12)
WHERE id IN (1, 2);

-- Conferir o resultado da atualização
SELECT
    id,
    nome,
    detalhes->>'$.garantia_meses' AS garantia_meses,
    detalhes
FROM produtos
WHERE id IN (1, 2);
