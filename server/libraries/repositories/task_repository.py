from fastapi import Depends, HTTPException, Request
from sqlalchemy.orm import Session
from sqlalchemy import select, func, delete
from server.models.task import Task, TaskModel

class TaskRepository:
    # def __init__(
    #     self,
    # ):
        
    def get_tasks_all(
        self,
        db: Session,
    ):
        tasks_orm = db.scalars((
            select(Task)
        )).all()
        return [TaskModel.from_orm(task) for task in tasks_orm]
    
    def my_task():
        pass
    
    def create_task(
        self,
        db: Session,
        title: str,
        done: bool,
    ):
        task_orm = Task(
            title=title,
            done=done
        )
        db.add(task_orm)
        db.flush()
    
    def update_task(
        self,
        db: Session,
        task_id: int,
        done: bool,
    ) -> Task:
        task_orm = db.scalar((
            select(Task)
            .where(Task.id == task_id)
        ))
        
        task_orm.done = done
        
        db.add(task_orm)
        db.flush()
        
        return TaskModel.from_orm(task_orm)
    
    def delete_task(
        self,
        db: Session,
        task_id: int,
    ):
        delete_statement = delete(Task).where(Task.id == task_id)

        db.execute(delete_statement)

        return {"result": "delete success"}