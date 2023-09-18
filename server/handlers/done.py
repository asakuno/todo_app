from fastapi import APIRouter

router = APIRouter()

#check
@router.put("/tasks/{task_id}/done")
def mark_task_as_done(task_id: int):
    pass

#uncheck
@router.delete("/tasks/{task_id}/done")
def unmark_task_as_done():
    pass