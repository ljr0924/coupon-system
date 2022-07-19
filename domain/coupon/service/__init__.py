class CouponService:
    """
    优惠券相关操作
    """

    @classmethod
    def get_coupon_list(cls, pool_id):
        """查券"""
        pass

    @classmethod
    def dispatch_coupon(cls, user_id, pool_id):
        """发券"""
        pass

    @classmethod
    def get_user_coupon(cls, user_id):
        """获取用户优惠券"""
        pass

    @classmethod
    def transfer_coupon(cls, coupon_id, dest_user_id):
        """优惠券转让"""
        pass

    @classmethod
    def verify_coupon(cls, coupon_id):
        """核销优惠券"""
        pass

    @classmethod
    def freeze_coupon(cls, coupon_id):
        """冻结优惠券"""
        pass

    @classmethod
    def cal_discount(cls, user_id, **kwargs):
        """计算优惠"""
        pass
