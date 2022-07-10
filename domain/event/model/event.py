from pydantic import BaseModel


class EventModel(BaseModel):
    id: int
    user_id: int
    dest_id: int
    operation_type: int
    operation_desc: str
    status: int
    desc: str
    create_time: int
