from pydantic import BaseModel


class CodeModel(BaseModel):
    id: int
    user_id: int
    coupon_id: str
    create_time: int
    update_time: int
