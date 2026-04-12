-- 1. Consulta com GROUP BY, ORDER BY e LIMIT
-- Objetivo: Descobrir os 3 departamentos com a maior quantidade de produtos cadastrados.
SELECT department_id, COUNT(product_id) as total_produtos
FROM products
GROUP BY department_id
ORDER BY total_produtos DESC
LIMIT 3;

-- 2. Consulta com GROUP BY e HAVING
-- Objetivo: Mostrar apenas os corredores (aisles) que possuem mais de 2 produtos na nossa base.
SELECT aisle_id, COUNT(product_id) as total_produtos
FROM products
GROUP BY aisle_id
HAVING COUNT(product_id) > 2;

-- 3. Consulta com 1 JOIN
-- Objetivo: Listar o nome dos produtos de forma clara, junto com o nome do seu departamento.
SELECT p.product_name, d.department
FROM products p
JOIN departments d ON p.department_id = d.department_id;

-- 4. Consulta com 2 JOINs (3 tabelas)
-- Objetivo: Exibir o cadastro completo do produto, contendo seu nome, o corredor onde fica e o departamento.
SELECT p.product_name, a.aisle, d.department
FROM products p
JOIN aisles a ON p.aisle_id = a.aisle_id
JOIN departments d ON p.department_id = d.department_id;

-- 5. Consulta com JOIN e WHERE
-- Objetivo: Listar apenas os produtos que pertencem ao departamento de bebidas ('beverages').
SELECT p.product_name, d.department
FROM products p
JOIN departments d ON p.department_id = d.department_id
WHERE d.department = 'beverages';

-- 6. Consulta unindo JOIN e GROUP BY
-- Objetivo: Apresentar a contagem total de produtos usando o nome do departamento, ordenado do maior para o menor.
SELECT d.department, COUNT(p.product_id) as qtd_produtos
FROM departments d
JOIN products p ON d.department_id = p.department_id
GROUP BY d.department
ORDER BY qtd_produtos DESC;
