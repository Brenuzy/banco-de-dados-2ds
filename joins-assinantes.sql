-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)

CREATE TABLE Ramo_Atividade (cd_ramo INT PRIMARY KEY, ds_ramo VARCHAR(50));
CREATE TABLE Tipo_Assinante (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
CREATE TABLE Municipio (cd_municipio INT PRIMARY KEY, ds_municipio VARCHAR(50));

CREATE TABLE Assinante (
    cd_assinante INT PRIMARY KEY,
    nm_assinante VARCHAR(100),
    cd_ramo INT,
    cd_tipo INT,
    FOREIGN KEY (cd_ramo) REFERENCES Ramo_Atividade(cd_ramo),
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Assinante(cd_tipo)
);

CREATE TABLE Endereco (
    cd_endereco INT PRIMARY KEY,
    ds_endereco VARCHAR(100),
    cd_assinante INT,
    cd_municipio INT,
    FOREIGN KEY (cd_assinante) REFERENCES Assinante(cd_assinante),
    FOREIGN KEY (cd_municipio) REFERENCES Municipio(cd_municipio)
);

CREATE TABLE Telefone (
    cd_fone INT PRIMARY KEY,
    n_fone VARCHAR(20),
    cd_endereco INT,
    FOREIGN KEY (cd_endereco) REFERENCES Endereco(cd_endereco)
);

-- Inserções para teste
INSERT INTO Ramo_Atividade VALUES (1, 'Tecnologia'), (2, 'Educação');
INSERT INTO Tipo_Assinante VALUES (1, 'Residencial'), (2, 'Comercial');
INSERT INTO Municipio VALUES (1, 'Pelotas'), (2, 'Natal'), (3, 'João Câmara');
INSERT INTO Assinante VALUES (1, 'Carlos Silva', 1, 1), (2, 'Ana Costa', NULL, 2), (3, 'Empresa X', 1, 2);
INSERT INTO Endereco VALUES (10, 'Rua A', 1, 1), (20, 'Rua B', 2, 2), (30, 'Rua C', 3, 3);
INSERT INTO Telefone VALUES (101, '9999-1111', 10), (102, '9999-2222', 10), (103, '8888-3333', 20);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Ramo_Atividade;
SELECT * FROM Tipo_Assinante;
SELECT * FROM Municipio; 
SELECT * FROM Assinante; 
SELECT * FROM Endereco;
SELECT a.nm_assinante, e.ds_endereco, t.n_fone FROM Assinante a INNER JOIN Endereco e ON a.cd_assinante = e.cd_assinante INNER JOIN Telefone t ON e.cd_endereco = t.cd_endereco;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)

CREATE TABLE Ramo_Atividade (cd_ramo INT PRIMARY KEY, ds_ramo VARCHAR(50));
CREATE TABLE Tipo_Assinante (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
CREATE TABLE Municipio (cd_municipio INT PRIMARY KEY, ds_municipio VARCHAR(50));

CREATE TABLE Assinante (
    cd_assinante INT PRIMARY KEY,
    nm_assinante VARCHAR(100),
    cd_ramo INT,
    cd_tipo INT,
    FOREIGN KEY (cd_ramo) REFERENCES Ramo_Atividade(cd_ramo),
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Assinante(cd_tipo)
);

CREATE TABLE Endereco (
    cd_endereco INT PRIMARY KEY,
    ds_endereco VARCHAR(100),
    cd_assinante INT,
    cd_municipio INT,
    FOREIGN KEY (cd_assinante) REFERENCES Assinante(cd_assinante),
    FOREIGN KEY (cd_municipio) REFERENCES Municipio(cd_municipio)
);

CREATE TABLE Telefone (
    cd_fone INT PRIMARY KEY,
    n_fone VARCHAR(20),
    cd_endereco INT,
    FOREIGN KEY (cd_endereco) REFERENCES Endereco(cd_endereco)
);

-- Inserções para teste
INSERT INTO Ramo_Atividade VALUES (1, 'Tecnologia'), (2, 'Educação');
INSERT INTO Tipo_Assinante VALUES (1, 'Residencial'), (2, 'Comercial');
INSERT INTO Municipio VALUES (1, 'Pelotas'), (2, 'Natal'), (3, 'João Câmara');
INSERT INTO Assinante VALUES (1, 'Carlos Silva', 1, 1), (2, 'Ana Costa', NULL, 2), (3, 'Empresa X', 1, 2);
INSERT INTO Endereco VALUES (10, 'Rua A', 1, 1), (20, 'Rua B', 2, 2), (30, 'Rua C', 3, 3);
INSERT INTO Telefone VALUES (101, '9999-1111', 10), (102, '9999-2222', 10), (103, '8888-3333', 20);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT a.nm_assinante, r.ds_ramo FROM Assinante a LEFT JOIN Ramo_Atividade r ON a.cd_ramo = r.cd_ramo ORDER BY r.ds_ramo, a.nm_assinante;
SELECT * FROM Tipo_Assinante;
SELECT * FROM Municipio; 
SELECT * FROM Assinante; 
SELECT * FROM Endereco;
SELECT * FROM Telefone;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)

CREATE TABLE Ramo_Atividade (cd_ramo INT PRIMARY KEY, ds_ramo VARCHAR(50));
CREATE TABLE Tipo_Assinante (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
CREATE TABLE Municipio (cd_municipio INT PRIMARY KEY, ds_municipio VARCHAR(50));

CREATE TABLE Assinante (
    cd_assinante INT PRIMARY KEY,
    nm_assinante VARCHAR(100),
    cd_ramo INT,
    cd_tipo INT,
    FOREIGN KEY (cd_ramo) REFERENCES Ramo_Atividade(cd_ramo),
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Assinante(cd_tipo)
);

CREATE TABLE Endereco (
    cd_endereco INT PRIMARY KEY,
    ds_endereco VARCHAR(100),
    cd_assinante INT,
    cd_municipio INT,
    FOREIGN KEY (cd_assinante) REFERENCES Assinante(cd_assinante),
    FOREIGN KEY (cd_municipio) REFERENCES Municipio(cd_municipio)
);

CREATE TABLE Telefone (
    cd_fone INT PRIMARY KEY,
    n_fone VARCHAR(20),
    cd_endereco INT,
    FOREIGN KEY (cd_endereco) REFERENCES Endereco(cd_endereco)
);

-- Inserções para teste
INSERT INTO Ramo_Atividade VALUES (1, 'Tecnologia'), (2, 'Educação');
INSERT INTO Tipo_Assinante VALUES (1, 'Residencial'), (2, 'Comercial');
INSERT INTO Municipio VALUES (1, 'Pelotas'), (2, 'Natal'), (3, 'João Câmara');
INSERT INTO Assinante VALUES (1, 'Carlos Silva', 1, 1), (2, 'Ana Costa', NULL, 2), (3, 'Empresa X', 1, 2);
INSERT INTO Endereco VALUES (10, 'Rua A', 1, 1), (20, 'Rua B', 2, 2), (30, 'Rua C', 3, 3);
INSERT INTO Telefone VALUES (101, '9999-1111', 10), (102, '9999-2222', 10), (103, '8888-3333', 20);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Ramo_Atividade;
SELECT a.nm_assinante FROM Assinante a INNER JOIN Tipo_Assinante ta ON a.cd_tipo = ta.cd_tipo INNER JOIN Endereco e ON a.cd_assinante = e.cd_assinante INNER JOIN Municipio m ON e.cd_municipio = m.cd_municipio WHERE m.ds_municipio = 'Pelotas' AND ta.ds_tipo = 'Residencial';
SELECT * FROM Municipio; 
SELECT * FROM Assinante; 
SELECT * FROM Endereco;
SELECT * FROM Telefone;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)

CREATE TABLE Ramo_Atividade (cd_ramo INT PRIMARY KEY, ds_ramo VARCHAR(50));
CREATE TABLE Tipo_Assinante (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
CREATE TABLE Municipio (cd_municipio INT PRIMARY KEY, ds_municipio VARCHAR(50));

CREATE TABLE Assinante (
    cd_assinante INT PRIMARY KEY,
    nm_assinante VARCHAR(100),
    cd_ramo INT,
    cd_tipo INT,
    FOREIGN KEY (cd_ramo) REFERENCES Ramo_Atividade(cd_ramo),
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Assinante(cd_tipo)
);

CREATE TABLE Endereco (
    cd_endereco INT PRIMARY KEY,
    ds_endereco VARCHAR(100),
    cd_assinante INT,
    cd_municipio INT,
    FOREIGN KEY (cd_assinante) REFERENCES Assinante(cd_assinante),
    FOREIGN KEY (cd_municipio) REFERENCES Municipio(cd_municipio)
);

CREATE TABLE Telefone (
    cd_fone INT PRIMARY KEY,
    n_fone VARCHAR(20),
    cd_endereco INT,
    FOREIGN KEY (cd_endereco) REFERENCES Endereco(cd_endereco)
);

-- Inserções para teste
INSERT INTO Ramo_Atividade VALUES (1, 'Tecnologia'), (2, 'Educação');
INSERT INTO Tipo_Assinante VALUES (1, 'Residencial'), (2, 'Comercial');
INSERT INTO Municipio VALUES (1, 'Pelotas'), (2, 'Natal'), (3, 'João Câmara');
INSERT INTO Assinante VALUES (1, 'Carlos Silva', 1, 1), (2, 'Ana Costa', NULL, 2), (3, 'Empresa X', 1, 2);
INSERT INTO Endereco VALUES (10, 'Rua A', 1, 1), (20, 'Rua B', 2, 2), (30, 'Rua C', 3, 3);
INSERT INTO Telefone VALUES (101, '9999-1111', 10), (102, '9999-2222', 10), (103, '8888-3333', 20);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Ramo_Atividade;
SELECT * FROM Tipo_Assinante;
SELECT * FROM Municipio; 
SELECT nm_assinante FROM Assinante WHERE cd_assinante IN (SELECT e.cd_assinante FROM Endereco e JOIN Telefone t ON e.cd_endereco = t.cd_endereco GROUP BY e.cd_assinante HAVING COUNT(t.cd_fone) > 1);
SELECT * FROM Endereco;
SELECT * FROM Telefone;

-- Schema Base para Testes (Copie no painel Schema SQL à esquerda do DB Fiddle)

CREATE TABLE Ramo_Atividade (cd_ramo INT PRIMARY KEY, ds_ramo VARCHAR(50));
CREATE TABLE Tipo_Assinante (cd_tipo INT PRIMARY KEY, ds_tipo VARCHAR(50));
CREATE TABLE Municipio (cd_municipio INT PRIMARY KEY, ds_municipio VARCHAR(50));

CREATE VIEW vw_relatorio_comercial AS SELECT a.nm_assinante, t.n_fone FROM Assinante a INNER JOIN Tipo_Assinante ta ON a.cd_tipo = ta.cd_tipo INNER JOIN Endereco e ON a.cd_assinante = e.cd_assinante INNER JOIN Municipio m ON e.cd_municipio = m.cd_municipio INNER JOIN Telefone t ON e.cd_endereco = t.cd_endereco WHERE ta.ds_tipo = 'Comercial' AND m.ds_municipio IN ('Natal', 'João Câmara');

CREATE TABLE Assinante (
    cd_assinante INT PRIMARY KEY,
    nm_assinante VARCHAR(100),
    cd_ramo INT,
    cd_tipo INT,
    FOREIGN KEY (cd_ramo) REFERENCES Ramo_Atividade(cd_ramo),
    FOREIGN KEY (cd_tipo) REFERENCES Tipo_Assinante(cd_tipo)
);

CREATE TABLE Endereco (
    cd_endereco INT PRIMARY KEY,
    ds_endereco VARCHAR(100),
    cd_assinante INT,
    cd_municipio INT,
    FOREIGN KEY (cd_assinante) REFERENCES Assinante(cd_assinante),
    FOREIGN KEY (cd_municipio) REFERENCES Municipio(cd_municipio)
);

CREATE TABLE Telefone (
    cd_fone INT PRIMARY KEY,
    n_fone VARCHAR(20),
    cd_endereco INT,
    FOREIGN KEY (cd_endereco) REFERENCES Endereco(cd_endereco)
);

-- Inserções para teste
INSERT INTO Ramo_Atividade VALUES (1, 'Tecnologia'), (2, 'Educação');
INSERT INTO Tipo_Assinante VALUES (1, 'Residencial'), (2, 'Comercial');
INSERT INTO Municipio VALUES (1, 'Pelotas'), (2, 'Natal'), (3, 'João Câmara');
INSERT INTO Assinante VALUES (1, 'Carlos Silva', 1, 1), (2, 'Ana Costa', NULL, 2), (3, 'Empresa X', 1, 2);
INSERT INTO Endereco VALUES (10, 'Rua A', 1, 1), (20, 'Rua B', 2, 2), (30, 'Rua C', 3, 3);
INSERT INTO Telefone VALUES (101, '9999-1111', 10), (102, '9999-2222', 10), (103, '8888-3333', 20);

-- Consultas das tabelas do banco (copiar no painel à direita Query SQL no DB Fiddle)
SELECT * FROM Ramo_Atividade;
SELECT * FROM Tipo_Assinante;
SELECT * FROM Municipio; 
SELECT * FROM Assinante; 
SELECT * FROM Endereco;
SELECT * FROM Telefone;
