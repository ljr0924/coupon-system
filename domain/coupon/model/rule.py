import datetime
from decimal import Decimal
from typing import Optional

from pydantic import BaseModel


class CouponRule(BaseModel):
    id: Optional[int]
    coupon_type: Optional[int]
    platform_id: Optional[int]
    merchant_id: Optional[int]
    product_id: Optional[int]
    channel: Optional[int]
    pay: Optional[int]
    region_province: Optional[int]
    region_city: Optional[int]
    region_district: Optional[int]
    is_exclude: Optional[int]
    with_amount: Optional[Decimal]
    sub_amount: Optional[Decimal]
    discount: Optional[Decimal]
    create_time: Optional[datetime.datetime]
    update_time: Optional[datetime.datetime]
    is_deleted: Optional[int]
