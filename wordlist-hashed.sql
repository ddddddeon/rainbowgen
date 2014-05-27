DROP DATABASE IF NOT EXISTS rainbow;
CREATE DATABASE rainbow;
USE rainbow;
CREATE TABLE rainbow (
id INT(12) NOT NULL AUTO_INCREMENT,
word VARCHAR(64) NOT NULL,
md5hash VARCHAR(32) NOT NULL,
sha1hash VARCHAR(40) NOT NULL, PRIMARY KEY ("id") );
LOCK TABLES rainbow WRITE;
INSERT INTO rainbow (word, md5hash, sha1hash) VALUES
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('-sql', '7acaf4e5de7544ba0d410cbd142a4fad', 'd8e87bbd8ab46503257a00cdcc10a6462f12ed18'),
('end of table!', 'insert statement automated by', 'ur boi d');
UNLOCK TABLES;