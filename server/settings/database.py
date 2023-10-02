from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker, declarative_base

db_user = "user"
db_passwd = "password"
db_host = "localhost"
db_name = "todo_app"
DB_URL = 'mysql+pymysql://user:password@db/database?charset=utf8mb4'


engine = create_engine(DB_URL, echo=True)
SessionLocal = sessionmaker(
    autocommit=False, autoflush=False, bind=engine
)

Base = declarative_base()

def get_db():
    db = SessionLocal()
    try:
        yield db
    finally:
        db.close()