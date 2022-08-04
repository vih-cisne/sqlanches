-- Aqui você deve colocar os códigos SQL referentes às
-- Simulações de um CRUD

-- Criação

-- 1)

INSERT INTO clientes
	(nome, lealdade)
VALUES
	('Georgia', 0);

-- 2)

INSERT INTO pedidos
	(status, cliente_id)
VALUES
	('Recebido', 6);


-- 3)

INSERT INTO produtos_pedidos
	(produto_id, pedido_id)
VALUES
	(1, 6),
    (2, 6),
    (6, 6),
    (8, 6),
    (8, 6)
RETURNING
	*; 



-- Leitura

-- 1)

SELECT 
	cl.id, cl.nome, cl.lealdade, pe.id, pe.status, pe.cliente_id, pr.id, pr.nome, pr.tipo, pr.preco, pr.pts_lealdade
FROM
    clientes cl    
JOIN pedidos pe
ON pe.cliente_id = cl.id    
LEFT JOIN produtos_pedidos pr_pe
ON pe.id = pr_pe.pedido_id    
JOIN produtos pr
ON pr.id = pr_pe.produto_id
WHERE cl.id = 6; 



-- Atualização

-- 1)

UPDATE 
	clientes
SET 
	lealdade = soma_lealdade.total
FROM(SELECT 
	SUM(pts_lealdade) AS total
FROM
    clientes cl
JOIN pedidos pe
ON pe.cliente_id = cl.id    
JOIN produtos_pedidos pr_pe
ON pe.id = pr_pe.pedido_id    
JOIN produtos pr
ON pr.id = pr_pe.produto_id
WHERE cl.id = 6) AS soma_lealdade;


-- Deleção

-- 1)
DELETE FROM clientes
	WHERE nome = 'Marcelo'
RETURNING * ;




      


    

    

 


 


