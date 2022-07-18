import datetime

from pydantic import BaseModel


class CouponUser(BaseModel):
    id: int
    platform_id: int
    user_id: int
    create_time: datetime.datetime
    update_time: datetime.datetime
    is_deleted: int
