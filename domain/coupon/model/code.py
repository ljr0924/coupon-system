from pydantic import BaseModel


class CodeModel(BaseModel):
    id: int
    coupon_pool_id: int
    code: str
    status: int
    use_start_time: int
    use_end_time: int
    create_time: int
    update_time: int
