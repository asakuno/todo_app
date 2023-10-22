#handlers/task.py
from fastapi import APIRouter, Request, Depends
from typing import List, Annotated, Optional, Any
from server.models.task import TaskModel
from server.libraries.repositories.task_repository import TaskRepository
from pydantic import BaseModel
from server.settings.database import SessionLocal
import logging

router = APIRouter()
class TodoItemRequest(BaseModel):
    title: str
    done: bool

class Response(BaseModel):
    data: Any
    
    class Config:
        from_attributes=True

@router.get("/")
def todos():
    return {"message": "hello!"}

#index
@router.get("/tasks")
def get_tasks(
    task_repo: Annotated[TaskRepository, Depends(TaskRepository)]
):
    with SessionLocal.begin() as db:
        tasks = task_repo.get_tasks_all(db)
        
        return Response(data=tasks)

#create
@router.post("/tasks")
def create_tasks(
    todo_item: TodoItemRequest,
    task_repo: Annotated[TaskRepository, Depends(TaskRepository)],
):
    with SessionLocal.begin() as db:
        task = task_repo.create_task(
            db,
            todo_item.title,
            todo_item.done
        )
        return {"message": "作成しました"}


#update
@router.put("/tasks/{task_id}")
def update_task(
    task_id: int,
    title: str,
    done: bool,
    task_repo: Annotated[TaskRepository, Depends(TaskRepository)],
    ):
    with SessionLocal.begin() as db:
        task = task_repo.update_task(
            db,
            task_id,
            title,
            done
        )
        return Response(data=task)

#delete
@router.delete("/tasks/{task_id}")
def delete_task(
    task_id: int,
    task_repo = Annotated[TaskRepository, Depends(TaskRepository)],
    ):
    with SessionLocal.begin() as db:
        task = task_repo.delete_task(
            db,
            task_id
        )
        return Response(data=task)