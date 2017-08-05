-- ------------------------------------------------
-- 系统：会员模块
-- 版本: 1.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `user_account` (
    `id`                   INT          NOT NULL AUTO_INCREMENT,
    `user_id`              INT          NOT NULL DEFAULT 0  COMMENT '用户ID',
    `mobile`               CHAR(11)     NOT NULL DEFAULT '' COMMENT '手机号',
    `email`                VARCHAR(60)  NOT NULL DEFAULT '' COMMENT '邮箱',
    `name`                 VARCHAR(30)  NOT NULL DEFAULT '' COMMENT '用户名',
    `is_mobile_verified`   INT          NOT NULL DEFAULT 0  COMMENT '是否手机已验证: 0否 1是',
    `is_email_verified`    INT          NOT NULL DEFAULT 0  COMMENT '是否邮箱已验证: 0否 1是',
    `password`             VARCHAR(60)  NOT NULL DEFAULT '' COMMENT '密码',
    `head_img_id`          VARCHAR(60)  NOT NULL DEFAULT '' COMMENT '头像',
    `source_platform`      INT          NOT NULL DEFAULT 1  COMMENT '注册来源: 1本平台',
    `source_client`        INT          NOT NULL DEFAULT 1  COMMENT '注册客户端: 1H5',
    `is_login_refused`     INT          NOT NULL DEFAULT 0  COMMENT '是否拒绝登录: 0否 1是',
    `login_refused_reason` VARCHAR(255) NOT NULL DEFAULT '' COMMENT '拒绝登录原因',
    `reg_lat`              VARCHAR(255) NOT NULL DEFAULT '' COMMENT '注册位置经度',
    `reg_lng`              VARCHAR(255) NOT NULL DEFAULT '' COMMENT '注册位置纬度',

    `updated_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`           DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),

    UNIQUE KEY (`user_id`),
    UNIQUE KEY (`name`),
    UNIQUE KEY (`mobile`),
    UNIQUE KEY (`email`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="账号";

CREATE TABLE IF NOT EXISTS `user_third` (
    `id`            INT          NOT NULL AUTO_INCREMENT,
    `user_id`       INT          NOT NULL DEFAULT 0  COMMENT '用户ID',
    `platform_id`   INT          NOT NULL DEFAULT 0  COMMENT '平台ID',
    `open_id`       VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'OPENID',
    `open_info`     VARCHAR(512) NOT NULL DEFAULT ''  COMMENT '第三方用户',
    `access_token`  VARCHAR(512) NOT NULL DEFAULT '' COMMENT 'token',
    `expired_at`    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '失效时间',

    `updated_at`    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`    DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE KEY (`user_id`, `platform_id`),
    UNIQUE KEY (`platform_id`, `open_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="第三方平台账号";

CREATE TABLE IF NOT EXISTS `user_real`
(
    `id`            INT         NOT NULL AUTO_INCREMENT,
    `user_id`       INT         NOT NULL DEFAULT 0  COMMENT '用户ID',
    `realname`      VARCHAR(60) NOT NULL DEFAULT '' COMMENT '真实姓名',
    `type`          INT         NOT NULL DEFAULT 0  COMMENT '证件类别：1身份证',
    `number`        VARCHAR(60) NOT NULL DEFAULT '' COMMENT '证件号码',
    `front_img_id` VARCHAR(60) NOT NULL DEFAULT '' COMMENT '证件正面照:{url":""}',
    `back_img_id`  VARCHAR(60) NOT NULL DEFAULT '' COMMENT '证件背面照:{url":""}',
    `hand_img_id`  VARCHAR(60) NOT NULL DEFAULT '' COMMENT '手持证件照:{url":""}',
    `status`        INT         NOT NULL DEFAULT 0  COMMENT '审核状态: 0待审核 1审核通过 2审核不通过',
    `status_memo`   VARCHAR(60) NOT NULL DEFAULT '' COMMENT '备注',

    `updated_at`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`  DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`user_id`),
    KEY (`type`, `number`)

) ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT '会员实名信息';

CREATE TABLE IF NOT EXISTS `user_address` (
    `id`           INT         NOT NULL AUTO_INCREMENT,
    `user_id`      INT         NOT NULL DEFAULT 0  COMMENT '用户ID',
    `addr_id`      INT         NOT NULL DEFAULT 0  COMMENT '地址ID',
    `prov`         VARCHAR(60) NOT NULL DEFAULT '' COMMENT '省份 {"code":"110100", "title":"北京"}',
    `city`         VARCHAR(60) NOT NULL DEFAULT '' COMMENT '城市 {"code":"110101", "title":"北京市"}',
    `district`     VARCHAR(60) NOT NULL DEFAULT '' COMMENT '县区 {"code":"110100", "title":"朝阳区"}',
    `street`       VARCHAR(60) NOT NULL DEFAULT '' COMMENT '街道 {"code":"110100", "title":"右安门街道"}',
    `name`         VARCHAR(15) NOT NULL DEFAULT '' COMMENT '收货人',
    `mobile`       VARCHAR(11) NOT NULL DEFAULT '' COMMENT '手机号',
    `is_default`   INT         NOT NULL DEFAULT 1  COMMENT '是否默认：1否 2是',

    `updated_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`addr_id`),
    KEY (`user_id`)

)ENGINE=InnoDB DEFAULT CHARSET=UTF8 COMMENT '收货地址';
