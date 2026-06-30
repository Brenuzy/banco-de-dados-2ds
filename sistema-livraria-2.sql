SELECT 
    Clientes.nome AS Nome_Cliente, 
    Livros.titulo AS Nome_Livro
FROM 
    Compras
INNER JOIN 
    Clientes ON Compras.id_cliente = Clientes.id
INNER JOIN 
    Livros ON Compras.id_livro = Livros.id;
