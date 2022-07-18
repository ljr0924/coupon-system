import datetime
from decimal import Decimal

from pydantic import BaseModel


class CouponStatistics(BaseModel):
    id: int
    coupon_pool_id: str
    use_percent: Decimal
    get_percent: Decimal
    create_time: datetime.datetime
    update_time: datetime.datetime
