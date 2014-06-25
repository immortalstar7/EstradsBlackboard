REM **-----------------------------------------------------------------**
REM ** Creates oracle table to store binary files                      **
REM **                                                                 **
REM ** UploadBean/Oracle sample script.                                **
REM ** http://www.javazoom.net/jzservlets/uploadbean/uploadbean.html   **
REM ** Copyright JavaZOOM 1999-2005.                                   **
REM **-----------------------------------------------------------------**
REM DROP TABLE UPLOADS;
CREATE TABLE UPLOADS (
	UPLOADID INT NOT NULL, 
	FILENAME VARCHAR2(255), 
	BINARYFILE LONG RAW,
	PRIMARY KEY (UPLOADID)
);
