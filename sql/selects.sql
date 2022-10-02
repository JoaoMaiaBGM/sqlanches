--SELECIONANDO OS DADOS
--1)Consulte por todos os pedidos juntamente com todas as informações dos produtos que estão em cada um dos pedidos.
SELECT
	p.id,
	p.status,
	p.cliente_id,
	p2.id, 
	p2.nome,
	p2.tipo,
	ROUND(CAST(p2.preço AS NUMERIC), 2) AS preço,
	p2.pts_de_lealdade 
FROM 
	produtos_pedidos pp 
JOIN 
	pedidos p ON p.id = pp.pedido_id 
JOIN
	produtos p2 ON p2.id = pp.produto_id;
 
--2)Consulte pelo ID de todos os pedidos que incluam 'Fritas'.
SELECT
	p.id
FROM 
	produtos_pedidos pp
JOIN 
	pedidos p ON p.id = pp.pedido_id 
JOIN 
	produtos p2 ON p2.id = pp.produto_id
WHERE 
	pp.produto_id = 6;
 
/*3)Consulte novamente por pedidos que incluam 'Fritas', porém agora, retorne apenas uma coluna (gostam_de_fritas) 
  	com o nome dos Clientes que fizeram os pedidos.*/
SELECT 
	c.nome AS gostam_de_fritas
FROM 
	produtos_pedidos pp  
JOIN
	pedidos p ON p.id = pp.pedido_id 
JOIN 
	clientes c ON c.id = p.cliente_id
JOIN 
	produtos p2 ON p2.id = pp.produto_id 
WHERE 
	pp.produto_id = 6;

--4)Crie uma query que retorne o custo total dos pedidos da 'Laura'.
SELECT 
	SUM(ROUND(CAST(p2.preço AS NUMERIC), 2))
FROM 
	produtos_pedidos pp 
JOIN
	pedidos p ON p.id = pp.pedido_id 
JOIN 
	produtos p2 ON p2.id = pp.produto_id 
WHERE 
	pp.pedido_id = 5;

--5)Crie uma query que retorne em uma coluna o nome do produto, e na outra, o número de vezes que ele foi pedido.
SELECT 
	p2.nome,
	count(pedido_id)
FROM
	pedidos p 
JOIN 
	produtos_pedidos pp ON p.id = pp.pedido_id 
JOIN 
	produtos p2 ON pp.produto_id = p2.id GROUP BY (nome) ORDER BY (nome);