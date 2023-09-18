from fastapi import FastAPI
from app.handlers import todo, done

app = FastAPI()

app.include_router(todo.router)
app.include_router(done.router)