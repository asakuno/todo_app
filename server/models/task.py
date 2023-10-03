import datetime
from sqlalchemy import Column, BigInteger, String, ForeignKey, Boolean,DateTime
from sqlalchemy.orm import relationship
from typing import Optional
from pydantic import BaseModel, Field

from  server.settings.database import Base


class Task(Base):
    __tablename__ = "tasks"

    id = Column(BigInteger(), primary_key=True, autoincrement=True)
    title = Column(String(1024))
    done = Column(Boolean, default=False)
    created_at = Column(DateTime, nullable=False, default=datetime.datetime.now)
    updated_at = Column(
        DateTime,
        nullable=False,
        default=datetime.datetime.now,
        onupdate=datetime.datetime.now,
    )
    
class TaskModel(BaseModel):
    id: int
    title: str
    done: bool
    created_at: datetime.datetime
    updated_at: datetime.datetime
    
    class Config:
        orm_mode = True
        from_attributes=True