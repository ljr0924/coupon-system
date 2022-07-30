import datetime
from typing import Optional

from pydantic import BaseModel


class CouponPlatform(BaseModel):
    id: Optional[int]
    access_key: Optional[str]
    secret: Optional[str]
    join_time: Optional[int]
    is_inner: Optional[int]
    is_enable: Optional[int]
    update_time: Optional[datetime.datetime]
