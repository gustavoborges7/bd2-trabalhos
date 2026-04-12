-- ========================================================
-- LISTA 2 - ALGEBRA RELACIONAL NA PRATICA COM SQL
-- Aluno: Gustavo Borges Sousa
-- ========================================================

-- 1. PROJEÇÃO (Pi): Mostrar apenas o nome e o id dos produtos
-- Eu tinha colocado SELECT * antes, mas o professor explicou que a projeção 
-- pede só as colunas especificas que a gente quer ver.
SELECT product_id, product_name 
FROM products;

-- 2. SELEÇÃO (Sigma): Pegar os produtos do departamento 3 (bakery)
-- Tentei colocar aspas simples no '3' (WHERE department_id = '3') mas vi que 
-- como é numero inteiro nao precisa.
SELECT * FROM products 
WHERE department_id = 3;

-- 3. PRODUTO CARTESIANO (X): Misturar tudo de departamentos com corredores (aisles)
-- CUIDADO: Isso multiplica as linhas! São 6 deptos x 6 corredores = deu 36 linhas.
-- Quase travou a aba aqui achando que tava errado kkkk
SELECT * FROM departments 
CROSS JOIN aisles;

-- 4. JUNÇÃO (Bowtie): Produtos e seus nomes de departamentos
-- Antes eu tava juntando usando o WHERE (WHERE p.department_id = d.department_id), 
-- mas com INNER JOIN fica melhor de ler e não confunde com os filtros.
SELECT p.product_name, d.department 
FROM products p
JOIN departments d ON p.department_id = d.department_id;

-- 5. UNIÃO (U): Juntar os produtos do corredor 1 com os produtos do corredor 4
-- esqueci o ponto e virgula no final da primeira vez e deu erro de sintaxe
SELECT product_name, aisle_id FROM products WHERE aisle_id = 1
UNION
SELECT product_name, aisle_id FROM products WHERE aisle_id = 4;

-- 6. DIFERENÇA (-): Departamentos que NAO tem nenhum produto cadastrado
-- Tentei usar o comando MINUS igual tem no livro da aula, mas o MySQL nao reconhece.
-- Pesquisei e descobri que dá pra fazer a mesma coisa usando o NOT IN.
SELECT department_id, department 
FROM departments 
WHERE department_id NOT IN (SELECT department_id FROM products);

-- 7. INTERSEÇÃO: Produtos que sao do depto de bebidas E estao no corredor de sucos
-- Outro BO: O MySQL 5.7 do Docker nao tem o comando INTERSECT direto.
-- O jeito foi fazer um INNER JOIN de duas consultas pra simular a interseção na marra.
SELECT p1.product_name 
FROM products p1
INNER JOIN (SELECT product_id FROM products WHERE aisle_id = 6) p2 
ON p1.product_id = p2.product_id
WHERE p1.department_id = 6;
