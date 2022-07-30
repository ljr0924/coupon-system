-- 新增流水
insert into coupon_event_record (user_id, dest_id, operation_type, operation_desc, status, `desc`)
values ();

-- 查询优惠券流水记录
select * from coupon_event_record where dest_id = :coupon_id