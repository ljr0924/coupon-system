from pydantic import BaseModel


class UserModel(BaseModel):
    id: int
    platform_id: int
    user_id: int
    create_time: int
    update_time: int
    is_deleted: int
