--SIMULAÇÕES DE UM CRUD

--CRIAÇÃO
--criando um pedido para o produto Big Serial, como modelo
INSERT INTO
	produtos_pedidos (pedido_id, produto_id)
VALUES 
	((SELECT id FROM pedidos p WHERE p.cliente_id = (
    SELECT id 
    FROM clientes c 
    WHERE c.nome = 'Georgia'
  )), 
  (
    SELECT id 
    FROM produtos p2 
    WHERE p2.nome = 'Big Serial'
  ));

--criando os demais pedidos
INSERT INTO 
	produtos_pedidos (pedido_id, produto_id)
VALUES 
	((SELECT id FROM pedidos p WHERE p.cliente_id = (
    SELECT id 
    FROM clientes c 
    WHERE c.nome = 'Georgia'
    )), 
    (
    SELECT id FROM produtos p2 WHERE p2.nome = 'Varchapa'
    )),
	((SELECT id FROM pedidos p WHERE p.cliente_id = (
    SELECT id 
    FROM clientes c 
    WHERE c.nome = 'Georgia'
    )), 
    (
      SELECT id 
      FROM produtos p2 
      WHERE p2.nome = 'Fritas')),

	((SELECT id FROM pedidos p WHERE p.cliente_id = (
    SELECT id 
    FROM clientes c 
    WHERE c.nome = 'Georgia'
    )), 
    (
      SELECT id 
      FROM produtos p2 
      WHERE p2.nome = 'Coca-Cola'
      )),
	((SELECT id FROM pedidos p WHERE p.cliente_id = (
    SELECT id 
    FROM clientes c 
    WHERE c.nome = 'Georgia'
    )), 
    (
      SELECT id 
      FROM produtos p2 
      WHERE p2.nome = 'Coca-Cola'
      ));

--LEITURA
--2)Selecione os dados da tabela clientes, juntamente com os pedidos e os produtos dos pedidos da cliente Georgia.
SELECT 
	c.id,
	c.nome,
	c.lealdade,
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
	clientes c ON c.id = p.cliente_id 
JOIN 
	produtos p2 ON p2.id = pp.produto_id 
WHERE 
	pp.pedido_id = (
		SELECT c.id
		FROM clientes c
		WHERE c.nome = 'Georgia'
	);