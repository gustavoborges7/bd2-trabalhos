import mysql.connector

print("Conectando ao MySQL...")
conexao = mysql.connector.connect(host="127.0.0.1", user="root", password="root123")
cursor = conexao.cursor()

print("Criando banco e tabelas do zero...")
cursor.execute("CREATE DATABASE IF NOT EXISTS aula1;")
cursor.execute("USE aula1;")

cursor.execute("""
CREATE TABLE IF NOT EXISTS ALUNOS (
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100) NOT NULL
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS CURSOS (
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100) NOT NULL,
    vagas INT NOT NULL
)
""")

cursor.execute("""
CREATE TABLE IF NOT EXISTS MATRICULAS (
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT, id_curso INT, semestre VARCHAR(10), disciplina VARCHAR(100)
)
""")

print("Inserindo você e a vaga teste...")
cursor.execute("INSERT INTO ALUNOS (nome) VALUES ('Gustavo Borges'), ('Aluno Concorrente')")
cursor.execute("INSERT INTO CURSOS (nome_curso, vagas) VALUES ('Banco de Dados II', 1)")

conexao.commit()
print("✅ Tudo pronto! Pode testar a concorrência agora.")
