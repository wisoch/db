-- ------------------------------------------------
-- 系统：支付模块
-- 版本: 1.0.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `pay_receipt` (
    `id`                  INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    `uid`                 INT            NOT NULL DEFAULT 0    COMMENT '用户ID',
    `order_id`            CHAR(20)       NOT NULL DEFAULT ''   COMMENT '订单号',
    `title`               VARCHAR(120)   NOT NULL DEFAULT 0    COMMENT '订单名称',
    `receipt_id`          CHAR(20)       NOT NULL DEFAULT 0    COMMENT '收款交易号',
    `amount`              DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '收款金额',
    `real_amount`         DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实收款金额',
    `currency`            CHAR(10)       NOT NULL DEFAULT ''   COMMENT '货币 CNY',
    `type`                INT            NOT NULL DEFAULT 0    COMMENT '收款方式 1微信 2支付宝 3分点点白条',
    `status`              INT            NOT NULL DEFAULT 1    COMMENT '状态 1创建 2成功 3失败',
    `out_trade_id`        CHAR(60)       NOT NULL DEFAULT ''   COMMENT '外部交易号',
    `out_return`          TEXT                                 COMMENT '外部返回结果',
    `expired_at`          DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',

    `updated_at`          DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`          DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    KEY (`uid`),
    UNIQUE  KEY (`order_id`),
    UNIQUE  KEY (`receipt_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="收款流水";

CREATE TABLE IF NOT EXISTS `pay_refund` (
    `id`                  INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    `uid`                 INT            NOT NULL DEFAULT 0    COMMENT '用户ID',
    `order_id`            CHAR(20)       NOT NULL DEFAULT 0    COMMENT '订单号',
    `title`               VARCHAR(120)   NOT NULL DEFAULT 0    COMMENT '订单名称',
    `receipt_id`          CHAR(20)       NOT NULL DEFAULT 0    COMMENT '收款交易号',
    `refund_id`           CHAR(20)       NOT NULL DEFAULT 0    COMMENT '退款交易号',
    `refund_amount`       DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '退款金额',
    `real_refund_amount`  DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '实退款金额',
    `currency`            CHAR(10)       NOT NULL DEFAULT ''   COMMENT '货币 CNY',
    `type`                INT            NOT NULL DEFAULT 0    COMMENT '退款方式 1微信 2支付宝',
    `status`              INT            NOT NULL DEFAULT 1    COMMENT '状态 1创建 2成功 3失败',
    `out_trade_id`        CHAR(60)       NOT NULL DEFAULT ''   COMMENT '外部交易号',
    `out_return`          TEXT                                 COMMENT '外部返回结果',

    `updated_at`          DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`          DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    KEY (`uid`),
    UNIQUE  KEY (`order_id`),
    UNIQUE  KEY (`refund_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="退款流水";

CREATE TABLE IF NOT EXISTS `pay_trade` (
    `id`            INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    `uid`           INT            NOT NULL DEFAULT 0    COMMENT '用户ID',
    `trade_id`      CHAR(20)       NOT NULL DEFAULT 0    COMMENT '交易号',
    `trade_amount`  DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '金额',
    `currency`      CHAR(10)       NOT NULL DEFAULT ''   COMMENT '货币 CNY',
    `type`          INT            NOT NULL DEFAULT 0    COMMENT '支付方式 1微信红包',
    `status`        INT            NOT NULL DEFAULT 1    COMMENT '状态 1创建 2成功 3失败',
    `out_trade_id`  CHAR(60)       NOT NULL DEFAULT 0    COMMENT '外部交易号',
    `out_return`    TEXT                                 COMMENT '外部返回结果',
    `expired_at`    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',

    `updated_at`    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`    DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    KEY (`uid`),
    UNIQUE  KEY (`trade_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="支付流水";

