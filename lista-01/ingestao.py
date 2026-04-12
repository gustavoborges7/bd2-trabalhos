import pandas as pd
from sqlalchemy import create_engine

# Configuração igual ao seu docker-compose
DB_USER = "root"
DB_PASS = "root123"
DB_HOST = "127.0.0.1"
DB_PORT = "3306"
DB_NAME = "aula1"

engine = create_engine(f"mysql+pymysql://{DB_USER}:{DB_PASS}@{DB_HOST}:{DB_PORT}/{DB_NAME}")

print("Gerando dados baseados no dataset Instacart (Kaggle)...")

# Criando as tabelas em memória
departments = pd.DataFrame({
    'department_id': [1, 2, 3, 4, 5, 6],
    'department': ['frozen', 'other', 'bakery', 'produce', 'alcohol', 'beverages']
})

aisles = pd.DataFrame({
    'aisle_id': [1, 2, 3, 4, 5, 6],
    'aisle': ['prepared soups salads', 'specialty cheeses', 'energy granola bars', 'instant foods', 'marinades meat preparation', 'juice nectars']
})

products = pd.DataFrame({
    'product_id': [1, 2, 3, 4, 5, 6, 7, 8, 9, 10],
    'product_name': ['Chocolate Cookies', 'All-Seasons Salt', 'Oolong Tea', 'Mini Rigatoni', 'Green Chile Sauce', 'Dry Nose Oil', 'Coconut Water', 'Russet Potatoes', 'Strawberry Yogurt', 'Orange Juice'],
    'aisle_id': [3, 5, 6, 1, 5, 6, 6, 4, 3, 6],
    'department_id': [3, 2, 6, 1, 2, 2, 6, 4, 3, 6]
})

# Injetando no MySQL
departments.to_sql("departments", engine, if_exists="replace", index=False)
aisles.to_sql("aisles", engine, if_exists="replace", index=False)
products.to_sql("products", engine, if_exists="replace", index=False)

print("✅ Sucesso! Tabelas criadas no banco de dados.")
