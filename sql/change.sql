SET FOREIGN_KEY_CHECKS=0;

CREATE TABLE `newmerger`.`announcement`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `title` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '标题',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '内容',
  `author` int(11) NULL DEFAULT 0 COMMENT '创建人',
  `user_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '0' COMMENT '接收人',
  `type` tinyint(1) NOT NULL DEFAULT 1 COMMENT '类型 1系统(手动） 2智能(自动)',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '创建时间',
  `modify_time` int(11) NOT NULL DEFAULT 0 COMMENT '修改时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(1开启 0关闭)',
  `scenes_id` int(11) NULL DEFAULT 0 COMMENT '赛事ID',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统公告表' ROW_FORMAT = DYNAMIC;

CREATE TABLE `newmerger`.`announcement_log`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `announcement_id` int(11) NOT NULL COMMENT '公告id',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户id',
  `create_time` int(11) NOT NULL DEFAULT 0 COMMENT '发布时间',
  `modify_time` int(11) NULL DEFAULT 0 COMMENT '阅读时间',
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态(1已读 0未读)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统公告日志表' ROW_FORMAT = DYNAMIC;


ALTER TABLE `newmerger`.`attacker_user` ADD COLUMN `match_id` int(11) NULL DEFAULT NULL COMMENT '赛项id' AFTER `attacker_ip`;


ALTER TABLE `newmerger`.`autoexploit_container` DROP INDEX `attack_ip`;

ALTER TABLE `newmerger`.`autoexploit_container` DROP COLUMN `attack_ip`;

ALTER TABLE `newmerger`.`autoexploit_event` ADD COLUMN `visible` tinyint(1) NULL DEFAULT NULL COMMENT '是否可见' AFTER `process`;

ALTER TABLE `newmerger`.`autoexploit_event` MODIFY COLUMN `use_session` tinyint(1) NOT NULL COMMENT '是否设置代理' AFTER `is_close`;

ALTER TABLE `newmerger`.`autoexploit_event` MODIFY COLUMN `use_proxy` tinyint(1) NOT NULL COMMENT '是否使用代理' AFTER `use_session`;

ALTER TABLE `newmerger`.`autoexploit_event` MODIFY COLUMN `screenshot` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否截屏' AFTER `use_proxy`;

ALTER TABLE `newmerger`.`autoexploit_host` DROP INDEX `attack_ip`;

ALTER TABLE `newmerger`.`autoexploit_host` DROP INDEX `IP`;

ALTER TABLE `newmerger`.`autoexploit_host` DROP COLUMN `attack_ip`;

ALTER TABLE `newmerger`.`autoexploit_host` ADD UNIQUE INDEX `task_id,IP`(`IP`, `task_id`) USING BTREE;

ALTER TABLE `newmerger`.`autoexploit_policy` MODIFY COLUMN `desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '简介' AFTER `type`;

ALTER TABLE `newmerger`.`autoexploit_policyflow` MODIFY COLUMN `afterEvent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '后置事件，关联事件表' AFTER `id`;

ALTER TABLE `newmerger`.`autoexploit_policyflow` MODIFY COLUMN `belongPolicy_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '关联攻击链表' AFTER `afterEvent_id`;

ALTER TABLE `newmerger`.`autoexploit_policyflow` MODIFY COLUMN `foreEvent_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '前置事件，关联事件表' AFTER `belongPolicy_id`;

ALTER TABLE `newmerger`.`autoexploit_task` MODIFY COLUMN `id` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'UUID' FIRST;

ALTER TABLE `newmerger`.`autoexploit_task` MODIFY COLUMN `docker_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `report_type`;

ALTER TABLE `newmerger`.`autoexploit_tool` ADD COLUMN `checker` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '审核者' AFTER `author`;

ALTER TABLE `newmerger`.`autoexploit_tool` ADD COLUMN `visible` tinyint(1) NOT NULL DEFAULT 1 COMMENT '是否课件' AFTER `imageID`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `image` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '镜像地址' AFTER `name`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `version` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '镜像版本' AFTER `image`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `status` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '状态' AFTER `dockerFile`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `desc` longtext CHARACTER SET utf8 COLLATE utf8_general_ci NULL AFTER `checker`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `shellPro` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '镜像Shell' AFTER `visible`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `createTime` datetime NULL DEFAULT NULL COMMENT '创建时间' AFTER `cmdPro`;

ALTER TABLE `newmerger`.`autoexploit_tool` MODIFY COLUMN `size` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '镜像大小' AFTER `createTime`;


ALTER TABLE `newmerger`.`bps_spider_exploit` MODIFY COLUMN `exploit_file_local_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '文件' AFTER `spider_last_modified_date`;


ALTER TABLE `newmerger`.`cloud_docker` ADD COLUMN `match_id` int(11) NULL DEFAULT 1 COMMENT '赛项id' AFTER `shellinabox_url`;

ALTER TABLE `newmerger`.`cloud_docker` DROP COLUMN `module_id`;



ALTER TABLE `newmerger`.`cloud_vmdisk_flag` ADD COLUMN `match_id` int(11) NULL DEFAULT NULL COMMENT '赛项id' AFTER `scenes_id`;

ALTER TABLE `newmerger`.`cloud_vmdisk_flag` MODIFY COLUMN `flag` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'flag答案' AFTER `id`;

ALTER TABLE `newmerger`.`cloud_vmdisk_flag` DROP COLUMN `score_decrease`;

ALTER TABLE `newmerger`.`cloud_vmdisk_flag` DROP COLUMN `team_id`;

ALTER TABLE `newmerger`.`cloud_vmdisk_net` ADD COLUMN `match_id` int(11) NOT NULL DEFAULT 0 COMMENT '赛项id' AFTER `status`;

ALTER TABLE `newmerger`.`cloud_vmdisk_net` MODIFY COLUMN `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '名称' AFTER `id`;

ALTER TABLE `newmerger`.`cloud_vmdisk_net` MODIFY COLUMN `topo_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '网络拓扑图路径' AFTER `virtual_switch_num`;

ALTER TABLE `newmerger`.`cloud_vmdisk_net_range` MODIFY COLUMN `vmdisk_id` int(11) NOT NULL DEFAULT 0 COMMENT '虚拟机模板id cloud_vmdisk.id' AFTER `vmdisk_net_id`;

ALTER TABLE `newmerger`.`cloud_vmdisk_status` COMMENT = '主从节点镜像同步';

ALTER TABLE `newmerger`.`cloud_vmsummary` DROP INDEX `name`;

ALTER TABLE `newmerger`.`cloud_vmsummary` ADD COLUMN `create_time` int(11) NOT NULL DEFAULT 0 AFTER `public_network_ip`;

ALTER TABLE `newmerger`.`cloud_vmsummary` ADD COLUMN `update_time` int(11) NOT NULL DEFAULT 0 AFTER `create_time`;

ALTER TABLE `newmerger`.`cloud_vmsummary` ADD COLUMN `device_status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL AFTER `update_time`;

ALTER TABLE `newmerger`.`cloud_vmsummary` MODIFY COLUMN `ip_addr` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'IP地址' FIRST;

ALTER TABLE `newmerger`.`cloud_vmsummary` MODIFY COLUMN `status` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT 'running' COMMENT '状态： running:  上线 ，stop: 下线' AFTER `weight`;

ALTER TABLE `newmerger`.`cloud_vmsummary` MODIFY COLUMN `public_network_ip` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '公网ip' AFTER `cur_running_num_docker`;

ALTER TABLE `newmerger`.`cloud_vmsummary` DROP COLUMN `name`;

ALTER TABLE `newmerger`.`cloud_vmsummary` ADD UNIQUE INDEX `ip_addr_unique`(`ip_addr`) USING BTREE;

ALTER TABLE `newmerger`.`cloud_vmtotal` ADD COLUMN `team_id` int(11) NOT NULL DEFAULT 0 COMMENT '战队id' AFTER `user_id`;

ALTER TABLE `newmerger`.`cloud_vmtotal` ADD COLUMN `match_id` int(11) NULL DEFAULT NULL COMMENT '赛项id' AFTER `spice_port`;

ALTER TABLE `newmerger`.`cloud_vmtotal` MODIFY COLUMN `address` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '节点地址（虚拟机启动节点）' AFTER `id`;

ALTER TABLE `newmerger`.`cloud_vmtotal` MODIFY COLUMN `system_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '系统名' AFTER `nicnum`;

ALTER TABLE `newmerger`.`cloud_vmtotal` MODIFY COLUMN `disk_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'vmdisk name' AFTER `system_name`;

ALTER TABLE `newmerger`.`cloud_vmtotal` MODIFY COLUMN `course_code` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '课程code' AFTER `team_id`;


ALTER TABLE `newmerger`.`course_collection` DROP INDEX `sync_unique_code`;

ALTER TABLE `newmerger`.`course_collection` ADD INDEX `sync_unique_code`(`sync_unique_code`) USING BTREE;

CREATE TABLE `newmerger`.`drill_monitor_model`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `drill_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务ID',
  `monitor_models` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '设备名称',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `created_at` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 52 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户与设备绑定表' ROW_FORMAT = DYNAMIC;


ALTER TABLE `newmerger`.`exam` DROP COLUMN `question`;

CREATE TABLE `newmerger`.`exam_rel_question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `exam_id` int(11) NOT NULL DEFAULT 0 COMMENT '试卷id',
  `question_id` int(11) NOT NULL DEFAULT 0 COMMENT '题目id',
  `question_type` int(2) NOT NULL COMMENT '题目类型',
  `sort` int(11) NOT NULL DEFAULT 0 COMMENT '题目排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 71 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '试卷关联试题表，附带试题排序，试题类型' ROW_FORMAT = Dynamic;


ALTER TABLE `newmerger`.`flag_submit_file` MODIFY COLUMN `file` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `id`;

ALTER TABLE `newmerger`.`flag_submit_file` MODIFY COLUMN `filename` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `file`;

ALTER TABLE `newmerger`.`flag_submit_file` MODIFY COLUMN `match_id` int(11) NOT NULL COMMENT '赛项ID' AFTER `filename`;

ALTER TABLE `newmerger`.`flag_submit_file` MODIFY COLUMN `level_id` int(11) NOT NULL DEFAULT 0 COMMENT '关卡ID' AFTER `match_id`;

ALTER TABLE `newmerger`.`flag_submit_file` MODIFY COLUMN `user_id` int(11) NOT NULL COMMENT '创建人ID' AFTER `level_id`;

ALTER TABLE `newmerger`.`flag_submit_file` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`, `type`) USING BTREE;


ALTER TABLE `newmerger`.`gf_docker_vlan` ADD COLUMN `question_id` int(11) NULL DEFAULT NULL COMMENT '题目id' AFTER `match_level_id`;

ALTER TABLE `newmerger`.`gf_docker_vlan` ADD COLUMN `match_id` int(10) NOT NULL COMMENT '赛项id' AFTER `vlan`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `match_level_id` int(11) NULL DEFAULT NULL COMMENT '关卡id' AFTER `id`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `is_permeate` tinyint(1) NULL DEFAULT 0 COMMENT '0容器，1渗透机，2虚拟机' AFTER `question_id`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `image_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'docker镜像name' AFTER `is_permeate`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `docker_name` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '容器名' AFTER `image_name`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `vlan` int(6) UNSIGNED NOT NULL DEFAULT 0 AFTER `docker_name`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `team_id` int(11) NULL DEFAULT 0 COMMENT '团队id' AFTER `mac`;

ALTER TABLE `newmerger`.`gf_docker_vlan` MODIFY COLUMN `user_id` int(10) UNSIGNED NULL DEFAULT 0 COMMENT '用户id' AFTER `team_id`;

ALTER TABLE `newmerger`.`gf_docker_vlan` ADD INDEX `match_id`(`match_id`) USING BTREE;


ALTER TABLE `newmerger`.`gf_ipuser` DROP INDEX `user_id`;

ALTER TABLE `newmerger`.`gf_ipuser` ADD COLUMN `match_id` int(11) NOT NULL DEFAULT 0 COMMENT '赛项id' AFTER `address_ip`;

ALTER TABLE `newmerger`.`gf_ipuser` MODIFY COLUMN `team_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '战队id' AFTER `id`;

ALTER TABLE `newmerger`.`gf_ipuser` MODIFY COLUMN `ip` varchar(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `team_id`;

ALTER TABLE `newmerger`.`gf_ipuser` MODIFY COLUMN `type` int(2) NOT NULL DEFAULT 0 COMMENT '靶标状态：1 默认状态，2，已修复，3:已攻陷' AFTER `ip`;

ALTER TABLE `newmerger`.`gf_ipuser` MODIFY COLUMN `vm_id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '兼容虚拟机模板id及容器镜像id' AFTER `type`;

ALTER TABLE `newmerger`.`gf_ipuser` MODIFY COLUMN `mac` char(128) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `vlan`;

ALTER TABLE `newmerger`.`gf_ipuser` MODIFY COLUMN `address_ip` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '计算节点ip' AFTER `vm_type`;

ALTER TABLE `newmerger`.`gf_ipuser` DROP PRIMARY KEY, ADD PRIMARY KEY (`id`, `ip`) USING HASH;

ALTER TABLE `newmerger`.`gf_ipuser` DROP COLUMN `user_id`;


ALTER TABLE `newmerger`.`gf_match_level` ADD COLUMN `user_id` int(10) NOT NULL COMMENT '创建用户' AFTER `addtime`;

ALTER TABLE `newmerger`.`gf_match_level` ADD COLUMN `match_id` int(10) NOT NULL DEFAULT 0 COMMENT '赛项id' AFTER `user_id`;

ALTER TABLE `newmerger`.`gf_match_level` MODIFY COLUMN `active` tinyint(1) NOT NULL DEFAULT 1 COMMENT '关卡题型   ctf1,  理论2' AFTER `title`;

ALTER TABLE `newmerger`.`gf_match_level` MODIFY COLUMN `min_score` int(11) NULL DEFAULT 0 COMMENT '共享制下最低得分' AFTER `scenes_id`;

ALTER TABLE `newmerger`.`gf_match_level` MODIFY COLUMN `addtime` int(10) NOT NULL DEFAULT 0 COMMENT '添加时间' AFTER `min_score`;

ALTER TABLE `newmerger`.`gf_match_level` DROP COLUMN `question_order`;


ALTER TABLE `newmerger`.`gf_match_level_question` DROP INDEX `theory_question_id`;

ALTER TABLE `newmerger`.`gf_match_level_question` ADD COLUMN `id` int(11) NOT NULL AFTER `question_id`;

ALTER TABLE `newmerger`.`gf_match_level_question` MODIFY COLUMN `match_level_id` int(10) NOT NULL DEFAULT 0 COMMENT 'gf_match_level.id 关卡id' FIRST;

ALTER TABLE `newmerger`.`gf_match_level_question` MODIFY COLUMN `question_id` int(10) NOT NULL DEFAULT 0 COMMENT 'question.id 试题id' AFTER `match_level_id`;

ALTER TABLE `newmerger`.`gf_match_level_question` DROP PRIMARY KEY;

ALTER TABLE `newmerger`.`gf_match_level_question` ADD PRIMARY KEY (`id`) USING BTREE;

ALTER TABLE `newmerger`.`gf_match_level_question` MODIFY COLUMN `id` int(11) NOT NULL AUTO_INCREMENT;

ALTER TABLE `newmerger`.`gf_match_level_question` DROP COLUMN `question_order`;

ALTER TABLE `newmerger`.`gf_match_level_question` DROP COLUMN `theory_question_id`;


CREATE TABLE `newmerger`.`gf_match_user`  (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `match_id` int(10) NOT NULL DEFAULT 0 COMMENT '比赛id',
  `user_id` int(10) NOT NULL DEFAULT 0 COMMENT '用户id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '赛项关联用户表' ROW_FORMAT = DYNAMIC;


ALTER TABLE `newmerger`.`gf_matches` DROP INDEX `pid`;

ALTER TABLE `newmerger`.`gf_matches` DROP INDEX `game_form`;

ALTER TABLE `newmerger`.`gf_matches` ADD COLUMN `is_deployed` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 未部署  1 部署中  2 部署成功  3 部署失败' AFTER `created_at`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `module_id` tinyint(3) NOT NULL DEFAULT 0 COMMENT '赛项类型，1夺旗，4攻防兼备，3网络靶场' AFTER `match_name`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `init_score` int(10) NULL DEFAULT 0 COMMENT '用户初始分' AFTER `endtime`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `logo_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '大赛前台logo' AFTER `init_score`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '状态，0 禁用，1 启用' AFTER `logo_path`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `reward_one` int(3) NULL DEFAULT 0 COMMENT '奖励制第一名' AFTER `is_reward`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `reward_two` int(3) NULL DEFAULT 0 COMMENT '奖励制第二名' AFTER `reward_one`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `reward_three` int(3) NULL DEFAULT 0 COMMENT '奖励制第三名' AFTER `reward_two`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `is_shared` tinyint(1) NULL DEFAULT 1 COMMENT '是否开启共享制' AFTER `reward_three`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `is_anti` tinyint(1) NULL DEFAULT 1 COMMENT '是否开启反作弊机制' AFTER `is_shared`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `anti_rate` int(3) NULL DEFAULT 50 COMMENT '反作弊扣除分数比例' AFTER `is_anti`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `switch_time` int(11) NULL DEFAULT 0 COMMENT '模式切换时间（个人CTF）' AFTER `anti_rate`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `prestige_start` int(11) NULL DEFAULT 0 COMMENT '从第几题开始放题' AFTER `switch_time`;

ALTER TABLE `newmerger`.`gf_matches` MODIFY COLUMN `prestige_end` int(11) NULL DEFAULT 0 COMMENT '放到第几题' AFTER `prestige_start`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `pid`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `sys_dept_id`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `invitation_code`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `invitation_status`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `connection_url`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `connection_status`;

ALTER TABLE `newmerger`.`gf_matches` DROP COLUMN `game_form`;


ALTER TABLE `newmerger`.`gf_question` ADD COLUMN `question_mode` int(2) NOT NULL DEFAULT 2 COMMENT '题目模式，1附件，2虚拟机，默认虚拟机' AFTER `question_desc`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `question` varchar(1000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '考题' AFTER `id`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `answer` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '答案' AFTER `attach_type`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '录入人' AFTER `answer`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `hardlevel` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '难易程度' AFTER `createtime`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `gf_question_type` int(10) NOT NULL DEFAULT 1 COMMENT '攻防题目类型：\n\n[\'MISC\', \'CRYPTO\', \'REVERSE\', \'STEGA\', \'WEB\', \'PPC\', \'PWN\']\n\n1综合2密码学3逆向4隐写5web6编程7溢出' AFTER `answerdetail`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `gf_vmdisk_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'cloud_vmdisk.name关联的模板名' AFTER `gf_question_type`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `image_id` int(11) NOT NULL DEFAULT 0 COMMENT '关联docker镜像id' AFTER `gf_vmdisk_name`;

ALTER TABLE `newmerger`.`gf_question` MODIFY COLUMN `image_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `image_id`;

ALTER TABLE `newmerger`.`gf_question` DROP COLUMN `questiontype`;

ALTER TABLE `newmerger`.`gf_question` DROP COLUMN `score`;


ALTER TABLE `newmerger`.`gf_race` ADD COLUMN `logo_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `logo`;


ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '场景名称' AFTER `id`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `topo_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '场景拓扑地址' AFTER `rule`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `info_path` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '场景信息地址' AFTER `topo_path`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `module_id` tinyint(3) NULL DEFAULT 0 COMMENT '所属模块Id' AFTER `info_path`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `vm_env` tinyint(1) NULL DEFAULT 2 COMMENT '场景环境 独享0,共享1,在线2' AFTER `module_id`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `vm_env_close_way` tinyint(1) NULL DEFAULT 0 COMMENT '单兵在线模式靶机关闭方式:1不关闭虚拟靶机 2关闭虚拟靶机  ' AFTER `vm_env`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `is_show_answer` int(10) NULL DEFAULT 0 COMMENT '是否显示答案 单兵' AFTER `docker_ids`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `is_team` tinyint(1) NULL DEFAULT 0 COMMENT '0个人1团队；只针对个人CTF' AFTER `is_show_answer`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `is_show_grade` tinyint(1) NULL DEFAULT 1 COMMENT '是否显示成绩' AFTER `is_team`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `is_online` tinyint(1) NULL DEFAULT 0 COMMENT '0：线下 1：线上' AFTER `is_show_grade`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `is_quarantine` tinyint(1) NULL DEFAULT 0 COMMENT '0：隔离 1：互通' AFTER `is_online`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' AFTER `is_quarantine`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `user_id` int(11) NOT NULL DEFAULT 0 AFTER `username`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `appid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '场景标识' AFTER `user_id`;

ALTER TABLE `newmerger`.`gf_scenes` MODIFY COLUMN `created_at` int(11) NOT NULL COMMENT '创建时间' AFTER `is_src`;

ALTER TABLE `newmerger`.`gf_scenes` DROP COLUMN `group_id`;

ALTER TABLE `newmerger`.`gf_score_awd` ADD COLUMN `status` int(1) NULL DEFAULT 1 COMMENT '状态(1正常0无效)' AFTER `reason`;

ALTER TABLE `newmerger`.`gf_score_awd` MODIFY COLUMN `score_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '1 初始分' AFTER `sub_number`;


ALTER TABLE `newmerger`.`gf_score_log` DROP INDEX `theory_question_id`;

ALTER TABLE `newmerger`.`gf_score_log` MODIFY COLUMN `answer` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '当answer为空时为用户正在答题' AFTER `user_id`;

ALTER TABLE `newmerger`.`gf_score_log` MODIFY COLUMN `submit_time` int(11) NOT NULL DEFAULT 0 COMMENT '提交时间' AFTER `score`;

ALTER TABLE `newmerger`.`gf_score_log` MODIFY COLUMN `score_type` tinyint(1) NOT NULL DEFAULT 0 COMMENT '成绩类型，0为提交答案   1后台加分   2后台减分    3初始分   4提交答案扣分   5禁赛扣分' AFTER `team_id`;

ALTER TABLE `newmerger`.`gf_score_log` DROP COLUMN `theory_question_id`;


ALTER TABLE `newmerger`.`gf_team` DROP COLUMN `sort`;

ALTER TABLE `newmerger`.`gf_team_score` DROP INDEX `team_id`;

ALTER TABLE `newmerger`.`gf_team_score` MODIFY COLUMN `team_id` int(11) NOT NULL COMMENT '战队ID' AFTER `id`;

ALTER TABLE `newmerger`.`gf_team_score` ADD INDEX `team_id`(`team_id`) USING BTREE;


ALTER TABLE `newmerger`.`gf_vmip` ROW_FORMAT = DYNAMIC;

ALTER TABLE `newmerger`.`gf_vmip` ADD COLUMN `match_id` int(11) NULL DEFAULT NULL COMMENT '赛项id' AFTER `is_insulate`;

ALTER TABLE `newmerger`.`gf_vmip` ADD COLUMN `team_id` int(11) NULL DEFAULT NULL COMMENT '战队id' AFTER `match_id`;

ALTER TABLE `newmerger`.`gf_vmip` MODIFY COLUMN `vm_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT 'vmdisk表id' AFTER `mac`;

ALTER TABLE `newmerger`.`gf_vmip` MODIFY COLUMN `sh_de_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'shooting_deployment表id' AFTER `vm_id`;


ALTER TABLE `newmerger`.`k8s_image` ENGINE = InnoDB;

ALTER TABLE `newmerger`.`k8s_image` DROP INDEX `ftype_id`;

ALTER TABLE `newmerger`.`k8s_image` DROP INDEX `secondtype_id`;

ALTER TABLE `newmerger`.`k8s_image` MODIFY COLUMN `sync` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '同步的唯一标识 唯一的' AFTER `port`;

ALTER TABLE `newmerger`.`k8s_image` DROP COLUMN `imageID`;

ALTER TABLE `newmerger`.`k8s_image` DROP COLUMN `has_vnc`;

ALTER TABLE `newmerger`.`k8s_image` DROP COLUMN `ftype_id`;

ALTER TABLE `newmerger`.`k8s_image` DROP COLUMN `secondtype_id`;


ALTER TABLE `newmerger`.`shooting_deployment` ADD COLUMN `match_id` int(11) NULL DEFAULT NULL AFTER `id`;

ALTER TABLE `newmerger`.`shooting_deployment` MODIFY COLUMN `user_id` varchar(256) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '0' AFTER `team_id`;

ALTER TABLE `newmerger`.`tool` DROP INDEX `classid`;

ALTER TABLE `newmerger`.`tool` ADD COLUMN `tool_desc` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '说明' AFTER `name`;

ALTER TABLE `newmerger`.`tool` ADD COLUMN `tool_img` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '工具图片' AFTER `tool_desc`;

ALTER TABLE `newmerger`.`tool` ADD COLUMN `class_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT '分类id' AFTER `tool_img`;

ALTER TABLE `newmerger`.`tool` ADD COLUMN `filepath` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT '' COMMENT '工具全路径' AFTER `status`;

ALTER TABLE `newmerger`.`tool` ADD COLUMN `user_id` int(11) NOT NULL DEFAULT 0 COMMENT '用户' AFTER `create_time`;

ALTER TABLE `newmerger`.`tool` DROP COLUMN `classid`;

ALTER TABLE `newmerger`.`tool` DROP COLUMN `code`;

ALTER TABLE `newmerger`.`tool` DROP COLUMN `url`;

ALTER TABLE `newmerger`.`tool` DROP COLUMN `synopsis`;

ALTER TABLE `newmerger`.`tool` DROP COLUMN `explain`;

ALTER TABLE `newmerger`.`tool` ADD UNIQUE INDEX `name`(`name`) USING BTREE;

ALTER TABLE `newmerger`.`tool` ADD INDEX `classid`(`class_id`) USING BTREE;

ALTER TABLE `newmerger`.`tool_class` ADD COLUMN `user_id` int(11) NULL DEFAULT 0 COMMENT '创建人' AFTER `status`;

ALTER TABLE `newmerger`.`tool_class` ADD COLUMN `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间' AFTER `user_id`;

ALTER TABLE `newmerger`.`tool_class` DROP COLUMN `code`;

CREATE TABLE `newmerger`.`tool_comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tools_id` int(11) NOT NULL COMMENT '工具id',
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户名称',
  `content` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL COMMENT '留言内容',
  `create_time` int(11) NULL DEFAULT NULL COMMENT '创建时间',
  `status` int(4) NOT NULL DEFAULT 1 COMMENT '1：审核通过 2：审核不通过 3：审核中',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户对工具评论' ROW_FORMAT = DYNAMIC;

CREATE TABLE `newmerger`.`tool_download_praise`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户id',
  `user_name` varchar(200) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `tools_id` int(11) NOT NULL COMMENT '工具id',
  `type` tinyint(2) NULL DEFAULT NULL COMMENT '1点赞2下载',
  `create_time` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `tools_id`(`tools_id`) USING BTREE,
  INDEX `type`(`type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '工具点赞下载' ROW_FORMAT = DYNAMIC;


ALTER TABLE `newmerger`.`user` DROP INDEX `dept_id`;

ALTER TABLE `newmerger`.`user` DROP INDEX `teamId`;

ALTER TABLE `newmerger`.`user` DROP INDEX `type_ncr`;

ALTER TABLE `newmerger`.`user` DROP INDEX `type_race`;

ALTER TABLE `newmerger`.`user` MODIFY COLUMN `org_id` int(5) NOT NULL DEFAULT 0 COMMENT '班级ID' AFTER `id`;

ALTER TABLE `newmerger`.`user` MODIFY COLUMN `sex` tinyint(1) NOT NULL DEFAULT 0 COMMENT '性别 1-男 2-女 0-保密' AFTER `official_code`;

ALTER TABLE `newmerger`.`user` MODIFY COLUMN `mac` varchar(2000) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT 'mac地址  存json' AFTER `thumbnail`;

ALTER TABLE `newmerger`.`user` DROP COLUMN `dept_id`;

ALTER TABLE `newmerger`.`user` DROP COLUMN `teamId`;

ALTER TABLE `newmerger`.`user` DROP COLUMN `type_ncr`;

ALTER TABLE `newmerger`.`user` DROP COLUMN `type_race`;

DROP TABLE IF EXISTS `newmerger`.`transcript`;

SET FOREIGN_KEY_CHECKS=1;