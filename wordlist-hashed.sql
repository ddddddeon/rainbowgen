DROP DATABASE IF NOT EXISTS rainbow;
CREATE DATABASE rainbow;
USE rainbow;
CREATE TABLE rainbow (
id INT(12) NOT NULL AUTO_INCREMENT,
word VARCHAR(64) NOT NULL,
md5hash VARCHAR(32) NOT NULL,
sha1hash VARCHAR(40) NOT NULL, PRIMARY KEY ("id") );
LOCK TABLES rainbow WRITE;
INSERT INTO rainbow (password, md5hash, sha1hash) VALUES
('chris', '6b34fe24ac2ff8103f6fce1f0da2ef57', '711c73f64afdce07b7e38039a96d2224209e9a6c'),
('is', 'a2a551a6458a8de22446cc76d639a9e9', 'b47f363e2b430c0647f14deea3eced9b0ef300ce'),
('kewl', 'a37c33cef3f61c82dd3fc9448ac471fa', '0c2491f395633dc0c12f3c63863a2802a5744899'),
('end of table'), ('insert statement automated by'), ('deon');
UNLOCK TABLES;
