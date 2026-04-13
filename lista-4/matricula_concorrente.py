import mysql.connector

def realizar_matricula(id_aluno, id_curso):
    try:
        conexao = mysql.connector.connect(
            host="127.0.0.1", user="root", password="root123", database="aula1"
        )
        cursor = conexao.cursor()
        
        # Inicia a transação
        conexao.start_transaction()
        print(f"\n[Transação Iniciada] Aluno: {id_aluno}")

        # 1. Tenta ler as vagas TRAVANDO a linha (FOR UPDATE)
        print("Consultando vagas e bloqueando a linha...")
        sql_vagas = "SELECT vagas, nome_curso FROM CURSOS WHERE id_curso = %s FOR UPDATE"
        cursor.execute(sql_vagas, (id_curso,))
        resultado = cursor.fetchone()

        if resultado:
            vagas, nome = resultado
            print(f"Curso: {nome} | Vagas disponíveis: {vagas}")

            if vagas > 0:
                # Simulação de espera para testar concorrência
                print("\n>>> BLOQUEIO ATIVO! <<<")
                input("Pressione ENTER para confirmar a matrícula e liberar o banco...")

                # 2. Insere a matrícula
                sql_insere = "INSERT INTO MATRICULAS (id_aluno, id_curso, semestre, disciplina) VALUES (%s, %s, %s, %s)"
                cursor.execute(sql_insere, (id_aluno, id_curso, "2026.1", nome))

                # 3. Decrementa a vaga
                sql_update = "UPDATE CURSOS SET vagas = vagas - 1 WHERE id_curso = %s"
                cursor.execute(sql_update, (id_curso,))

                conexao.commit()
                print(f"✅ Sucesso! Matrícula do aluno {id_aluno} realizada.")
            else:
                print("❌ Falha: Não há mais vagas.")
                conexao.rollback()
        else:
            print("❌ Curso não encontrado.")

    except Exception as e:
        if 'conexao' in locals(): conexao.rollback()
        print(f"⚠️ Erro: {e}")
    finally:
        if 'conexao' in locals() and conexao.is_connected():
            cursor.close()
            conexao.close()

# Execução
id_aluno_input = int(input("Digite o ID do Aluno para este teste: "))
realizar_matricula(id_aluno_input, 1)
