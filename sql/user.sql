-- 查询平台
select * from coupon_platform where name like '';

-- 查询平台access_key secret
select access_key, secret, is_inner from coupon_platform where id = 1 and is_enable = 1;

-- 新增第三方平台
insert into coupon_platform (name, access_key, secret, join_time, is_inner, is_enable)
values ('第三方平台名称', 'access_key', 'secret', '2022-07-19 00:00:00', 1, 1);

-- 禁用第三方平台
update coupon_platform set is_enable = 0 where id = 1;

-- 查询用户
select user_id from coupon_user where platform_id = 1 and user_id = 2 and is_deleted = 0;

-- 新增用户
insert into coupon_user (platform_id, user_id) values (1, 2)