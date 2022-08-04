-- Aqui você deve colocar os códigos SQL referentes às
-- Seleções de dados

-- 1)

SELECT 
	pe.id, pe.status, pe.cliente_id, pr.id, pr.nome, pr.tipo, pr.preco, pr.pts_lealdade
FROM
    pedidos pe
JOIN produtos_pedidos pr_pe
ON pe.id = pr_pe.pedido_id    
JOIN produtos pr
ON pr.id = pr_pe.produto_id;

-- 2)

SELECT 
	pe.id
FROM
    pedidos pe
JOIN produtos_pedidos pr_pe
ON pe.id = pr_pe.pedido_id    
JOIN produtos pr
ON pr.id = pr_pe.produto_id
WHERE pr.nome ILIKE '%fritas%';

-- 3)

SELECT 
	cl.nome AS gostam_fritas
FROM
    pedidos pe
JOIN produtos_pedidos pr_pe
ON pe.id = pr_pe.pedido_id    
JOIN produtos pr
ON pr.id = pr_pe.produto_id
JOIN clientes cl
ON pe.cliente_id = cl.id
WHERE pr.nome ILIKE '%fritas%';

-- 4)

SELECT 
	SUM(preco)
FROM
    pedidos pe
JOIN produtos_pedidos pr_pe
ON pe.id = pr_pe.pedido_id    
JOIN produtos pr
ON pr.id = pr_pe.produto_id
JOIN clientes cl
ON pe.cliente_id = cl.id
WHERE cl.nome = 'Laura';

-- 5)

SELECT 
	pr.nome, COUNT(pr.id)
FROM
    produtos pr    
JOIN produtos_pedidos pr_pe
ON pr.id = pr_pe.produto_id    
JOIN pedidos pe
ON pe.id = pr_pe.pedido_id
GROUP BY 
	pr.id
ORDER BY
	count DESC;

