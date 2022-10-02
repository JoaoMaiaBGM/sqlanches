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