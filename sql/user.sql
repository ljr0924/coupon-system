-- 查询用户
select user_id from coupon_user where platform_id = 1 and user_id = 2 and is_deleted = 0

-- 新增用户
insert into coupon_user (platform_id, user_id) values (1, 2)