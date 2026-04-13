import mysql.connector

try:
    conexao = mysql.connector.connect(
        host="127.0.0.1", user="root", password="root123", database="aula1"
    )
    cursor = conexao.cursor()
    conexao.start_transaction()

    id_aluno_alvo = 1
    disciplina_alvo = "Sistemas Operacionais"

    print(f"--- Iniciando cancelamento do aluno {id_aluno_alvo} ---")

    sql = "DELETE FROM MATRICULAS WHERE id_aluno = %s AND disciplina = %s"
    cursor.execute(sql, (id_aluno_alvo, disciplina_alvo))

    if cursor.rowcount == 0:
        raise Exception("Matricula nao encontrada para cancelamento.")

    conexao.commit()
    print("✅ Cancelamento realizado com sucesso!")

except Exception as e:
    if 'conexao' in locals(): conexao.rollback()
    print(f"❌ Falha no cancelamento: {e}")

finally:
    if 'conexao' in locals(): conexao.close()
