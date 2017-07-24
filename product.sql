-- ------------------------------------------------
-- 系统：商品模块
-- 版本: 1.0.0
-- ------------------------------------------------
CREATE TABLE IF NOT EXISTS `standard_unit` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `unit`            CHAR(20)       NOT NULL DEFAULT '' COMMENT '售卖单位',
    `status`          INT            NOT NULL DEFAULT 0  COMMENT '状态 0未停用 1已停用',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`unit`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='售卖单位';

CREATE TABLE IF NOT EXISTS `standard_brand` (
    `brand_id`        INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    
    `name`            VARCHAR(30)    NOT NULL DEFAULT '' COMMENT '品牌名称',
    `img_url`         VARCHAR(120)   NOT NULL DEFAULT '' COMMENT '品牌LOGO',
    `status`          INT            NOT NULL DEFAULT 0  COMMENT '状态 0未停用 1已停用',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`brand_id`),
    UNIQUE  KEY (`name`)
    
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 COMMENT='品牌';

CREATE TABLE IF NOT EXISTS `standard_category` (
    `cat_id`          INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    `parent_id`       INT            NOT NULL DEFAULT 0   COMMENT '父分类ID',
    `name`            VARCHAR(30)    NOT NULL DEFAULT ''  COMMENT '名称',
    `path`            VARCHAR(1024)  NOT NULL DEFAULT ''  COMMENT '路径',
    `sort`            INT            NOT NULL DEFAULT 0   COMMENT '排序',
    `img_url`         VARCHAR(60)    NOT NULL DEFAULT ''  COMMENT '图片',
    `status`          INT            NOT NULL DEFAULT 0   COMMENT '状态 0未停用 1已停用',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`cat_id`),
    UNIQUE  KEY (`name`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=100 COMMENT='品类';

CREATE TABLE IF NOT EXISTS `standard_prop` (
    `prop_id`         INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    `name`            VARCHAR(30)    NOT NULL DEFAULT '' COMMENT '属性名称',
    `type`            INT            NOT NULL DEFAULT 0  COMMENT '属性类别 1销售属性 2非销售属性',
    `status`          INT            NOT NULL DEFAULT 0  COMMENT '状态 0未停用 1已停用',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`prop_id`),
    UNIQUE  KEY (`name`, `type`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 COMMENT='属性';

CREATE TABLE IF NOT EXISTS `standard_val` (
    `val_id`          INT            NOT NULL AUTO_INCREMENT COMMENT '自增',
    `prop_id`         INT            NOT NULL DEFAULT 0  COMMENT '属性ID',
    `val`             VARCHAR(30)    NOT NULL DEFAULT '' COMMENT '值',
    `status`          INT            NOT NULL DEFAULT 0  COMMENT '状态 0未停用 1已停用',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`val_id`),
    UNIQUE  KEY (`prop_id`, `val`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 COMMENT='属性值';

CREATE TABLE IF NOT EXISTS `standard_cat_brand` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `cat_id`           INT           NOT NULL DEFAULT 0 COMMENT '分类ID',
    `brand_id`         INT           NOT NULL DEFAULT 0 COMMENT '品牌ID',
    `sort`             INT           NOT NULL DEFAULT 0 COMMENT '排序',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`cat_id`, `brand_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品类对应品牌';

CREATE TABLE IF NOT EXISTS `standard_cat_prop` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `cat_id`          INT           NOT NULL DEFAULT 0 COMMENT '分类ID',
    `prop_id`         INT           NOT NULL DEFAULT 0 COMMENT '属性ID',
    `sort`             INT           NOT NULL DEFAULT 0 COMMENT '排序',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`cat_id`, `prop_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='品类对应属性';

CREATE TABLE IF NOT EXISTS `standard_prop_val` (
    `id`              INT           NOT NULL AUTO_INCREMENT COMMENT '自增',

    `cat_id`          INT           NOT NULL DEFAULT 0 COMMENT '分类ID',
    `brand_id`        INT           NOT NULL DEFAULT 0 COMMENT '品牌ID',
    `prop_id`         INT           NOT NULL DEFAULT 0 COMMENT '属性ID',
    `val_id`          INT           NOT NULL DEFAULT 0 COMMENT '值ID',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`cat_id`, `brand_id`, `val_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1000 COMMENT='品类对应品牌以及属性的值';

CREATE TABLE IF NOT EXISTS `standard_spu` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `spu_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品ID',
    `name`            VARCHAR(60)    NOT NULL DEFAULT '' COMMENT '商品名称',
    `img_url`         VARCHAR(120)   NOT NULL DEFAULT '' COMMENT '品牌LOGO',
    `cat_id`          INT            NOT NULL DEFAULT 0  COMMENT '分类ID',
    `brand_id`        INT            NOT NULL DEFAULT 0  COMMENT '品牌ID',
    `type`            INT            NOT NULL DEFAULT 1  COMMENT '商品类型 1实物',
    `is_deleted`      INT            NOT NULL DEFAULT 0  COMMENT '是否删除 0未删除 1已删除',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`spu_id`),
    UNIQUE  KEY (`name`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选品SPU';

CREATE TABLE IF NOT EXISTS `standard_sku` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `spu_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品ID',
    `sku_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品SKU',
    `name`            VARCHAR(60)    NOT NULL DEFAULT '' COMMENT '商品名称',
    `img_url`         VARCHAR(120)   NOT NULL DEFAULT '' COMMENT '图片',
    `properties`      VARCHAR(255)   NOT NULL DEFAULT '' COMMENT '销售属性',
    `spec`            VARCHAR(255)   NOT NULL DEFAULT '' COMMENT '商品规格',
    `ea_spec`         VARCHAR(255)   NOT NULL DEFAULT '' COMMENT '单个商品规格',
    `ea_unit`         VARCHAR(10)    NOT NULL DEFAULT '' COMMENT '单个商品单位',
    `cs_num`          INT            NOT NULL DEFAULT 0  COMMENT '包装商品数量',
    `cs_unit`         VARCHAR(10)    NOT NULL DEFAULT '' COMMENT '包装商品单位',
    `status`          INT            NOT NULL DEFAULT 0  COMMENT '是否可以选品 0不可以 1可以',
    `is_deleted`      INT            NOT NULL DEFAULT 0  COMMENT '是否删除 0未删除 1已删除',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`sku_id`),
    KEY (`spu_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选品SKU';

CREATE TABLE IF NOT EXISTS `standard_barcode` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `spu_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品ID',
    `sku_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品SKU',
    `barcode`         VARCHAR(60)    NOT NULL DEFAULT '' COMMENT 'barcode',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`barcode`, `sku_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选品条码';

CREATE TABLE IF NOT EXISTS `standard_sku_prop` (
    `id`              INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `spu_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品ID',
    `sku_id`          CHAR(20)       NOT NULL DEFAULT 0  COMMENT '商品SKU',
    `prop_id`         INT            NOT NULL DEFAULT 0  COMMENT '属性ID',
    `val_id`          INT            NOT NULL DEFAULT 0  COMMENT '值ID',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`sku_id`, `prop_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='选品SKU属性';

CREATE TABLE IF NOT EXISTS `merchant_product` (
    `id`                INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `mcht_id`           CHAR(20)       NOT NULL DEFAULT ''   COMMENT '供应商ID',
    `spu_id`            CHAR(20)       NOT NULL DEFAULT 0    COMMENT '商品ID',
    `sku_id`            CHAR(20)       NOT NULL DEFAULT 0    COMMENT '商品SKU',
    `price`             DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
    `limit_order`       INT            NOT NULL DEFAULT 0    COMMENT '单限购',
    `limit_day`         INT            NOT NULL DEFAULT 0    COMMENT '日限购',
    `moq`               INT            NOT NULL DEFAULT 0    COMMENT '起订量',
    `step`              INT            NOT NULL DEFAULT 0    COMMENT '起订歩长',
    `inventory`         INT            NOT NULL DEFAULT 0    COMMENT '库存量',
    `inventory_version` INT            NOT NULL DEFAULT 1    COMMENT '库存版本',
    `is_shelved`        INT            NOT NULL DEFAULT 0    COMMENT '是否上架 0下架 1上架',
    `shelved_op`        VARCHAR(20)    NOT NULL DEFAULT ''   COMMENT '上下架操作人',
    `is_deleted`        INT            NOT NULL DEFAULT 0    COMMENT '是否删除 0未删除 1已删除',

    `updated_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
    `created_at`      DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`),
    UNIQUE  KEY (`mcht_id`, `sku_id`),
    KEY (`spu_id`, `sku_id`),
    KEY (`sku_id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商商品';

CREATE TABLE IF NOT EXISTS `merchant_history` (
    `id`                INT            NOT NULL AUTO_INCREMENT COMMENT '自增',

    `mcht_id`           CHAR(20)       NOT NULL DEFAULT ''   COMMENT '供应商ID',
    `spu_id`            CHAR(20)       NOT NULL DEFAULT 0    COMMENT '商品ID',
    `sku_id`            CHAR(20)       NOT NULL DEFAULT 0    COMMENT '商品SKU',
    `price`             DECIMAL(10, 2) NOT NULL DEFAULT 0.00 COMMENT '价格',
    `limit_order`       INT            NOT NULL DEFAULT 0    COMMENT '单限购',
    `limit_day`         INT            NOT NULL DEFAULT 0    COMMENT '日限购',
    `moq`               INT            NOT NULL DEFAULT 0    COMMENT '起订量',
    `step`              INT            NOT NULL DEFAULT 0    COMMENT '起订歩长',
    `is_shelved`        INT            NOT NULL DEFAULT 0    COMMENT '是否上架 0下架 1上架',
    `is_deleted`        INT            NOT NULL DEFAULT 0    COMMENT '是否删除 0未删除 1已删除',
    `op`                VARCHAR(20)    NOT NULL DEFAULT ''   COMMENT '操作人',

    `created_at`        DATETIME       NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',

    PRIMARY KEY (`id`)

) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='供应商商品历史信息';
