-- ------------------------------------------------
-- 系统：短信模块
-- 版本: 1.0.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `sms_tmpl` (
    `id`           INT          NOT NULL AUTO_INCREMENT COMMENT '自增',
    `tmpl_id`      INT          NOT NULL DEFAULT 0  COMMENT '模板ID',
    `name`         VARCHAR(255) NOT NULL DEFAULT '' COMMENT '名称',
    `content`      VARCHAR(255) NOT NULL DEFAULT '' COMMENT '内容',
    `third_id`     VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'JSON',
    `is_deleted`   INT          NOT NULL DEFAULT 0  COMMENT '是否删除 0: 未删除 1已删除',

    `updated_at`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`tmpl_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="短信模板";

CREATE TABLE IF NOT EXISTS `sms_message` (
    `id`                   INT          NOT NULL AUTO_INCREMENT,
    `sms_id`               CHAR(20)     NOT NULL DEFAULT 0  COMMENT '短信ID',
    `mobile`               TEXT         NOT NULL            COMMENT '手机号',
    `tmpl_id`              VARCHAR(60)  NOT NULL DEFAULT '' COMMENT '模板ID',
    `tmpl`                 VARCHAR(200) NOT NULL DEFAULT '' COMMENT '模板内容',
    `type`                 INT          NOT NULL DEFAULT 0  COMMENT '类型 1: 验证码',
    `params`               TEXT                             COMMENT '变量',
    `mobile_num`           INT          NOT NULL DEFAULT 1  COMMENT '手机数量',
    `point_single`         INT          NOT NULL DEFAULT 1  COMMENT '单个手机号消费条数',
    `point_amount`         INT          NOT NULL DEFAULT 1  COMMENT '总共消费条数=point_single*mobile_num',
    `status`               INT          NOT NULL DEFAULT 0  COMMENT '发送状态 0未发送 1已发送 2发送失败',
    `return`               VARCHAR(255) NOT NULL DEFAULT '' COMMENT '接口返回结果',
    `reason`               VARCHAR(255) NOT NULL DEFAULT '' COMMENT '失败原因',
    `receipt`              TEXT                             COMMENT '异步回执',
    `send_at`              DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发送时间',

    `updated_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`sms_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="短信";

CREATE TABLE IF NOT EXISTS `sms_captcha` (
    `id`                   INT          NOT NULL AUTO_INCREMENT,
    `mobile`               CHAR(11)     NOT NULL DEFAULT '' COMMENT '手机号',
    `captcha`              VARCHAR(6)   NOT NULL DEFAULT '' COMMENT '验证码',
    `type`                 INT          NOT NULL DEFAULT 0  COMMENT '类型 1注册 2登陆 3找回密码',
    `sms_id`               INT          NOT NULL DEFAULT 0  COMMENT '短信ID',
    `is_used`              INT          NOT NULL DEFAULT 0  COMMENT '是否使用 0未使用 1已使用',
    `period`               INT          NOT NULL DEFAULT 0  COMMENT '有效期',
    `expired_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '过期时间',
    `used_at`              DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '使用时间',

    `updated_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    KEY (`mobile`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="短信验证码";
