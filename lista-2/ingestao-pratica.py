import pandas as pd
from sqlalchemy import create_engine

engine = create_engine("mysql+pymysql://root:root123@127.0.0.1:3306/aula1")

# 1. Criando os Cursos (3 cursos)
cursos_data = pd.DataFrame({
    'id_curso': [1, 2, 3],
    'nome_curso': ['Ciência da Computação', 'Sistemas para Internet', 'Engenharia de Software'],
    'sigla': ['CC', 'SI', 'ES']
})

# 2. Criando os Alunos (10 alunos, misturando M e F)
alunos_data = pd.DataFrame({
    'id_aluno': range(1, 11),
    'nome': ['Ana Silva', 'Bruno Costa', 'Carla Souza', 'Diego Lima', 'Elena Paz', 
             'Fabio Junior', 'Gisele Bündchen', 'Hugo Leonardo', 'Iara Martins', 'João Pedro'],
    'sexo': ['F', 'M', 'F', 'M', 'F', 'M', 'F', 'M', 'F', 'M']
})

# 3. Criando as Matrículas (20 registros no total)
matriculas_data = pd.DataFrame({
    'id_aluno': [1,1,2,2,3,3,4,4,5,5,6,6,7,7,8,8,9,9,10,10],
    'id_curso': [1,1,1,1,2,2,2,2,1,1,3,3,3,3,2,2,1,1,3,3],
    'semestre': ['2026.1'] * 20,
    'disciplina': ['Calculo I', 'BD2', 'Calculo I', 'BD2', 'Design', 'BD2', 
                   'Design', 'BD2', 'Calculo I', 'Algoritmos', 'Fisica', 'BD2',
                   'Fisica', 'BD2', 'Redes', 'BD2', 'Algoritmos', 'BD2', 'Fisica', 'BD2']
})

# Enviando para o MySQL
cursos_data.to_sql('CURSOS', engine, if_exists='replace', index=False)
alunos_data.to_sql('ALUNOS', engine, if_exists='replace', index=False)
matriculas_data.to_sql('MATRICULAS', engine, if_exists='replace', index=False)

print("✅ Tabelas da prática (Alunos, Cursos, Matriculas) criadas e populadas!")
