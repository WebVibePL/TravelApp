USE `Travel`;
CREATE  OR REPLACE VIEW `TravelsActive` AS
SELECT `Travels`.`TravelID`,
    `Travels`.`Name`,
    `Travels`.`DateFrom`,
    `Travels`.`DateTo`,
    `Travels`.`AddressCity`,
    `Travels`.`AddressPostCode`,
    `Travels`.`AddressStreet`,
    `Travels`.`AddressHouseFlatNumber`,
    `Travels`.`PlaceName`
FROM `Travel`.`Travels`
WHERE `Travels`.`StatusID` = 1;

USE `Travel`;
CREATE  OR REPLACE VIEW `TravelsInactiveUncleared` AS
SELECT `Travels`.`TravelID`,
    `Travels`.`Name`,
    `Travels`.`DateFrom`,
    `Travels`.`DateTo`,
    `Travels`.`AddressCity`,
    `Travels`.`AddressPostCode`,
    `Travels`.`AddressStreet`,
    `Travels`.`AddressHouseFlatNumber`,
    `Travels`.`PlaceName`
FROM `Travel`.`Travels`
WHERE `Travels`.`StatusID` = 2;

USE `Travel`;
CREATE  OR REPLACE VIEW `TravelsInactiveCleared` AS
SELECT `Travels`.`TravelID`,
    `Travels`.`Name`,
    `Travels`.`DateFrom`,
    `Travels`.`DateTo`,
    `Travels`.`AddressCity`,
    `Travels`.`AddressPostCode`,
    `Travels`.`AddressStreet`,
    `Travels`.`AddressHouseFlatNumber`,
    `Travels`.`PlaceName`
FROM `Travel`.`Travels`
WHERE `Travels`.`StatusID` = 3;