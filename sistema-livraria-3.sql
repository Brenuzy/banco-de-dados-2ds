-- Criação das Tabelas
CREATE TABLE Clientes (
    ID INT PRIMARY KEY,
    nomeCliente VARCHAR(100),
    emailCliente VARCHAR(100)
);

CREATE TABLE Compras (
    CompraID INT PRIMARY KEY,
    ClienteID INT,
    NomeLivro VARCHAR(100)
);

-- Inserção de Dados
INSERT INTO Clientes (ID, nomeCliente, emailCliente) VALUES 
(1, 'Carlos Silva', 'carlos@email.com'),
(2, 'Ana Souza', 'ana@email.com'),
(3, 'Rodrigo Lima', 'rodrigo@email.com'); -- CLIENTE SEM COMPRAS

INSERT INTO Compras (CompraID, ClienteID, NomeLivro) VALUES 
(101, 1, 'O Hobbit'),
(102, 999, 'Livro Sem Dono Opcional'),
(103, 2, 'O Quarto de Despejo');

