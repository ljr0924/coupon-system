import datetime
from typing import Optional

from pydantic import BaseModel


class CouponUserCode(BaseModel):
    id: Optional[int]
    user_id: Optional[int]
    coupon_id: Optional[str]
    create_time: Optional[datetime.datetime]
    update_time: Optional[datetime.datetime]
