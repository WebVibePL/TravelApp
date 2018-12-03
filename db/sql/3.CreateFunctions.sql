SET GLOBAL log_bin_trust_function_creators = 1;

USE `Travel`;
DROP FUNCTION IF EXISTS `CheckUserExists`;

DELIMITER $$
USE `Travel`$$
CREATE FUNCTION `CheckUserExists` (email varchar(100))
RETURNS BIT
BEGIN

declare exist int;
set exist = IF (exists(select * from Users where Users.Email = email),1,0);

RETURN exist;
END$$
DELIMITER ;

USE `Travel`;
DROP FUNCTION IF EXISTS `GetUserPassword`;

DELIMITER $$
USE `Travel`$$
CREATE FUNCTION `GetUserPassword` (UserID int)
RETURNS varchar(500)
BEGIN

RETURN (
	SELECT `Users`.`Password`
	FROM `Travel`.`Users`
	WHERE `Users`.`UserID` = UserID);

END$$
DELIMITER ;

USE `Travel`;
DROP FUNCTION IF EXISTS `GetUserEmail`;

DELIMITER $$
USE `Travel`$$
CREATE FUNCTION `GetUserEmail` (Email int)
RETURNS varchar(500)
BEGIN

RETURN (
	SELECT `Users`.`Email`
	FROM `Travel`.`Users`
	WHERE `Users`.`UserID` = UserID);

END$$
DELIMITER ;

USE `Travel`;
DROP PROCEDURE IF EXISTS `GetUserInfo`;

DELIMITER $$
USE `Travel`$$
CREATE PROCEDURE `GetUserInfo` (UserID int)
BEGIN

SELECT `Users`.`Email`,
    `Users`.`Password`,
    `Users`.`FirstName`,
    `Users`.`LastName`,
    `Users`.`BankAccountNumber`
FROM `Travel`.`Users`
WHERE `Users`.`UserID` = UserID;

END$$
DELIMITER ;

USE `Travel`;
DROP PROCEDURE IF EXISTS `GetAllUserTravelsInfo`;

DELIMITER $$
USE `Travel`$$
CREATE PROCEDURE `GetAllUserTravelsInfo` (UserID int)
BEGIN

SELECT `Travels`.`TravelID`,
    `Travels`.`Name`,
    `Travels`.`DateFrom`,
    `Travels`.`DateTo`,
    `Travels`.`AddressCity`,
    `Travels`.`AddressPostCode`,
    `Travels`.`AddressStreet`,
    `Travels`.`AddressHouseFlatNumber`,
    `Travels`.`PlaceName`,
    `Travels`.`StatusID`,
    `TravelMembers`.`IsOwner`
FROM `Travel`.`Travels`
INNER JOIN `Travel`.`TravelMembers` ON `TravelMembers`.`TravelID` = `Travels`.`TravelID`
INNER JOIN `Travel`.`Users`
	ON `TravelMembers`.`UserID` = `Users`.`UserID`
WHERE `Users`.`UserID` = UserID;

END$$
DELIMITER ;