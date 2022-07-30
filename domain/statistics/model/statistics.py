import datetime
from decimal import Decimal
from typing import Optional

from pydantic import BaseModel


class CouponStatistics(BaseModel):
    id: Optional[int]
    coupon_pool_id: Optional[str]
    use_percent: Optional[Decimal]
    get_percent: Optional[Decimal]
    create_time: Optional[datetime.datetime]
    update_time: Optional[datetime.datetime]
