ALTER DATABASE  `schedule` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE  `block` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `block_comment` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `day` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `event` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `event_comment` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `label` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `notification` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `room` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `schedule` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `session` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `session_speakers` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `speaker` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `sponsor` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `track` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `user_account` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `user_authority` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
ALTER TABLE  `venue` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;

ALTER TABLE  `block_comment` CHANGE  `comment`  `comment` VARCHAR( 1024 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `block_comment` CHANGE  `email`  `email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `block_comment` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

ALTER TABLE  `event` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `event` CHANGE  `short_name`  `short_name` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `event` CHANGE  `username`  `username` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `event_comment` CHANGE  `comment`  `comment` VARCHAR( 1024 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `event_comment` CHANGE  `email`  `email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `event_comment` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

ALTER TABLE  `label` CHANGE  `name`  `name` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `notification` CHANGE  `message`  `message` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `notification` CHANGE  `status_message`  `status_message` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `notification` CHANGE  `status_title`  `status_title` VARCHAR( 128 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `notification` CHANGE  `title`  `title` VARCHAR( 128 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `room` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `speaker` CHANGE  `bio`  `bio` VARCHAR( 2048 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `speaker` CHANGE  `email`  `email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `speaker` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `speaker` CHANGE  `phone`  `phone` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `speaker` CHANGE  `web_site`  `web_site` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

ALTER TABLE  `session` CHANGE  `description`  `description` VARCHAR( 2048 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `session` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `sponsor` CHANGE  `company_name`  `company_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `sponsor` CHANGE  `contact_email`  `contact_email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `sponsor` CHANGE  `contact_name`  `contact_name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `sponsor` CHANGE  `contact_phone`  `contact_phone` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `sponsor` CHANGE  `web_site`  `web_site` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;

ALTER TABLE  `track` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `user_account` CHANGE  `email`  `email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `user_account` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `user_account` CHANGE  `password`  `password` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `user_account` CHANGE  `username`  `username` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `user_authority` CHANGE  `authority`  `authority` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `user_authority` CHANGE  `username`  `username` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;

ALTER TABLE  `venue` CHANGE  `address_1`  `address_1` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `address_2`  `address_2` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `city`  `city` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `email`  `email` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `name`  `name` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL;
ALTER TABLE  `venue` CHANGE  `phone`  `phone` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `state`  `state` VARCHAR( 2 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `web_site`  `web_site` VARCHAR( 255 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;
ALTER TABLE  `venue` CHANGE  `zip`  `zip` VARCHAR( 10 ) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL;


