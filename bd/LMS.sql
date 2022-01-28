DROP DATABASE IF EXISTS `lms`;
CREATE DATABASE `lms`;
USE lms;

DROP TABLE IF EXISTS `typetool`;
CREATE TABLE `typetool` 
(
    `Type_Code` ENUM('BK_', 'CD_', 'RM_') PRIMARY KEY,
    `Element_Type` ENUM('BOOK', 'CD', 'RESEARCH MATERIAL') NOT NULL,
    `Exemplary_Number` INT(2) DEFAULT 0
);
INSERT INTO `typetool` (`Type_Code`, `Element_Type`) VALUES
('BK_', 'BOOK'),
('CD_', 'CD'),
('RM_', 'RESEARCH MATERIAL');

DROP TABLE IF EXISTS `typetab`;
CREATE TABLE `typetab` 
(
    `Id_Type` VARCHAR(8) PRIMARY KEY,
    `Type_Name` VARCHAR(30) NOT NULL,
    `Id_Element` ENUM('BK_', 'CD_', 'RM_') NOT NULL,
    `Exemplary_Number` INT(2) DEFAULT 0,
    FOREIGN KEY (`Id_Element`) REFERENCES `typetool` (`Type_Code`)
);
INSERT INTO `typetab` VALUES
('SC_','Sciences Physique', 'BK_', 0),
('SI_', 'Sciences informatique', 'BK_', 0),
('MU_', 'Musique', 'BK_', 0),
('MG_', 'Management', 'BK_', 0),
('PHILO_', 'Philosophie', 'BK_', 0),
('DRT_', 'Droit', 'BK_', 0);


DROP TABLE IF EXISTS `book`;
CREATE TABLE `book` 
(
    `Id_Book` VARCHAR(12) PRIMARY KEY,
    `Title` VARCHAR(50) NOT NULL,
    `Author` VARCHAR(50) NOT NULL,
    `Type` VARCHAR(8) NOT NULL,
    `Publication_Year`  INT(4) NOT NULL,
    `Status` ENUM('Exist', 'Not Exist')  DEFAULT 'Exist',
    FOREIGN KEY (`Type`) REFERENCES `typetab` (`Id_Type`)
);
INSERT INTO `book` VALUES
('SC_BK1', 'Physique Quantique', 'Rene Descarte', 'SC_', 1850, 3),
('SI_BK1', 'Apprendre Le Java', 'PAKA Biyo Dev', 'SI_', 2013, 5),
('MU_BK1', 'Le Piano Pour Tous', 'Nzambi Easy', 'MU_', 2011, 2),
('MG_BK1', 'Le Management Des Organisations', 'Isaac BANSIMBA', 'MG_', 2016, 7),
('SI_BK2', 'Informatique Bureautique', 'MALONGA Ruth', 'SI_', 2013, 9),
('DRT_BK1', 'Le Droit Des Obligations', 'EBOMB-SIMBA', 'DRT_', 2017, 1);

DROP TABLE IF EXISTS `book_stock`;
CREATE TABLE `book_stock` 
(
    `Id_Book_In_Stock` VARCHAR(12) PRIMARY KEY,
    `Stock` INT(2) NOT NULL,
    FOREIGN KEY (`Id_Book_In_Stock`) REFERENCES `book` (`Id_Book`)
);
INSERT INTO `book_stock` VALUES
('SC_BK1', 3),
('SI_BK1', 5),
('MU_BK1', 2),
('SI_BK2', 9),
('DRT_BK1', 1),
('MG_BK1', 7);

DROP TABLE IF EXISTS `exemplary`;
CREATE TABLE `exemplary` 
(
    `Id_Exemplary` VARCHAR(15) PRIMARY KEY,
    `Id_Book_Ex` VARCHAR(10) NOT NULL,
    `Availability` ENUM('Available', 'Unavailable') DEFAULT 'Available',
    FOREIGN KEY (`Id_Book_Ex`) REFERENCES `book_stock` (`Id_Book_In_Stock`)
);
INSERT INTO `exemplary` (`Id_Exemplary`, `Id_Book_Ex`) VALUES
('SC_BK1_EX01', 'SC_BK1'),
('SI_BK1_EX01', 'SI_BK1'),
('MG_BK1_EX01', 'MG_BK1'),
('MU_BK1_EX01', 'MU_BK1'),
('MU_BK1_EX02', 'MU_BK1'),
('MG_BK1_EX02', 'MG_BK1'),
('SC_BK1_EX02', 'SC_BK1'),
('SI_BK1_EX02', 'SI_BK1'),
('SI_BK1_EX03', 'SI_BK1'),
('SI_BK2_EX01', 'SI_BK2'),
('MG_BK1_EX03', 'MG_BK1'),
('MG_BK1_EX04', 'MG_BK1'),
('MG_BK1_EX05', 'MG_BK1'),
('MG_BK1_EX06', 'MG_BK1'),
('SI_BK2_EX02', 'SI_BK2'),
('DRT_BK1_EX01', 'DRT_BK1'),
('SI_BK1_EX04', 'SI_BK1'),
('SI_BK2_EX03', 'SI_BK2'),
('SC_BK1_EX03', 'SC_BK1'),
('SI_BK2_EX04', 'SI_BK2'),
('SI_BK2_EX05', 'SI_BK2'),
('SI_BK2_EX06', 'SI_BK2'),
('SI_BK1_EX05', 'SI_BK1'),
('SI_BK2_EX07', 'SI_BK2'),
('SI_BK2_EX08', 'SI_BK2'),
('MG_BK1_EX07', 'MG_BK1'),
('SI_BK2_EX09', 'SI_BK2');

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` 
(
    `Id_user` INT(1) PRIMARY KEY  DEFAULT 1,
    `First_name` VARCHAR(50) NOT NULL,
    `Last_name` VARCHAR(30) NOT NULL,
    `Username` VARCHAR(30) NOT NULL,
    `Password` CHAR(8) NOT NULL,
    `Birthdate` DATE,
    `Phone_number` VARCHAR(20) NOT NULL,
    `Address` VARCHAR(20) NOT NULL,
    `ProfilImg` TEXT
);

INSERT INTO `user` (`First_name`, `Last_name`, `Username`, `Password`,`Phone_number`, `Address`, `ProfilImg`) VALUES
('', '', 'Admin', 'admin', '', '', 'G:\\defaultProfil.png');

DROP TABLE IF EXISTS `member`;
CREATE TABLE `member` 
(
    `Id_Member` VARCHAR(5) PRIMARY KEY,
    `Member_Last_Name` VARCHAR(30) NOT NULL,
    `Member_First_Name` VARCHAR(50) NOT NULL,
    `Member_Leash` ENUM('ISN', 'CDN', 'INS') DEFAULT NULL,
    `Member_Sex` VARCHAR(15) NOT NULL,
    `Member_Nationality` VARCHAR(25) NOT NULL,
    `Member_Phone_number` VARCHAR(25) NOT NULL,
    `Member_Address` VARCHAR(25) NOT NULL,
    `Copies_Already_Borrowed` INT(1) DEFAULT 0,
    `Member_Img` TEXT,
    `Existence_Status` ENUM('Exist', 'Not Exist')  DEFAULT 'Exist'
);

INSERT INTO `member` (`Id_Member`, `Member_Last_Name`, `Member_First_Name`, `Member_Leash`, `Member_Sex`,`Member_Nationality`, `Member_Phone_number`, `Member_Address`, `Member_Img`) VALUES
('Ad_1', 'BINS', 'Joh', 'INS', 'Masculin', 'Congolaise', '654 78 52 11', 'Avembe', 'G:\\STI 122 ATELIERS DE PROGRAMMATION\\ProjetLMS\\libraryManagementSystem\\src\\img\\defaultProfil.png'),
('Ad_3', 'MAB', 'Bergin', 'ISN', 'Masculin', 'Congolaise', '685 12 28 01', 'Camp Chic', 'G:\\STI 122 ATELIERS DE PROGRAMMATION\\ProjetLMS\\libraryManagementSystem\\src\\img\\defaultProfil.png'),
('Ad_5', 'LOUB', 'Des', 'CDN', 'Feminin', 'Camerounaise', '682 45 18 22', 'Bacongo', 'G:\\STI 122 ATELIERS DE PROGRAMMATION\\ProjetLMS\\libraryManagementSystem\\src\\img\\defaultProfil.png'),
('Ad_4', 'SEMEDO', 'Joy', 'ISN', 'Masculin', 'Camerounaise', '694 71 25 17', 'Djoum', 'G:\\STI 122 ATELIERS DE PROGRAMMATION\\ProjetLMS\\libraryManagementSystem\\src\\img\\defaultProfil.png'),
('Ad_6', 'YOUG', 'Rams', 'CDN', 'Feminin', 'Congolaise', '245 08 56 42', 'Nkolguet', 'G:\\STI 122 ATELIERS DE PROGRAMMATION\\ProjetLMS\\libraryManagementSystem\\src\\img\\defaultProfil.png'),
('Ad_2', 'OKEMBA', 'Pichet', 'INS', 'Masculin', 'Congolaise', '689 52 78 95', 'Monavembe', 'G:\\STI 122 ATELIERS DE PROGRAMMATION\\ProjetLMS\\libraryManagementSystem\\src\\img\\defaultProfil.png');

DROP TABLE IF EXISTS `loan`;
CREATE TABLE `loan` 
(
    `Id_Member_Loan`  VARCHAR(5) NOT NULL,
    `Id_Book_Loan` VARCHAR(15) NOT NULL,
    `Id_Element_Loan`  VARCHAR(12) NOT NULL,
    `Element_Type_Loan`  ENUM('BK_', 'CD_', 'RM_') NOT NULL DEFAULT 'BK_',
    `Loan_Date` DATE NOT NULL,
    `Status_Loan` ENUM('Restored', 'Not Restored') DEFAULT 'Not Restored',
    FOREIGN KEY (`Id_Member_Loan`) REFERENCES `member` (`Id_Member`),
    FOREIGN KEY (`Id_Element_Loan`) REFERENCES `book` (`Id_Book`),
    FOREIGN KEY (`Id_Book_Loan`) REFERENCES `exemplary` (`Id_Exemplary`),
    FOREIGN KEY (`Element_Type_Loan`) REFERENCES `typetool` (`Type_Code`)
);

DROP TABLE IF EXISTS `loanhistory`;
CREATE TABLE `loanhistory` 
(
    `Member_Loan_Code`  VARCHAR(5) NOT NULL,
    `Book_Loan_Code` VARCHAR(15) NOT NULL,
    `Element_Loan_Code`  VARCHAR(12) NOT NULL,
    `Element_Loan`  ENUM('BK_', 'CD_', 'RM_') NOT NULL DEFAULT 'BK_',
    `Loan_Date` DATE NOT NULL,
    `Restore_Date` DATE NOT NULL,
    `Penality` VARCHAR(10) DEFAULT 'Aucune',
    FOREIGN KEY (`Member_Loan_Code`) REFERENCES `member` (`Id_Member`),
    FOREIGN KEY (`Element_Loan_Code`) REFERENCES `book` (`Id_Book`),
    FOREIGN KEY (`Book_Loan_Code`) REFERENCES `exemplary` (`Id_Exemplary`),
    FOREIGN KEY (`Element_Loan`) REFERENCES `typetool` (`Type_Code`)
);
/*
    #Have stock by book
    SELECT `Id_Book_Ex`, COUNT(`Id_Exemplary`) FROM `exemplary` GROUP BY `Id_Book_Ex`;
    select id_member,member_last_name,id_book_loan,title,element_type,loan_date from member,loan,book,typetool where member.id_member=loan.id_member_loan and book.id_book=loan.id_element_loan and loan.Element_Type_Loan=typetool.type_code;
    select distinct `Id_Book_Ex`, `stock` from exemplary,book_stock where exemplary.Id_Book_Ex=book_stock.Id_Book_In_Stock;


    SELECT SUM(stock) FROM book_stock;
    SELECT COUNT(Id_Exemplary) FROM exemplary;
*/