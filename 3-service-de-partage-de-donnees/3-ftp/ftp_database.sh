
#!/bin/bash

DROP DATABASE if exists pureftpd;
CREATE DATABASE pureftpd;
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON pureftpd.* TO 'pureftpd'@'localhost' IDENTIFIED BY 'ftpdpass';
GRANT SELECT, INSERT, UPDATE, DELETE, CREATE, DROP ON pureftpd.* TO 'pureftpd'@'localhost.localdomain' IDENTIFIED BY 'ftpdpass';
FLUSH PRIVILEGES;

USE pureftpd;

CREATE TABLE ftpd (
	user varchar(16) NOT NULL default '',
	status enum('0','1') NOT NULL default '0',
	password varchar(64) NOT NULL default '',
	Uid varchar(11) NOT NULL default '-1',
	Gid varchar(11) NOT NULL default '-1',
	Dir varchar(128) NOT NULL default '',
	ULBandwidth smallint(5) NOT NULL default '0',
	DLBandwidth smallint(5) NOT NULL default '0',
	comment tinytext NOT NULL,
	ipaccess varchar(15) NOT NULL default '*',
	QuotaSize smallint(5) NOT NULL default '0',
	QuotaFiles int(11) NOT NULL default 0,
	PRIMARY KEY (user),
	UNIQUE KEY user (user)
)

quit;