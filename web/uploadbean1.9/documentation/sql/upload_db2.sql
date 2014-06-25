-- **---------------------------------------------------------------**
-- ** Creates DB2 table for TESTER user to store binary files       **
-- **                                                               **
-- ** UploadBean/DB2 7.2 sample script.                             **
-- ** http://www.javazoom.net/jzservlets/uploadbean/uploadbean.html **
-- ** Copyright JavaZOOM 1999-2003.                                 **
-- **---------------------------------------------------------------**
-- drop table TESTER.UPLOADS;

create table TESTER.UPLOADS (
  UPLOADID INT NOT NULL, 
  FILENAME varchar(255) NOT NULL,
  BINARYFILE blob(100M) NOT NULL,
  primary key(UPLOADID));
