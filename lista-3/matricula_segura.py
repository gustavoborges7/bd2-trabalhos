import mysql.connector

try:
    # 1. Conexão com o banco aula1
    conexao = mysql.connector.connect(
        host="127.0.0.1",
        user="root",
        password="root123",
        database="aula1"
    )
    cursor = conexao.cursor()

    # 2. Início da Transação (START TRANSACTION)
    conexao.start_transaction()

    # Dados para o teste
    id_aluno_teste = 999
    id_curso_teste = 1
    disciplina_teste = "Sistemas Operacionais"
    semestre_teste = "2026.1"

    print(f"--- Iniciando matrícula do aluno {id_aluno_teste} ---")

    # Passo 1: Verificar se o aluno existe
    cursor.execute("SELECT COUNT(*) FROM ALUNOS WHERE id_aluno = %s", (id_aluno_teste,))
    if cursor.fetchone()[0] == 0:
        raise Exception("ERRO: Aluno não cadastrado.")

    # Passo 2: Verificar se o curso existe
    cursor.execute("SELECT COUNT(*) FROM CURSOS WHERE id_curso = %s", (id_curso_teste,))
    if cursor.fetchone()[0] == 0:
        raise Exception("ERRO: Curso não cadastrado.")

    # Passo 3: Inserir a matrícula
    sql = "INSERT INTO MATRICULAS (id_aluno, id_curso, semestre, disciplina) VALUES (%s, %s, %s, %s)"
    cursor.execute(sql, (id_aluno_teste, id_curso_teste, semestre_teste, disciplina_teste))

    # Passo 4: Confirmar com COMMIT
    conexao.commit()
    print("✅ Transação confirmada: Matrícula realizada com sucesso!")

except Exception as e:
    # Se ocorrer erro em QUALQUER etapa, executa o ROLLBACK
    if 'conexao' in locals() and conexao.is_connected():
        conexao.rollback()
        print(f"❌ Falha detectada: {e}")
        print("--- ROLLBACK executado: Nenhuma alteração foi feita no banco. ---")

finally:
    if 'cursor' in locals(): 
        cursor.close()
    if 'conexao' in locals() and conexao.is_connected(): 
        conexao.close()
