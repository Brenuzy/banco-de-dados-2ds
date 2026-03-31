CREATE TABLE PRODUTO 
( 
 Cod_produto INT PRIMARY KEY,  
 Qtd_produto INT,  
 valor_produto INT,  
 idfarmacia INT  
); 

CREATE TABLE farmacia 
( 
 nome_farmacia INT,  
 end_farmacia INT,  
 CNPJ_farmacia INT PRIMARY KEY,  
 tef_farmacia INT  
); 

CREATE TABLE farmaceutico 
( 
 RG_farmaceutico INT PRIMARY KEY,  
 nome_farmaceutico INT,  
 idfarmacia INT  
); 

ALTER TABLE PRODUTO ADD FOREIGN KEY(idfarmacia) REFERENCES farmacia (idfarmacia)
ALTER TABLE farmaceutico ADD FOREIGN KEY(idfarmacia) REFERENCES farmacia (idfarmacia);
