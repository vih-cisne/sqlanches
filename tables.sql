-- Aqui você deve colocar os códigos SQL referentes à

-- Criação das tabelas

-- Tabela clientes

CREATE TABLE IF NOT EXISTS cliente(
  	id BIGSERIAL PRIMARY KEY,
	nome VARCHAR(50) NOT NULL,
  	lealdade INTEGER NOT NULL
);

ALTER TABLE
	cliente
RENAME TO clientes;

-- Tabela endereços

CREATE TABLE IF NOT EXISTS enderecos(
  	id BIGSERIAL PRIMARY KEY,
	cep VARCHAR(9) NOT NULL,
	rua VARCHAR(50) NOT NULL,
	numero INTEGER NOT NULL,
	bairro VARCHAR(50) NOT NULL,
	complemento VARCHAR(100),
	cliente_id INTEGER UNIQUE NOT NULL,
  	CONSTRAINT fk_cliente FOREIGN KEY (cliente_id) REFERENCES clientes(id)
);    

ALTER TABLE enderecos
DROP CONSTRAINT fk_cliente,
ADD CONSTRAINT fk_cliente
   FOREIGN KEY (cliente_id)
   REFERENCES clientes(id)
   ON DELETE CASCADE;


-- Tabela pedidos

CREATE TABLE IF NOT EXISTS pedidos(
  	id BIGSERIAL PRIMARY KEY,
	status VARCHAR(50) NOT NULL
);

ALTER TABLE 
	pedidos
ADD COLUMN cliente_id INTEGER NOT NULL;

ALTER TABLE 
	pedidos
ADD CONSTRAINT fk_cliente
	FOREIGN KEY (cliente_id)
    	REFERENCES clientes(id);

ALTER TABLE pedidos
DROP CONSTRAINT fk_cliente,
ADD CONSTRAINT fk_cliente
   FOREIGN KEY (cliente_id)
   REFERENCES clientes(id)
   ON DELETE CASCADE;        

-- Tabela produtos

CREATE TABLE IF NOT EXISTS produtos(
	nome VARCHAR(100) UNIQUE NOT NULL,
  	tipo VARCHAR(30) NOT NULL,
  	preco FLOAT(8) NOT NULL,
  	pts_lealdade INTEGER NOT NULL
);

ALTER TABLE 
	produtos
ADD COLUMN 
	id BIGSERIAL PRIMARY KEY;

-- Tabela produtos_pedidos      

CREATE TABLE IF NOT EXISTS produtos_pedidos(
  	id BIGSERIAL PRIMARY KEY,
	produto_id INTEGER NOT NULL,
  	pedido_id INTEGER NOT NULL,
  	CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produtos(id) ON DELETE CASCADE,
  	CONSTRAINT fk_pedido FOREIGN KEY (pedido_id) REFERENCES pedidos(id) ON DELETE CASCADE
);    
 
   

INSERT INTO clientes
          (nome, lealdade)
        VALUES
          ('Paula', 64),
          ('Francisco', 168),
          ('Elise', 24),
          ('Marcelo', 48),
          ('Laura', 36);
          
INSERT INTO enderecos
          (cep, rua, numero, bairro, complemento, cliente_id)
        VALUES
          ('09092-909', 'Rua 1', 121, 'Bairro 1', 'apto. 302', 1),
          ('12345-995', 'Rua 2', 254, 'Bairro 2', null, 2),
          ('54625-845', 'Rua 3', 1050, 'Bairro 3', null, 3),
          ('65655-321', 'Rua 4', 79, 'Bairro 4', 'APTO. 505', 4),
          ('15484-565', 'Rua 5', 32, 'Bairro 5', null, 5);    
          
INSERT INTO produtos
          (nome, tipo, preco, pts_lealdade)
        VALUES
          ('Big Serial', 'Burguer', 24.99, 12),
          ('Varchapa', 'Burguer', 32.99, 16),
          ('Update sem WHERE', 'Burguer', 42.99, 20), 
          ('Um pra Dois', 'Burguer', 49.99, 24),
          ('DELETE sem WHERE', 'Burguer', 54.99, 32), 
          ('Fritas', 'Acompanhamento', 14.99, 8), 
          ('Cebola', 'Acompanhamento', 19.99, 12),
          ('Coca-Cola', 'Bebida', 5.99, 6), 
          ('Fanta', 'Bebida', 5.99, 6), 
          ('Guaraná', 'Bebida', 5.99, 6); 
          
INSERT INTO pedidos 
            (status, cliente_id)
        VALUES
          ('Em preparo', 1),
          ('Finalizado', 2),
          ('Recebido', 3),
          ('Entregue', 4),
          ('Recebido', 5);  
          
INSERT INTO produtos_pedidos
          (pedido_id, produto_id)
        VALUES
          (1, 4),
          (1, 2),
          (1, 6),
          (2, 2),
          (2, 4),
          (2, 7),
          (2, 9),
          (3, 5),
          (3, 6),
          (3, 9),
          (4, 1),
          (4, 1),
          (4, 6),
          (4, 10),
          (5, 3),
          (5, 2),
          (5, 7),
          (5, 8);          


