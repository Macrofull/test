DROP DATABASE IF EXISTS `uiecc`;
CREATE DATABASE `uiecc`;
USE uiecc;

DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` 
(
    `matricule` VARCHAR(15) PRIMARY KEY,
    `first_name` VARCHAR(100) NOT NULL,
    `last_name` VARCHAR(30) NOT NULL,
    `leash` ENUM('ISN', 'CDN', 'INS') NOT NULL,
    `grade` ENUM('LICENCE 1', 'LICENCE 2', 'LICENCE 3', 'MASTER 1', 'MASTER 2') NOT NULL,
    `Birthdate` DATE NOT NULL,
    `Phone_number` VARCHAR(20) NOT NULL,
    `Address` VARCHAR(20) NOT NULL,
    `ProfilImg` TEXT,
    `matricle_statut` INT(1) NOT NULL DEFAULT 0,
    `statut` INT(1) NOT NULL DEFAULT 1
);
INSERT INTO `student` VALUES
('20G60297', 'Anorsa Donchrist Jodas', 'BINSAMOU', 'ISN', 'LICENCE 2', '2000-06-01', '654484511', 'Nkolguet', 'rien', 0, 1),
('20G60341', 'Bergin', 'MABIALA', 'ISN', 'LICENCE 2', '1999-03-11', '689904578', 'Nkolguet', 'rien', 0, 1);

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `id` VARCHAR(10) PRIMARY KEY,
    `username`  VARCHAR(50) NOT NULL UNIQUE,
    `mail` VARCHAR(100) NOT NULL UNIQUE,
    `password` TEXT NOT NULL,
    `ip` VARCHAR(20) NOT NULL DEFAULT '192.168.0.0',
    `token` VARCHAR(255) NOT NULL DEFAULT 'f8f3444bbf375b7b0c036d906523552aca0302c10f62a917bd84c8333a99be8a9b6063b1fc985332881d20a9cd8faf656ae7ed64f67c8481009637fcbb14cca4',
    `date_inscription` DATETIME NOT NULL,
    `date_connexion` DATETIME NOT NULL,
    `statut` INT(1) NOT NULL DEFAULT 1,
    `role` ENUM('AD', 'ST', 'TC') NOT NULL DEFAULT 'ST'
);
INSERT INTO `user` (`id`, `username`, `mail`, `password`, `date_inscription`, `date_connexion`, `role`) VALUES
('AD_1', 'root', 'root@gmail.com', '$2y$12$rIRS7sZfxkeIl0g12P.3weIBXhnyTqdsI9ddoHUCV9J26MXc3F83C', '2022-01-08', '2022-01-08', 'AD');

DROP TABLE IF EXISTS `files`;
CREATE TABLE `files`
(
    `file_id` INT(5) PRIMARY KEY AUTO_INCREMENT,
    `label` VARCHAR(40),
    `file_type` ENUM('EMPLOI DE TEMPS', 'COURS', 'NOTES', 'COMMUNIQUE', 'DIVERS') NOT NULL DEFAULT 'EMPLOI DE TEMPS',
    `file_ext` ENUM('pdf', 'jpg', 'mp4') NOT NULL DEFAULT 'pdf',
    `file_url` VARCHAR(255) NOT NULL   
);
INSERT INTO `files` (`label`, `file_type`, `file_ext`, `file_url`) VALUES
('La sape', 'DIVERS', 'jpg', 'pdf/1.jpg'),
('Les sapeurs camerounais', 'DIVERS', 'jpg', 'pdf/2.jpg'),
('Etudiant de ENSP', 'DIVERS', 'jpg', 'pdf/3.jpg'),
('sendMail', 'DIVERS', 'pdf', 'pdf/sendMail.pdf'),
('EMPLOI DE TEMPS ISN SEMAINE 12', 'EMPLOI DE TEMPS', 'pdf', 'pdf/EMPLOI DE TEMPS ISN SEMAINE 12.pdf');