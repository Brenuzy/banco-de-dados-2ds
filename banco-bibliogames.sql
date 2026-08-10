-- ====================================================================
-- 1. CRIAÇÃO DAS TABELAS
-- ====================================================================

CREATE TABLE jogador (
    id_jogador INT PRIMARY KEY,
    nome VARCHAR(50),
    status_jogador VARCHAR(10), -- free ou premium
    anos_inativo INT
);

CREATE TABLE biblioteca (
    id_jogo INT PRIMARY KEY,
    nome_jogo VARCHAR(50),
    genero VARCHAR(30),
    id_jogador INT,
    FOREIGN KEY (id_jogador) REFERENCES jogador(id_jogador)
);

-- ====================================================================
-- 2. POPULANDO O BANCO DE DADOS (10 JOGOS POPULARES)
-- ====================================================================

-- Inserindo 5 jogadores (sendo 2 inativos há mais de 2 anos: Amanda e Danielle)
INSERT INTO jogador VALUES
(1, 'Carlos', 'premium', 0),
(2, 'Amanda', 'free', 3),
(3, 'Bruno', 'free', 0),
(4, 'Danielle', 'premium', 4),
(5, 'Lucas', 'free', 1);

-- Inserindo 10 jogos famosos (com relacionamentos e alguns NULLs para os testes de JOIN)
INSERT INTO biblioteca VALUES
(101, 'Minecraft', 'Sandbox', 1),
(102, 'GTA V', 'Ação', 1),
(103, 'League of Legends', 'MOBA', 2),
(104, 'Valorant', 'FPS', 3),
(105, 'Counter-Strike 2', 'FPS', 3),
(106, 'The Witcher 3', 'RPG', NULL),
(107, 'Cyberpunk 2077', 'RPG', NULL),
(108, 'Elden Ring', 'RPG', 5),
(109, 'Fortnite', 'Battle Royale', 5),
(110, 'Roblox', 'Sandbox', 5);

-- ====================================================================
-- 3. CONSULTAS SIMPLES (SELECT FROM)
-- ====================================================================

-- Consulta A: Listar todos os registros e colunas da tabela jogador
SELECT * FROM jogador;

-- Consulta B: Listar especificamente o nome e o gênero dos jogos na biblioteca
SELECT nome_jogo, genero FROM biblioteca;

-- ====================================================================
-- 4. ATUALIZAÇÕES (UPDATE)
-- ====================================================================

-- Atualização A: Alterar o status do jogador de ID 1 para 'premium'
UPDATE jogador SET status_jogador = 'premium' WHERE id_jogador = 1;

-- Atualização B: Corrigir ou alterar o gênero do jogo GTA V para 'Aventura'
UPDATE biblioteca SET genero = 'Aventura' WHERE id_jogo = 102;

-- ====================================================================
-- 5. CONSULTA COM DISTINCT
-- ====================================================================

-- Listar os gêneros de jogos cadastrados eliminando as duplicatas da busca
SELECT DISTINCT genero FROM biblioteca;

-- ====================================================================
-- 6. CONSULTA COM WHERE E BETWEEN
-- ====================================================================

-- Buscar todos os jogadores que estão inativos em um intervalo de 1 a 3 anos
SELECT * FROM jogador WHERE anos_inativo BETWEEN 1 AND 3;

-- ====================================================================
-- 7. CONSULTA COM WHERE E AND
-- ====================================================================

-- Buscar jogadores que utilizam contas 'free' E que possuem pelo menos 1 ano de inatividade
SELECT * FROM jogador WHERE status_jogador = 'free' AND anos_inativo > 0;

-- ====================================================================
-- 8. CONSULTAS COM JOIN
-- ====================================================================

-- Consulta A: INNER JOIN
-- Retorna apenas os registros que possuem correspondência exata em AMBAS as tabelas[cite: 12].
-- Se um jogador não tiver jogo ou um jogo não tiver jogador, eles não aparecem[cite: 13, 14].
SELECT jogador.nome, biblioteca.nome_jogo
FROM jogador
INNER JOIN biblioteca
ON jogador.id_jogador = biblioteca.id_jogador;

-- Consulta B: LEFT JOIN
-- Retorna TODOS os registros da tabela da ESQUERDA (jogador)[cite: 26].
-- Caso o jogador não possua nenhum jogo associado, o campo do jogo exibirá NULL[cite: 27].
SELECT jogador.nome, biblioteca.nome_jogo
FROM jogador
LEFT JOIN biblioteca
ON jogador.id_jogador = biblioteca.id_jogador;

-- Consulta C: RIGHT JOIN
-- Retorna TODOS os registros da tabela da DIREITA (biblioteca)[cite: 50].
-- Caso o jogo não esteja associado a nenhum jogador cadastrado, o campo do jogador exibirá NULL[cite: 50].
SELECT jogador.nome, biblioteca.nome_jogo
FROM jogador
RIGHT JOIN biblioteca
ON jogador.id_jogador = biblioteca.id_jogador;

-- ====================================================================
-- 9. REMOÇÃO DE REGISTROS (DELETE FROM WHERE)
-- ====================================================================

-- Excluir definitivamente do banco os jogadores que estão inativos há mais de 2 anos
DELETE FROM jogador WHERE anos_inativo > 2;

