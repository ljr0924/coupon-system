DROP TABLE IF EXISTS `coupon_code`;
DROP TABLE IF EXISTS `coupon_event_record`;
DROP TABLE IF EXISTS `coupon_platform`;
DROP TABLE IF EXISTS `coupon_pool`;
DROP TABLE IF EXISTS `coupon_rule`;
DROP TABLE IF EXISTS `coupon_statistics`;
DROP TABLE IF EXISTS `coupon_user`;
DROP TABLE IF EXISTS `coupon_user_code`;

CREATE TABLE `coupon_code`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_pool_id` int NOT NULL COMMENT 'coupon_pool.id',
  `code` varchar(128) NOT NULL COMMENT '优惠券码',
  `status` tinyint NOT NULL DEFAULT 0 COMMENT '优惠券当前状态，0：未知，1：冻结，2：已使用，3：已过期',
  `use_start_time` int NOT NULL DEFAULT 0 COMMENT '可使用开始时间',
  `use_end_time` int NOT NULL DEFAULT 0 COMMENT '可使用结束时间',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `idx_coupon_pool_id`(`coupon_pool_id`) USING BTREE
) COMMENT = '优惠券码表';

CREATE TABLE `coupon_event_record`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL COMMENT 'coupon_user.id',
  `dest_id` int NOT NULL COMMENT '操作对象id',
  `operation_type` tinyint NOT NULL COMMENT '操作类型',
  `operation_desc` varchar(255) NOT NULL DEFAULT '' COMMENT '操作描述',
  `status` tinyint NOT NULL COMMENT '目标状态值',
  `desc` varchar(255) NOT NULL COMMENT '事件描述',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '操作时间',
  PRIMARY KEY (`id`),
  INDEX `idx_user_id`(`user_id`) USING BTREE
) COMMENT = '事件流水表';

CREATE TABLE `coupon_platform`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `access_key` varchar(32) NOT NULL DEFAULT '' COMMENT '访问使用的key',
  `secret` varchar(32) NOT NULL DEFAULT '' COMMENT '密钥',
  `join_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '加入时间',
  `is_inner` tinyint NOT NULL DEFAULT 0 COMMENT '是否为内部平台，0：外部，1：内部',
  `is_enable` tinyint NOT NULL DEFAULT 1 COMMENT '是否启用，1：启用，0：禁用',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`)
) COMMENT = '优惠券平台主体，接口调用方';

CREATE TABLE `coupon_pool`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则名称',
  `rule_id` int NOT NULL COMMENT '规则id，coupon_rule.id',
  `use_time_type` tinyint NOT NULL DEFAULT 0 COMMENT '过期时间计算类型，1：相对时间，领取后多少天，2：固定时间，某个时间段',
  `use_time_start` int NOT NULL DEFAULT 0 COMMENT '可使用开始时间',
  `use_time_end` int NOT NULL DEFAULT 0 COMMENT '可使用结束时间',
  `use_days` int NOT NULL DEFAULT 0 COMMENT 'N天后过期',
  `get_start_time` int NOT NULL DEFAULT 0 COMMENT '可领取开始时间',
  `get_end_time` int NOT NULL DEFAULT 0 COMMENT '可领取结束时间',
  `count` int NOT NULL DEFAULT 0 COMMENT '优惠券总数，0为无限',
  `get_count` int NOT NULL DEFAULT 0 COMMENT '已领取总数',
  `is_enable` tinyint NOT NULL COMMENT '是否启用',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '优惠券池创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  INDEX `idx_rule_id`(`rule_id`) USING BTREE
) COMMENT = '优惠券池表';

CREATE TABLE `coupon_rule`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '规则名称',
  `coupon_type` tinyint NOT NULL COMMENT '优惠券种类，0-未知，1-平台券，2-商家券，3-商品券',
  `channel` tinyint NOT NULL COMMENT '使用渠道，0-未知，1-app，2-小程序，3-web，4-h5',
  `pay` tinyint NOT NULL COMMENT '支付方式，0-未知，1-微信支付，2-支付宝，3-银行卡',
  `region_province` int NOT NULL COMMENT '地区-市',
  `region_city` int NOT NULL COMMENT '地区-市',
  `region_district` int NOT NULL COMMENT '地区-区',
  `is_exclude` tinyint NOT NULL COMMENT '是否互斥',
  `with_amount` decimal(10, 2) NOT NULL COMMENT '使用门槛',
  `sub_amount` decimal(10, 2) NOT NULL COMMENT '满减金额',
  `discount` decimal(3, 2) NOT NULL COMMENT '折扣, (0, 1]',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` int NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`)
) COMMENT = '优惠券规则表';

CREATE TABLE `coupon_statistics`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `coupon_pool_id` int NOT NULL COMMENT 'coupon_pool.id',
  `use_percent` decimal(3, 2) NOT NULL DEFAULT 0 COMMENT '使用比例',
  `get_percent` decimal(3, 2) NOT NULL DEFAULT 0 COMMENT '领取占比',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `idx_coupon_id`(`coupon_pool_id`) USING BTREE
) COMMENT = '优惠券统计数据表';

CREATE TABLE `coupon_user`  (
  `id` int NOT NULL,
  `platform_id` int NOT NULL COMMENT 'coupon_platform.id',
  `user_id` int NOT NULL COMMENT '用户id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `is_deleted` tinyint NOT NULL COMMENT '是否删除',
  PRIMARY KEY (`id`),
  INDEX `idx_platform_id`(`platform_id`) USING BTREE
) COMMENT = '各平台用户';

CREATE TABLE `coupon_user_code`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL DEFAULT 0 COMMENT 'coupon_user.id',
  `coupon_id` int NOT NULL COMMENT 'coupon_code.id',
  `create_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '用户与优惠券绑定的时间',
  `update_time` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  PRIMARY KEY (`id`),
  INDEX `idx_user_id`(`user_id`) USING BTREE
) COMMENT = '用户与优惠券关系表';

