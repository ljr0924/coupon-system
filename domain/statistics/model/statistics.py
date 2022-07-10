from decimal import Decimal

from pydantic import BaseModel


class StatisticsModel(BaseModel):
    id: int
    coupon_pool_id: str
    use_percent: Decimal
    get_percent: Decimal
    create_time: int
    update_time: int
