import datetime
from typing import Optional

from pydantic import BaseModel


class CouponUser(BaseModel):
    id: Optional[int]
    platform_id: Optional[int]
    user_id: Optional[int]
    create_time: Optional[datetime.datetime]
    update_time: Optional[datetime.datetime]
    is_deleted: Optional[int]
