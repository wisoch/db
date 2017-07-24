-- ------------------------------------------------
-- 系统：推送模块
-- 版本: 1.0.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `push_device` (
    `id`            INT          NOT NULL AUTO_INCREMENT COMMENT '自增',
    `device_id`     CHAR(20)     NOT NULL DEFAULT 0  COMMENT '设备ID',
    `uuid`          VARCHAR(120) NOT NULL DEFAULT '' COMMENT '设备唯一ID',
    `app_name`      VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'APP名称',
    `app_version`   VARCHAR(10)  NOT NULL DEFAULT '' COMMENT 'APP版本',
    `app_build_id`  VARCHAR(10)  NOT NULL DEFAULT '' COMMENT 'APPbuild号',
    `os_name`       VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'OS名称',
    `os_model`      VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'OS型号',
    `os_model_name` VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'OS型号名称',
    `os_version`    VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'OS版本',
    `screen_w`      VARCHAR(120) NOT NULL DEFAULT '' COMMENT '屏幕宽度',
    `screen_h`      VARCHAR(120) NOT NULL DEFAULT '' COMMENT '屏幕高度',
    `device_token`  VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'device_token',
    `registered_id` VARCHAR(120) NOT NULL DEFAULT '' COMMENT 'JPUSH推送ID',
    `channel`       CHAR(20)     NOT NULL DEFAULT '' COMMENT '渠道',
    `uid`           INT          NOT NULL DEFAULT 0  COMMENT '用户ID',

    `updated_at`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`device_id`),
    UNIQUE  KEY (`uuid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="设备";

CREATE TABLE IF NOT EXISTS `push_notification` (
    `id`            INT          NOT NULL AUTO_INCREMENT COMMENT '自增',

    `updated_at`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`   DATETIME     NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT="通知";
