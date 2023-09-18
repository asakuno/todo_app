from fastapi import APIRouter
from typing import List
from server.models.task import TaskModel

router = APIRouter()

@router.get("/")
def todos():
    return {"message": "hello!"}

#index
@router.get("/tasks", response_model=List[TaskModel])
def get_tasks():
    return [TaskModel(id=1, title="1つ目のTODOタスク")]

#create
@router.post("/tasks")
def create_tasks():
    pass

#update
@router.put("/tasks/{task_id}")
def update_task(task_id: int):
    pass

#delete
@router.delete("/tasks/{task_id}")
def delete_task():
    pass