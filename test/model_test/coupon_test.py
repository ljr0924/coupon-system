from unittest import TestCase

import pymysql

from domain.coupon.model.code import CouponCode, CouponCodeModel, CouponStatus


class CouponModelTest(TestCase):

    def setUp(self) -> None:
        self.conn = pymysql.connect(host='localhost', port=3306, user='root', passwd='123456', db='coupon')
        self.cursor = self.conn.cursor(pymysql.cursors.DictCursor)

    def test_insert(self):
        import time
        now = int(time.time())
        codes = [CouponCode(coupon_pool_id=i, code='code', status=CouponStatus.WAIT_USE, use_start_time=now,
                            use_end_time=now) for i in range(3)]
        CouponCodeModel.batch_add(self.cursor, codes)

        self.conn.commit()

    def test_select(self):
        coupon_code = CouponCodeModel.get_by_id(self.cursor, 2)

        self.assertTrue(isinstance(coupon_code, CouponCode))

    def test_delete(self):
        CouponCodeModel.batch_delete(self.cursor, [2, 3, 4, 5, 6])

        self.conn.commit()

    def test_update(self):
        CouponCodeModel.update_status(self.cursor, CouponCode(id=7, status=CouponStatus.FROZEN))

        self.conn.commit()
