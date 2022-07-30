import datetime

from typing import Optional
from pymysql.cursors import Cursor
from pydantic import BaseModel


class CouponStatus:
    UNKNOWN = 0
    WAIT_USE = 1
    FROZEN = 2
    USED = 3
    EXPIRED = 4


class CouponCode(BaseModel):
    id: Optional[int]
    coupon_pool_id: Optional[int]
    code: Optional[str]
    status: Optional[int]
    use_start_time: Optional[int]
    use_end_time: Optional[int]
    create_time: Optional[datetime.datetime]
    update_time: Optional[datetime.datetime]


class CouponCodeModel:
    __table__ = "coupon_code"

    @classmethod
    def get_by_id(cls, cursor: Cursor, coupon_id: int) -> Optional[CouponCode]:
        sql = f"""
            select 
                coupon_pool_id, 
                code, 
                status, 
                use_start_time, 
                use_end_time 
            from 
                {cls.__table__}
            where 
                id = %s
        """
        cursor.execute(sql, (coupon_id,))

        result = cursor.fetchone()
        if not result:
            return
        return CouponCode(**result)

    @classmethod
    def batch_add(cls, cursor: Cursor, coupon_codes: list[CouponCode]):
        sql = """
            insert into coupon_code (coupon_pool_id, code, status, use_start_time, use_end_time) 
            values (%(coupon_pool_id)s, %(code)s, %(status)s, %(use_start_time)s, %(use_end_time)s) 
        """
        params = [code.dict(exclude={"id": True, "create_time": True, "update_time": True}) for code in coupon_codes]

        cursor.executemany(sql, params)

    @classmethod
    def batch_delete(cls, cursor: Cursor, coupon_ids: list[int]):
        sql = """
            delete from coupon_code where id in %s
        """
        cursor.execute(sql, (coupon_ids,))

    @classmethod
    def update_status(cls, cursor: Cursor, coupon_code: CouponCode):
        sql = """
        update coupon_code set status = %s where id = %s;
        """

        cursor.execute(sql, (coupon_code.status, coupon_code.id,))
