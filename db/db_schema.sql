CREATE DATABASE activity;
use activity


CREATE TABLE activity  (
 id bigint(20) NOT NULL auto_increment,
 name varchar(255) NOT NULL,
 description TEXT,
 creation_time datetime NOT NULL,
 creator_id bigint(20) NOT NULL,
 PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE user (
 id bigint(20) NOT NULL auto_increment,
 user_id varchar(255),
 first_name varchar(255),
 last_name varchar(255),
 email varchar(255),
 facebook_id varchar(255),
 PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE user_activity (
 row_id bigint(20) NOT NULL auto_increment,
 activity_id bigint(20) NOT NULL,
 user_id bigint(20) NOT NULL,
 status tinyint NOT NULL DEFAULT 0,
 PRIMARY KEY (row_id),
 FOREIGN KEY (activity_id) references activity(id),
 FOREIGN KEY (user_id) references user(id), 
 UNIQUE KEY user_activity_key (activity_id, user_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- user_activity.status column will be a enum code
-- 0 - responded
-- 1 - not_responded

CREATE TABLE topic (
 id bigint(20) NOT NULL auto_increment,
 name varchar(255) NOT NULL,
 description text, 
 type tinyint NOT NULL,
 activity_id bigint(20) NOT NULL,
 creator_id bigint(20) NOT NULL,
 creation_time datetime NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY (activity_id) references activity(id),
 FOREIGN KEY (creator_id) references user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- topic.type is a enum
-- 0 - what
-- 1 - when
-- 2 - where

CREATE TABLE topic_response (
 row_id bigint(20) NOT NULL auto_increment,
 topic_id bigint(20) NOT NULL,
 user_id bigint(20) NOT NULL,
 response varchar(255) NOT NULL,
 updated_time datetime NOT NULL,
 is_current boolean NOT NULL,
 PRIMARY KEY (row_id),
 FOREIGN KEY (topic_id) references topic(id),
 FOREIGN KEY (user_id) references user(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

	
-- CREATE TABLE user_settings (
-- ) ENGINE=InnoDB DEFAULT CHARSET=utf8;

