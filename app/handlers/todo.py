from fastapi import APIRouter

router = APIRouter()

@router.get("/")
def todos():
    return {"message": "hello!"}

#index
@router.get("/tasks")
def get_tasks():
    pass

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