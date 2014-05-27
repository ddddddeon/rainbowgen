DROP DATABASE IF NOT EXISTS rainbow;
CREATE DATABASE rainbow;
USE rainbow;
CREATE TABLE rainbow (
id INT(12) NOT NULL AUTO_INCREMENT,
password VARCHAR(64) NOT NULL,
md5hash VARCHAR(32) NOT NULL,
sha1hash VARCHAR(40) NOT NULL, PRIMARY KEY ("id") );
LOCK TABLES rainbow WRITE;
INSERT INTO rainbow (password, md5hash, sha1hash) VALUES
('foo', 'acbd18db4cc2f85cedef654fccc4a4d8', '0beec7b5ea3f0fdbc95d0dd47f3c5bc275da8a33'),
('bar', '37b51d194a7513e45b56f6524f2d51f2', '62cdb7020ff920e5aa642c3d4066950dd1f01f4d'),
('baz', '73feffa4b7f6bb68e44cf984c85f6e88', 'bbe960a25ea311d21d40669e93df2003ba9b90a2'),
('quux', '9fb045bba26522b2a50bb3e7a06ae30d', 'ae2ad9454f3af7fcb18c83969f99b20a788eddd1'),
('deon', 'fad445d574f4843f5af0cf7ffb2cea2c', '08ed6225093e68c2d490224bf56b9a2a673f92da'),
('doesn''t', '59a7709f7ee8c9dadf75615cbe4a79cf', '3090d78152a3e621d5e445916ba15d50c674da30'),
('give', 'a1ec23e9b9ab43a88222d9949ee26499', 'fa9f22e62229ac79ecee117c88192ee717a9e178'),
('two', 'b8a9f715dbb64fd5c56e7783c6820a61', 'ad782ecdac770fc6eb9a62e44f90873fb97fb26b'),
('fuux', '24eca770b7812a28014ce3c893648136', '75dfad1221164b49029a676e7eaa34632f9687b4'),
('end of table'), ('insert statement automated by'), ('deon');
UNLOCK TABLES;