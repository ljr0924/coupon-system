import datetime
from typing import Optional

from pydantic import BaseModel


class CouponEventRecord(BaseModel):
    id: Optional[int]
    user_id: Optional[int]
    dest_id: Optional[int]
    operation_type: Optional[int]
    operation_desc: Optional[str]
    status: Optional[int]
    desc: Optional[str]
    create_time: Optional[datetime.datetime]
