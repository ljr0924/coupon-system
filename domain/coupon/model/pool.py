import datetime
from typing import Optional

from pydantic import BaseModel


class CouponPool(BaseModel):
    id: Optional[int]
    rule_id: Optional[int]
    use_time_type: Optional[int]
    use_time_start: Optional[int]
    use_time_end: Optional[int]
    use_days: Optional[int]
    get_start_time: Optional[int]
    get_end_time: Optional[int]
    count: Optional[int]
    get_count: Optional[int]
    is_enable: Optional[int]
    create_time: Optional[datetime.datetime]
    update_time: Optional[datetime.datetime]
    is_deleted: Optional[int]
