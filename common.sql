-- ------------------------------------------------
-- 系统：公共模块
-- 版本: 1.0.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `common_file` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `file_id`         CHAR(20)       NOT NULL DEFAULT ''   COMMENT '文件ID',
    `group`           VARCHAR(20)    NOT NULL DEFAULT ''   COMMENT '分组',
    `url`             VARCHAR(20)    NOT NULL DEFAULT ''   COMMENT 'URL',
    `uid`             INT            NOT NULL DEFAULT 0    COMMENT '用户ID',
    `md5`             CHAR(32)       NOT NULL DEFAULT ''   COMMENT 'MD5值',
    `mime_type`       CHAR(32)       NOT NULL DEFAULT ''   COMMENT 'MIME TYPE',
    `extra`           VARCHAR(1024)  NOT NULL DEFAULT ''   COMMENT '扩展信息',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`url`),
    UNIQUE  KEY (`md5`),
    KEY (`group`),
    KEY (`uid`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件';

CREATE TABLE IF NOT EXISTS `common_region` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `name`            VARCHAR(20)    NOT NULL DEFAULT ''   COMMENT '地域',
    `code`            INT            NOT NULL DEFAULT 0    COMMENT '编码',
    `parent_code`     INT            NOT NULL DEFAULT 0    COMMENT '父编码',
    `sort`            INT            NOT NULL DEFAULT 0    COMMENT '排序',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`code`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='地域';
