import datetime

from pydantic import BaseModel


class CouponUserCode(BaseModel):
    id: int
    user_id: int
    coupon_id: str
    create_time: datetime.datetime
    update_time: datetime.datetime
