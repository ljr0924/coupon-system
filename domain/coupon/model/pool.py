from pydantic import BaseModel


class PoolModel(BaseModel):
    id: int
    rule_id: int
    use_time_type: int
    use_time_start: int
    use_time_end: int
    use_days: int
    get_start_time: int
    get_end_time: int
    count: int
    get_count: int
    is_enable: int
    create_time: int
    update_time: int
    is_deleted: int
