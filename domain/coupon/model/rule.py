import datetime
from decimal import Decimal

from pydantic import BaseModel


class CouponRule(BaseModel):
    id: int
    coupon_type: int
    channel: int
    pay: int
    region_province: int
    region_city: int
    region_district: int
    is_exclude: int
    with_amount: Decimal
    sub_amount: Decimal
    discount: Decimal
    create_time: datetime.datetime
    update_time: datetime.datetime
    is_deleted: int
