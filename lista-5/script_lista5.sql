CREATE TABLE alunos (
    matr INT PRIMARY KEY,
    nome VARCHAR(100),
    cr DECIMAL(4,2),
    campus VARCHAR(50)
);

INSERT INTO alunos (matr, nome, cr, campus) VALUES
(1, 'Gustavo Borges', 9.5, 'Goianesia'),
(2, 'Isa', 9.8, 'Goianesia'),
(3, 'Carlos Silva', 7.5, 'Anapolis'),
(4, 'Ana Oliveira', 8.2, 'Anapolis');

CREATE TABLE alunos_goianesia AS 
SELECT * FROM alunos WHERE campus = 'Goianesia';

CREATE TABLE alunos_anapolis AS 
SELECT * FROM alunos WHERE campus = 'Anapolis';

CREATE VIEW alunos_global AS
SELECT * FROM alunos_goianesia
UNION ALL
SELECT * FROM alunos_anapolis;
