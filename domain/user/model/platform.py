from pydantic import BaseModel


class PlatformModel(BaseModel):
    id: int
    access_key: str
    secret: str
    join_time: int
    is_inner: int
    is_enable: int
    update_time: int
