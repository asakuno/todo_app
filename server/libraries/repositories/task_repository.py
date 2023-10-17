from fastapi import Depends, HTTPException, Request
from sqlalchemy.orm import Session
from sqlalchemy import select, func
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
    ) -> TaskModel:
        task_orm = Task(
            title=title,
            done=done
        )
        db.add(task_orm)
        db.flush()

        return TaskModel.from_orm(task_orm)
    
    def update_task(
        self,
        db: Session,
        task_id: int,
        title: str,
        done: bool,
    ) -> Task:
        task_orm = db.scalar((
            select(Task)
            .where(task_id == task_id)
        )).one_or_none()
        
        return TaskModel.from_orm(task_orm)
    
    def delete_task(
        self,
        db: Session,
        task_id: int,
    ) -> Task:
        task_orm = db.scalars((
            select(Task)
            .where(task_id == task_id) 
        )).one_or_none()
        
        task_orm.delete()
        
        return {"result": "delete success"}