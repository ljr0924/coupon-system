-- 查询优惠券规则
select * from coupon_rule where name like '';

-- 新增优惠券规则
insert into coupon_rule (name, coupon_type, channel, pay, region_province, region_city, region_district, is_exclude, with_amount, sub_amount, discount, create_time, update_time, is_deleted)
values ();

-- 更新优惠券规则
update coupon_rule set name = '' where id = 1;

-- 删除优惠券规则
update coupon_rule set is_deleted = 1 where id = 1;

-- 查询优惠券池  名称，创建时间，更新时间
select * from coupon_pool where name like '' and create_time > now() and update_time > now();

-- 查询优惠券领取人数
select get_count from coupon_pool where id = 1;

-- 查询启用优惠券池
select * from coupon_pool where is_enable = 1;

-- 新增优惠券池
insert into coupon_pool (name, rule_id, use_time_type, use_time_start, use_time_end, use_days, get_start_time, get_end_time, count, get_count, is_enable, create_time, update_time, is_deleted)
values ();

-- 更新优惠券规则
update coupon_pool set name = '' where id = 1;

-- 删除优惠券规则
update coupon_pool set is_deleted = 1 where id = 1;

