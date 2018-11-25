-- ************************************** `Travel`.`Users`
CREATE TABLE `Travel`.`Users`
(
 `UserID` int NOT NULL ,
 `Login`  varchar(45) NOT NULL ,
PRIMARY KEY (`UserID`)
);

-- ************************************** `Travel`.`Status`
CREATE TABLE `Travel`.`Status`
(
 `StatusID`   smallint NOT NULL ,
 `StatusName` varchar(45) NOT NULL ,
PRIMARY KEY (`StatusID`)
);

-- ************************************** `Travel`.`UserInformation`
CREATE TABLE `Travel`.`UserInformation`
(
 `UserInformationID` int NOT NULL ,
 `UserID`            int NOT NULL ,
 `FirstName`         varchar(45) ,
 `LastName`          varchar(100) ,
 `BankAccountNumber` char(26) ,
 `Email`             varchar(100) NOT NULL ,
PRIMARY KEY (`UserInformationID`),
KEY `fkIdx_118` (`UserID`),
CONSTRAINT `FK_118` FOREIGN KEY `fkIdx_118` (`UserID`) REFERENCES `Travel`.`Users` (`UserID`)
);

-- ************************************** `Travel`.`Travels`
CREATE TABLE `Travel`.`Travels`
(
 `TravelID`               int NOT NULL ,
 `Name`                   varchar(100) NOT NULL ,
 `DateFrom`               datetime NOT NULL ,
 `DateTo`                 datetime NOT NULL ,
 `AddressCity`            varchar(100) NOT NULL ,
 `AddressPostCode`        char(5) NOT NULL ,
 `AddressStreet`          varchar(100) NOT NULL ,
 `AddressHouseFlatNumber` varchar(7) NOT NULL ,
 `PlaceName`              varchar(100) NOT NULL ,
 `StatusID`               smallint NOT NULL ,
PRIMARY KEY (`TravelID`),
KEY `fkIdx_172` (`StatusID`),
CONSTRAINT `FK_172` FOREIGN KEY `fkIdx_172` (`StatusID`) REFERENCES `Travel`.`Status` (`StatusID`)
);

-- ************************************** `Travel`.`TravelMembers`
CREATE TABLE `Travel`.`TravelMembers`
(
 `TravelMembersID` int NOT NULL ,
 `TravelID`        int NOT NULL ,
 `UserID`          int NOT NULL ,
 `IsOwner`         bit NOT NULL ,
PRIMARY KEY (`TravelMembersID`),
KEY `fkIdx_139` (`TravelID`),
CONSTRAINT `FK_139` FOREIGN KEY `fkIdx_139` (`TravelID`) REFERENCES `Travel`.`Travels` (`TravelID`),
KEY `fkIdx_163` (`UserID`),
CONSTRAINT `FK_163` FOREIGN KEY `fkIdx_163` (`UserID`) REFERENCES `Travel`.`Users` (`UserID`)
);