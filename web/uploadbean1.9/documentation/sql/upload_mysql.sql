# **-----------------------------------------------------------------**
# ** Creates MySQL table to store binary files                       **
# **                                                                 **
# ** UploadBean/MySQL sample script.                                 **
# ** http://www.javazoom.net/jzservlets/uploadbean/uploadbean.html   **
# ** Copyright JavaZOOM 1999-2005.                                   **
# **                                                                 **
# ** Set the variable below in your my.ini to allow > 1M blob size   **
# ** set-variable = max_allowed_packet=10M                           **
# **-----------------------------------------------------------------**
# DROP TABLE UPLOADS;
CREATE TABLE UPLOADS (
	UPLOADID INT NOT NULL, 
	FILENAME VARCHAR(255), 
	BINARYFILE LONGBLOB,
	PRIMARY KEY (UPLOADID)
);
