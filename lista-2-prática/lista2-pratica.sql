-- ========================================================
-- LISTA 2 - PRÁTICA: BANCO + CONSULTAS EM SQL E ÁLGEBRA
-- Aluno: Gustavo Borges Sousa
-- ========================================================

-- 1. Nomes dos alunos do curso CC.
-- Tive que fazer dois JOINs pq a sigla ta na tabela de cursos e o nome na de alunos.
SELECT a.nome 
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
JOIN CURSOS c ON m.id_curso = c.id_curso
WHERE c.sigla = 'CC';

-- 2. Nomes das alunas do curso CC.
-- Igual a de cima, mas coloquei o filtro AND para pegar so as meninas (F).
SELECT DISTINCT a.nome 
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
JOIN CURSOS c ON m.id_curso = c.id_curso
WHERE c.sigla = 'CC' AND a.sexo = 'F';

-- 3. (Nome do aluno, Nome do curso).
-- Projecao simples de duas colunas depois de juntar as tabelas. 
-- Nao usei WHERE pq ele quer todos.
SELECT a.nome AS Nome_do_Aluno, c.nome_curso AS Nome_do_Curso
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
JOIN CURSOS c ON m.id_curso = c.id_curso;

-- 4. Alunos matriculados no semestre 2026.1.
-- O professor pediu semestre 2026.1, coloquei DISTINCT pq senao o 
-- nome do aluno repete pra cada materia que ele faz no semestre kkkk
SELECT DISTINCT a.nome 
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
WHERE m.semestre = '2026.1';

-- 5. (Nome do aluno, Disc) das matrículas em 2026.1.
SELECT a.nome, m.disciplina
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
WHERE m.semestre = '2026.1';

-- ========================================================
-- CONSULTAS COM COMPOSIÇÃO EXPLÍCITA (Exigência do Slide 49)
-- ========================================================

-- Composição 1: π_{nome}(σ_{disciplina='BD2'}(ALUNOS ⨝ MATRICULAS))
-- Leitura informal: Junta alunos e matrículas, filtra quem tá pagando BD2, e mostra só o nome.
SELECT a.nome 
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
WHERE m.disciplina = 'BD2';

-- Composição 2: π_{nome}(σ_{sexo='F' ∧ sigla='SI'}(ALUNOS ⨝ MATRICULAS ⨝ CURSOS))
-- Leitura informal: Junta as três tabelas, filtra as mulheres do curso de Sistemas para Internet, e exibe o nome.
SELECT a.nome
FROM ALUNOS a
JOIN MATRICULAS m ON a.id_aluno = m.id_aluno
JOIN CURSOS c ON m.id_curso = c.id_curso
WHERE a.sexo = 'F' AND c.sigla = 'SI';
