from decimal import Decimal

from pydantic import BaseModel


class RuleModel(BaseModel):
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
    create_time: int
    update_time: int
    is_deleted: int
