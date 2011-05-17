CREATE TABLE `architectures` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `recommended` tinyint(1) DEFAULT '0',
  `available` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `arch_name_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `architectures_repositories` (
  `repository_id` int(11) NOT NULL,
  `architecture_id` int(11) NOT NULL,
  `position` int(11) NOT NULL DEFAULT '0',
  UNIQUE KEY `arch_repo_index` (`repository_id`,`architecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_allowed_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_default_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_namespace_modifiable_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_namespace_id` int(11) NOT NULL,
  `bs_user_id` int(11) DEFAULT NULL,
  `bs_group_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attrib_namespace_user_role_all_index` (`attrib_namespace_id`,`bs_user_id`,`bs_group_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_namespaces` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attrib_namespaces_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_type_modifiable_bies` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `bs_user_id` int(11) DEFAULT NULL,
  `bs_group_id` int(11) DEFAULT NULL,
  `bs_role_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attrib_type_user_role_all_index` (`attrib_type_id`,`bs_user_id`,`bs_group_id`,`bs_role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `value_count` int(11) DEFAULT NULL,
  `attrib_namespace_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attrib_types_on_name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attrib_values` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_id` int(11) NOT NULL,
  `value` text NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_attrib_values_on_attrib_id` (`attrib_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attribs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `attrib_type_id` int(11) NOT NULL,
  `db_package_id` int(11) DEFAULT NULL,
  `binary` varchar(255) DEFAULT NULL,
  `db_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `attribs_index` (`attrib_type_id`,`db_package_id`,`db_project_id`,`binary`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `blacklist_tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `db_packages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `name` tinyblob NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `url` varchar(255) DEFAULT NULL,
  `update_counter` int(11) DEFAULT '0',
  `activity_index` float DEFAULT '100',
  `develproject_id` int(11) DEFAULT NULL,
  `bcntsynctag` varchar(255) DEFAULT NULL,
  `develpackage_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `packages_all_index` (`db_project_id`,`name`(255)),
  KEY `devel_project_id_index` (`develproject_id`),
  KEY `devel_package_id_index` (`develpackage_id`),
  KEY `index_db_packages_on_db_project_id` (`db_project_id`),
  KEY `updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `db_project_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `db_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` tinyblob NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `description` text,
  `created_at` datetime DEFAULT '0000-00-00 00:00:00',
  `updated_at` datetime DEFAULT '0000-00-00 00:00:00',
  `remoteurl` varchar(255) DEFAULT NULL,
  `remoteproject` varchar(255) DEFAULT NULL,
  `type_id` int(11) DEFAULT NULL,
  `maintenance_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_index` (`name`(255)),
  KEY `updated_at_index` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `db_projects_tags` (
  `db_project_id` int(11) NOT NULL,
  `tag_id` int(11) NOT NULL,
  UNIQUE KEY `projects_tags_all_index` (`db_project_id`,`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `delayed_jobs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `priority` int(11) DEFAULT '0',
  `attempts` int(11) DEFAULT '0',
  `handler` text,
  `last_error` text,
  `run_at` datetime DEFAULT NULL,
  `locked_at` datetime DEFAULT NULL,
  `failed_at` datetime DEFAULT NULL,
  `locked_by` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `download_stats` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) DEFAULT NULL,
  `db_package_id` int(11) DEFAULT NULL,
  `repository_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `filename` varchar(255) DEFAULT NULL,
  `filetype` varchar(10) DEFAULT NULL,
  `version` varchar(255) DEFAULT NULL,
  `release` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `counted_at` datetime DEFAULT NULL,
  `count` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `project` (`db_project_id`),
  KEY `package` (`db_package_id`),
  KEY `repository` (`repository_id`),
  KEY `arch` (`architecture_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `downloads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `baseurl` varchar(255) DEFAULT NULL,
  `metafile` varchar(255) DEFAULT NULL,
  `mtype` varchar(255) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `db_project_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `flags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `status` enum('enable','disable') NOT NULL,
  `repo` varchar(255) DEFAULT NULL,
  `db_project_id` int(11) DEFAULT NULL,
  `db_package_id` int(11) DEFAULT NULL,
  `architecture_id` int(11) DEFAULT NULL,
  `position` int(11) NOT NULL,
  `flag` enum('useforbuild','sourceaccess','binarydownload','debuginfo','build','publish','access','lock') NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_flags_on_db_package_id` (`db_package_id`),
  KEY `index_flags_on_db_project_id` (`db_project_id`),
  KEY `index_flags_on_flag` (`flag`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(200) NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `groups_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups_roles` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `groups_roles_all_index` (`group_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `groups_users` (
  `group_id` int(11) NOT NULL DEFAULT '0',
  `user_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `groups_users_all_index` (`group_id`,`user_id`),
  KEY `user_id` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `incident_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `linked_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `linked_db_project_id` int(11) DEFAULT NULL,
  `position` int(11) DEFAULT NULL,
  `linked_remote_project_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `linked_projects_index` (`db_project_id`,`linked_db_project_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `maintenance_incidents` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) DEFAULT NULL,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `request` int(11) DEFAULT NULL,
  `updateinfo_id` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incident_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `object_id` int(11) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `send_mail` tinyint(1) DEFAULT NULL,
  `sent_at` datetime DEFAULT NULL,
  `private` tinyint(1) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  `text` text,
  PRIMARY KEY (`id`),
  KEY `object` (`object_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `package_group_role_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_package_id` int(11) NOT NULL,
  `bs_group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_group_role_all_index` (`db_package_id`,`bs_group_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `package_user_role_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_package_id` int(11) NOT NULL,
  `bs_user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `package_user_role_all_index` (`db_package_id`,`bs_user_id`,`role_id`),
  KEY `index_package_user_role_relationships_on_bs_user_id` (`bs_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `path_elements` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL,
  `repository_id` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `parent_repository_index` (`parent_id`,`repository_id`),
  UNIQUE KEY `parent_repo_pos_index` (`parent_id`,`position`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_group_role_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `bs_group_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_group_role_all_index` (`db_project_id`,`bs_group_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `project_user_role_relationships` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `bs_user_id` int(11) NOT NULL,
  `role_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_user_role_all_index` (`db_project_id`,`bs_user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `ratings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) DEFAULT NULL,
  `object_id` int(11) DEFAULT NULL,
  `object_type` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `object` (`object_id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `release_targets` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `repository_id` int(11) NOT NULL,
  `target_repository_id` int(11) NOT NULL,
  `trigger` enum('finished','allsucceeded','maintenance') COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `repository_id_index` (`repository_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `repositories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `db_project_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `remote_project_name` varchar(255) DEFAULT NULL,
  `rebuild` enum('transitive','direct','local') DEFAULT NULL,
  `block` enum('all','local','never') DEFAULT NULL,
  `linkedbuild` enum('off','localdep','all') DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `projects_name_index` (`db_project_id`,`name`,`remote_project_name`),
  KEY `remote_project_name_index` (`remote_project_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `title` varchar(100) NOT NULL DEFAULT '',
  `parent_id` int(11) DEFAULT NULL,
  `global` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `roles_parent_id_index` (`parent_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles_static_permissions` (
  `role_id` int(11) NOT NULL DEFAULT '0',
  `static_permission_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `roles_static_permissions_all_index` (`static_permission_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `roles_users` (
  `user_id` int(11) NOT NULL DEFAULT '0',
  `role_id` int(11) NOT NULL DEFAULT '0',
  `created_at` datetime DEFAULT NULL,
  UNIQUE KEY `roles_users_all_index` (`user_id`,`role_id`),
  KEY `role_id` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `static_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) NOT NULL DEFAULT '',
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `static_permissions_title_index` (`title`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `status_histories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `time` int(11) DEFAULT NULL,
  `key` varchar(255) DEFAULT NULL,
  `value` float NOT NULL,
  PRIMARY KEY (`id`),
  KEY `index_status_histories_on_time_and_key` (`time`,`key`),
  KEY `index_status_histories_on_key` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `status_messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `message` text,
  `user_id` int(11) DEFAULT NULL,
  `severity` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `taggings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `taggable_id` int(11) DEFAULT NULL,
  `taggable_type` varchar(255) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `taggings_taggable_id_index` (`taggable_id`,`taggable_type`,`tag_id`,`user_id`),
  KEY `index_taggings_on_taggable_type` (`taggable_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `tags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tags_name_unique_index` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `updateinfo_counter` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `maintenance_db_project_id` int(11) DEFAULT NULL,
  `day` int(11) DEFAULT NULL,
  `month` int(11) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

CREATE TABLE `user_registrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `token` text NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_registrations_user_id_index` (`user_id`),
  KEY `user_registrations_expires_at_index` (`expires_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `last_logged_in_at` datetime DEFAULT NULL,
  `login_failure_count` int(11) NOT NULL DEFAULT '0',
  `login` tinyblob NOT NULL,
  `email` varchar(200) NOT NULL DEFAULT '',
  `realname` varchar(200) NOT NULL DEFAULT '',
  `password` varchar(100) NOT NULL DEFAULT '',
  `password_hash_type` varchar(20) NOT NULL DEFAULT '',
  `password_salt` varchar(10) NOT NULL DEFAULT '1234512345',
  `password_crypted` varchar(64) DEFAULT NULL,
  `state` int(11) NOT NULL DEFAULT '1',
  `adminnote` text,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_login_index` (`login`(255)),
  KEY `users_password_index` (`password`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `watched_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bs_user_id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(100) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `watched_projects_users_fk_1` (`bs_user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

INSERT INTO schema_migrations (version) VALUES ('1');

INSERT INTO schema_migrations (version) VALUES ('10');

INSERT INTO schema_migrations (version) VALUES ('11');

INSERT INTO schema_migrations (version) VALUES ('12');

INSERT INTO schema_migrations (version) VALUES ('13');

INSERT INTO schema_migrations (version) VALUES ('14');

INSERT INTO schema_migrations (version) VALUES ('15');

INSERT INTO schema_migrations (version) VALUES ('16');

INSERT INTO schema_migrations (version) VALUES ('17');

INSERT INTO schema_migrations (version) VALUES ('18');

INSERT INTO schema_migrations (version) VALUES ('19');

INSERT INTO schema_migrations (version) VALUES ('2');

INSERT INTO schema_migrations (version) VALUES ('20');

INSERT INTO schema_migrations (version) VALUES ('20090701125033');

INSERT INTO schema_migrations (version) VALUES ('20090703100900');

INSERT INTO schema_migrations (version) VALUES ('20090716174522');

INSERT INTO schema_migrations (version) VALUES ('20090717114240');

INSERT INTO schema_migrations (version) VALUES ('20091017210000');

INSERT INTO schema_migrations (version) VALUES ('20091022210000');

INSERT INTO schema_migrations (version) VALUES ('20091022310000');

INSERT INTO schema_migrations (version) VALUES ('20091029100000');

INSERT INTO schema_migrations (version) VALUES ('20091030060000');

INSERT INTO schema_migrations (version) VALUES ('20091102060000');

INSERT INTO schema_migrations (version) VALUES ('20091111191005');

INSERT INTO schema_migrations (version) VALUES ('20091115101346');

INSERT INTO schema_migrations (version) VALUES ('20091117144409');

INSERT INTO schema_migrations (version) VALUES ('20091117152223');

INSERT INTO schema_migrations (version) VALUES ('20091118000000');

INSERT INTO schema_migrations (version) VALUES ('20091119000000');

INSERT INTO schema_migrations (version) VALUES ('20091119090108');

INSERT INTO schema_migrations (version) VALUES ('20091119090620');

INSERT INTO schema_migrations (version) VALUES ('20091124194151');

INSERT INTO schema_migrations (version) VALUES ('20091206194902');

INSERT INTO schema_migrations (version) VALUES ('20091209193452');

INSERT INTO schema_migrations (version) VALUES ('20091209211754');

INSERT INTO schema_migrations (version) VALUES ('20091226112028');

INSERT INTO schema_migrations (version) VALUES ('20091229115736');

INSERT INTO schema_migrations (version) VALUES ('20100102150000');

INSERT INTO schema_migrations (version) VALUES ('20100104170000');

INSERT INTO schema_migrations (version) VALUES ('20100109145739');

INSERT INTO schema_migrations (version) VALUES ('20100125100000');

INSERT INTO schema_migrations (version) VALUES ('20100202132416');

INSERT INTO schema_migrations (version) VALUES ('20100302100000');

INSERT INTO schema_migrations (version) VALUES ('20100304100000');

INSERT INTO schema_migrations (version) VALUES ('20100315100000');

INSERT INTO schema_migrations (version) VALUES ('20100316100000');

INSERT INTO schema_migrations (version) VALUES ('20100316100001');

INSERT INTO schema_migrations (version) VALUES ('20100327100000');

INSERT INTO schema_migrations (version) VALUES ('20100329191407');

INSERT INTO schema_migrations (version) VALUES ('20100423144748');

INSERT INTO schema_migrations (version) VALUES ('20100426144748');

INSERT INTO schema_migrations (version) VALUES ('20100428144748');

INSERT INTO schema_migrations (version) VALUES ('20100429144748');

INSERT INTO schema_migrations (version) VALUES ('20100506115929');

INSERT INTO schema_migrations (version) VALUES ('20100507115929');

INSERT INTO schema_migrations (version) VALUES ('20100530180617');

INSERT INTO schema_migrations (version) VALUES ('20100609100000');

INSERT INTO schema_migrations (version) VALUES ('20100609200000');

INSERT INTO schema_migrations (version) VALUES ('20100614121047');

INSERT INTO schema_migrations (version) VALUES ('20100629095208');

INSERT INTO schema_migrations (version) VALUES ('20100702082339');

INSERT INTO schema_migrations (version) VALUES ('20100705124948');

INSERT INTO schema_migrations (version) VALUES ('20100705133839');

INSERT INTO schema_migrations (version) VALUES ('20100705141045');

INSERT INTO schema_migrations (version) VALUES ('20100707061034');

INSERT INTO schema_migrations (version) VALUES ('20100805100000');

INSERT INTO schema_migrations (version) VALUES ('20100812100000');

INSERT INTO schema_migrations (version) VALUES ('20100827100000');

INSERT INTO schema_migrations (version) VALUES ('20100903100000');

INSERT INTO schema_migrations (version) VALUES ('20100927110821');

INSERT INTO schema_migrations (version) VALUES ('20100927132716');

INSERT INTO schema_migrations (version) VALUES ('20100927133955');

INSERT INTO schema_migrations (version) VALUES ('20100928081344');

INSERT INTO schema_migrations (version) VALUES ('20101110100000');

INSERT INTO schema_migrations (version) VALUES ('20110117000000');

INSERT INTO schema_migrations (version) VALUES ('20110131100000');

INSERT INTO schema_migrations (version) VALUES ('20110202100000');

INSERT INTO schema_migrations (version) VALUES ('20110202110000');

INSERT INTO schema_migrations (version) VALUES ('20110302100000');

INSERT INTO schema_migrations (version) VALUES ('20110303100000');

INSERT INTO schema_migrations (version) VALUES ('20110309100000');

INSERT INTO schema_migrations (version) VALUES ('20110318112742');

INSERT INTO schema_migrations (version) VALUES ('20110321000000');

INSERT INTO schema_migrations (version) VALUES ('20110322000000');

INSERT INTO schema_migrations (version) VALUES ('20110323000000');

INSERT INTO schema_migrations (version) VALUES ('2011033000000');

INSERT INTO schema_migrations (version) VALUES ('20110331001200');

INSERT INTO schema_migrations (version) VALUES ('20110404085232');

INSERT INTO schema_migrations (version) VALUES ('20110404085325');

INSERT INTO schema_migrations (version) VALUES ('20110404090700');

INSERT INTO schema_migrations (version) VALUES ('20110405151201');

INSERT INTO schema_migrations (version) VALUES ('20110502100000');

INSERT INTO schema_migrations (version) VALUES ('21');

INSERT INTO schema_migrations (version) VALUES ('22');

INSERT INTO schema_migrations (version) VALUES ('23');

INSERT INTO schema_migrations (version) VALUES ('24');

INSERT INTO schema_migrations (version) VALUES ('25');

INSERT INTO schema_migrations (version) VALUES ('26');

INSERT INTO schema_migrations (version) VALUES ('27');

INSERT INTO schema_migrations (version) VALUES ('28');

INSERT INTO schema_migrations (version) VALUES ('29');

INSERT INTO schema_migrations (version) VALUES ('3');

INSERT INTO schema_migrations (version) VALUES ('30');

INSERT INTO schema_migrations (version) VALUES ('31');

INSERT INTO schema_migrations (version) VALUES ('32');

INSERT INTO schema_migrations (version) VALUES ('33');

INSERT INTO schema_migrations (version) VALUES ('34');

INSERT INTO schema_migrations (version) VALUES ('35');

INSERT INTO schema_migrations (version) VALUES ('36');

INSERT INTO schema_migrations (version) VALUES ('37');

INSERT INTO schema_migrations (version) VALUES ('38');

INSERT INTO schema_migrations (version) VALUES ('39');

INSERT INTO schema_migrations (version) VALUES ('4');

INSERT INTO schema_migrations (version) VALUES ('40');

INSERT INTO schema_migrations (version) VALUES ('41');

INSERT INTO schema_migrations (version) VALUES ('42');

INSERT INTO schema_migrations (version) VALUES ('43');

INSERT INTO schema_migrations (version) VALUES ('44');

INSERT INTO schema_migrations (version) VALUES ('45');

INSERT INTO schema_migrations (version) VALUES ('46');

INSERT INTO schema_migrations (version) VALUES ('47');

INSERT INTO schema_migrations (version) VALUES ('48');

INSERT INTO schema_migrations (version) VALUES ('5');

INSERT INTO schema_migrations (version) VALUES ('6');

INSERT INTO schema_migrations (version) VALUES ('7');

INSERT INTO schema_migrations (version) VALUES ('8');

INSERT INTO schema_migrations (version) VALUES ('9');