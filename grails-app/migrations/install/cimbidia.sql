CREATE TABLE `order_item_rts` (
  `id` char(38) NOT NULL DEFAULT '',
  `version` bigint(20) NOT NULL,
  `category_id` char(38) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `inventory_item_id` char(38) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `order_id` char(38) DEFAULT NULL,
  `product_id` char(38) DEFAULT NULL,
  `rts_quantity` int(11) NOT NULL,
  `requested_by_id` char(38) DEFAULT NULL,
  `pickup_start_dt` datetime DEFAULT NULL,
  `pickup_end_dt` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_REQ_BY_ID` (`requested_by_id`),
  KEY `FK_ITEM_ID` (`inventory_item_id`),
  KEY `FK_ORDER_ID` (`order_id`),
  KEY `FK_PROD_ID` (`product_id`),
  KEY `FK_CATEG_ID` (`category_id`),
  CONSTRAINT `FK_CATEG_ID` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_REQ_BY_ID` FOREIGN KEY (`requested_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_ITEM_ID` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_item` (`id`),
  CONSTRAINT `FK_ORDER_ID` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK_PROD_ID` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `order_delivery` (
  `id` char(38) NOT NULL DEFAULT '',
  `version` bigint(20) NOT NULL,
  `category_id` char(38) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `inventory_item_id` char(38) DEFAULT NULL,
  `last_updated` datetime NOT NULL,
  `order_id` char(38) DEFAULT NULL,
  `product_id` char(38) DEFAULT NULL,
  `delivery_quantity` int(11) NOT NULL,
  `requested_by_id` char(38) DEFAULT NULL,
  `pickup_dt` datetime DEFAULT NULL,
  `delivery_dt` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_DLV_REQ_BY_ID` (`requested_by_id`),
  KEY `FK_DLV_ITEM_ID` (`inventory_item_id`),
  KEY `FK_DLV_ORDER_ID` (`order_id`),
  KEY `FK_DLV_PROD_ID` (`product_id`),
  KEY `FK_DLV_CATEG_ID` (`category_id`),
  CONSTRAINT `FK_DLV_CATEG_ID` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_DLV_REQ_BY_ID` FOREIGN KEY (`requested_by_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_DLV_ITEM_ID` FOREIGN KEY (`inventory_item_id`) REFERENCES `inventory_item` (`id`),
  CONSTRAINT `FK_DLV_ORDER_ID` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`),
  CONSTRAINT `FK_DLV_PROD_ID` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


--
-- Table structure for table `unit_of_measure`
--

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment` (
  `id` char(38) NOT NULL DEFAULT '',
  `version` bigint(20) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `date_created` datetime NOT NULL,
  `last_updated` datetime NOT NULL,
  `created_by_id` char(38) DEFAULT NULL,
  `updated_by_id` char(38) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `equipment_size` (
  `id` char(38) NOT NULL DEFAULT '',
  `equipment_id` char(38) NOT NULL DEFAULT '',
  `version` bigint(20) NOT NULL,
  `uom_id` char(38) NOT NULL,
  `value` bigint(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

ALTER TABLE `unit_of_measure` ADD COLUMN (
`inherit_on_order` varchar(50) DEFAULT NULL);

ALTER TABLE `order_item` ADD COLUMN (
`size1` float(12,0) DEFAULT NULL,
`size2` float(12,0) DEFAULT NULL,
`size3` float(12,0) DEFAULT NULL) ;

/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_delivery_shipment` (
  `id` char(38) NOT NULL DEFAULT '',
  `version` bigint(20) NOT NULL,
  `order_delivery_id` char(38) DEFAULT NULL,
  `shipment_id` char(38) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_order_delivery_shipment_order_delivery` (`order_delivery_id`),
  KEY `FK_order_delivery_shipment_shipment` (`shipment_id`),
  CONSTRAINT `FK_order_delivery_shipment_order_delivery` FOREIGN KEY (`order_delivery_id`) REFERENCES `order_delivery` (`id`),
  CONSTRAINT `FK_order_delivery_shipment_shipment` FOREIGN KEY (`shipment_id`) REFERENCES `shipment` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

ALTER TABLE `order_delivery` ADD COLUMN (
`size1` float(12,0) DEFAULT NULL,
`size2` float(12,0) DEFAULT NULL,
`size3` float(12,0) DEFAULT NULL) ;

INSERT INTO `role` VALUES ('6',0,NULL,'ROLE_CARRIER');

ALTER TABLE `user` ADD COLUMN(
`shipper_id` char(38) NULL DEFAULT NULL);

ALTER TABLE `shipment` ADD COLUMN(
`carrier_status_code` varchar(255) DEFAULT NULL);