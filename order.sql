-- ------------------------------------------------
-- 系统：订单模块
-- 版本: 1.0.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `order_user` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    -- 订单信息
    `order_id`        CHAR(20)       NOT NULL DEFAULT ''   COMMENT '订单号',
    `main_order_id`   CHAR(20)       NOT NULL DEFAULT ''   COMMENT '主订单号',
    `total_amount`    DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '总金额',
    `freight_amount`  DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '运费',
    `coupon_amount`   DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '优惠金额',
    `amount`          DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '应付金额',
    `pay_method`      INT            NOT NULL DEFAULT 0    COMMENT '支付方式：1货到付款 2在线付款',
    `total_num`       INT            NOT NULL DEFAULT 0    COMMENT '商品总数',
    `status`          INT            NOT NULL DEFAULT 1    COMMENT '订单状态 10已创建 20已支付 30已发货 40已收货 50已评价 90已取消',
    `reason`          CHAR(60)       NOT NULL DEFAULT ''   COMMENT '取消原因',
    `memo`            VARCHAR(1024)  NOT NULL DEFAULT ''   COMMENT '备注',

    -- 支付信息
    `pay_receipt_id`      CHAR(20)   NOT NULL DEFAULT ''   COMMENT '收款流水号',
    `pay_receipt_status`  INT        NOT NULL DEFAULT 0    COMMENT '收款流水状态 0未支付 1已支付',
    `pay_refund_id`       CHAR(20)   NOT NULL DEFAULT ''   COMMENT '退款流水号',
    `pay_refund_status`   INT        NOT NULL DEFAULT 0    COMMENT '退款流水状态 0未支付 1已支付',

    -- 商家信息
    `mcht_id`          CHAR(20)       NOT NULL DEFAULT ''   COMMENT '商家ID',
    `is_mcht_deleted`  INT            NOT NULL DEFAULT 0    COMMENT '商家是否删除 0未删除 1已删除',

    -- 用户信息
    `uid`             INT            NOT NULL DEFAULT 0  COMMENT '用户ID',
    `is_deleted`      INT            NOT NULL DEFAULT 0  COMMENT '用户是否删除 0未删除 1已删除',

    -- 收货地址信息
    `recv_addr_id`    INT            NOT NULL DEFAULT 0  COMMENT '收货地址ID',
    `recv_name`       VARCHAR(30)    NOT NULL DEFAULT '' COMMENT '联系人',
    `recv_mobile`     CHAR(11)       NOT NULL DEFAULT '' COMMENT '手机号',
    `recv_prov`       INT            NOT NULL DEFAULT 0  COMMENT '省份',
    `recv_city`       INT            NOT NULL DEFAULT 0  COMMENT '城市',
    `recv_area`       INT            NOT NULL DEFAULT 0  COMMENT '区县',
    `recv_addr`       VARCHAR(60)    NOT NULL DEFAULT '' COMMENT '详细地址',
    `recv_address`    VARCHAR(120)   NOT NULL DEFAULT '' COMMENT '整个地址',
    `recv_lng`        VARCHAR(30)    NOT NULL DEFAULT '' COMMENT '地址经度',
    `recv_lat`        VARCHAR(30)    NOT NULL DEFAULT '' COMMENT '地址纬度',

    `updated_at`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`order_id`),
    KEY (`uid`),
    KEY (`mcht_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户单';

CREATE TABLE IF NOT EXISTS `order_user_product` (
    `id`                INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `order_id`          CHAR(20)       NOT NULL DEFAULT ''   COMMENT '订单号',
    `main_order_id`     CHAR(20)       NOT NULL DEFAULT ''   COMMENT '主订单号',
    `spu_id`            CHAR(20)       NOT NULL DEFAULT ''   COMMENT '商品ID',
    `sku_id`            CHAR(20)       NOT NULL DEFAULT ''   COMMENT 'SKUID',
    `title`             VARCHAR(120)   NOT NULL DEFAULT ''   COMMENT '商品名称',
    `img_url`           VARCHAR(120)   NOT NULL DEFAULT ''   COMMENT '商品图片',
    `property`          TEXT           NOT NULL              COMMENT '商品属性',
    `price`             DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
    `num`               INT            NOT NULL DEFAULT 0    COMMENT '数量',
    `amount`            DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
    `spec`              VARCHAR(60)    NOT NULL DEFAULT ''   COMMENT '规格',
    `inventory_version` INT            NOT NULL DEFAULT 0    COMMENT '库存版本',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`order_id`, `sku_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户单商品';

CREATE TABLE IF NOT EXISTS `order_user_merged` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `merged_id`       CHAR(20)       NOT NULL DEFAULT ''   COMMENT '合并后的订单',
    `amount`          DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '应付金额',
    `order_id`        CHAR(20)       NOT NULL DEFAULT ''   COMMENT '订单号',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`merged_id`, `order_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='合并支付单';

CREATE TABLE IF NOT EXISTS `order_user_comment` (
    `id`               INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `comment_id`       CHAR(20)       NOT NULL DEFAULT ''   COMMENT '评价ID',
    `uid`              INT            NOT NULL DEFAULT 0    COMMENT '用户ID',
    `order_id`         CHAR(20)       NOT NULL DEFAULT ''   COMMENT '订单号',
    `mcht_id`          CHAR(20)       NOT NULL DEFAULT ''   COMMENT '商家ID',
    `product_score`    INT            NOT NULL DEFAULT 0    COMMENT '商品质量',
    `service_score`    INT            NOT NULL DEFAULT 0    COMMENT '服务质量',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE KEY (`comment_id`),
    KEY (`uid`),
    KEY (`mcht_id`),
    UNIQUE KEY (`order_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单评价';
