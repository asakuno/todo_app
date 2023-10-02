from sqlalchemy import Column, Integer, String, ForeignKey
from sqlalchemy.orm import relationship
from typing import Optional
from pydantic import BaseModel, Field

from  server.settings.database import Base


class Task(Base):
    __tablename__ = "tasks"

    id = Column(Integer, primary_key=True)
    title = Column(String(1024))
    
    done_id = Column(Integer, ForeignKey('done.id'))
    done = relationship("Done", back_populates="task", cascade="delete")
    
class TaskModel(BaseModel):
    id: int
    title: Optional[str] = Field(None, example="買い物に行く")
    done: bool = Field(False, description="完了")
    
    class Config:
        orm_mode = True
        from_attributes = True


class Done(Base):
    __tablename__ = "dones"

    id = Column(Integer, ForeignKey("tasks.id"), primary_key=True)

    task = relationship("Task", back_populates="done")