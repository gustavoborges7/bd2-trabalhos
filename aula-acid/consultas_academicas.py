import mysql.connector

def executar_consulta(titulo, sql, valores=None):
    print(f"\n--- {titulo} ---")
    try:
        conexao = mysql.connector.connect(
            host="127.0.0.1", user="root", password="root123", database="aula1"
        )
        cursor = conexao.cursor()
        cursor.execute(sql, valores) if valores else cursor.execute(sql)
        
        resultados = cursor.fetchall()
        for linha in resultados:
            print(linha)
        
        if not resultados:
            print("Nenhum registro encontrado.")
            
    except Exception as e:
        print(f"Erro: {e}")
    finally:
        if 'conexao' in locals(): conexao.close()

# 1. Listar todos os alunos
executar_consulta("LISTA DE ALUNOS", "SELECT * FROM ALUNOS")

# 2. Listar todas as disciplinas (No seu banco aula1 é a tabela CURSOS)
executar_consulta("LISTA DE CURSOS/DISCIPLINAS", "SELECT * FROM CURSOS")

# 3. Listar as matrículas de um semestre específico
semestre = "2026.1"
executar_consulta(f"MATRÍCULAS DO SEMESTRE {semestre}", 
                 "SELECT * FROM MATRICULAS WHERE semestre = %s", (semestre,))

# 4. Consultar matrículas de um aluno específico (Ex: Aluno ID 1)
id_aluno = 1
executar_consulta(f"MATRÍCULAS DO ALUNO {id_aluno}", 
                 "SELECT * FROM MATRICULAS WHERE id_aluno = %s", (id_aluno,))
