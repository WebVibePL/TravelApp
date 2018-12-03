INSERT INTO `Travel`.`Users`
(`UserID`,`Email`,`Password`,`FirstName`,`LastName`,`BankAccountNumber`)
VALUES
(1,"a123@cos.pl","a123","a1","b2","12345678901234567890123456"),
(2,"b123@cos.pl","b123","b1","b2","12345678901234567890123456"),
(3,"c123@cos.pl","c123","c1","b2","12345678901234567890123456"),
(4,"d123@cos.pl","d123","d1","b2","12345678901234567890123456"),
(5,"e123@cos.pl","e123","e1","b2","12345678901234567890123456"),
(6,"f123@cos.pl","f123","f1","b2","12345678901234567890123456"),
(7,"g123@cos.pl","g123","g1","b2","12345678901234567890123456"),
(8,"h123@cos.pl","h123","h1","b2","12345678901234567890123456")
;

INSERT INTO `Travel`.`Status`
(`StatusID`,`StatusName`)
VALUES
(1,"Aktywny"),
(2,"Nieaktywny nierozliczony"),
(3,"Nieaktywny rozliczony")
;

INSERT INTO `Travel`.`Travels`
(`TravelID`,`Name`,`DateFrom`,`DateTo`,`AddressCity`,`AddressPostCode`,`AddressStreet`,`AddressHouseFlatNumber`,`PlaceName`,`StatusID`)
VALUES
(1,"Travel1","2018-01-01","2018-01-10","City1","11-111","Street1","1/1","PlaceName1",1),
(2,"Travel2","2018-02-01","2018-02-10","City2","22-222","Street2","2/2","PlaceName2",2),
(3,"Travel3","2018-03-01","2018-03-10","City3","33-333","Street3","3/3","PlaceName3",3),
(4,"Travel4","2018-04-01","2018-04-10","City4","44-444","Street4","4/4","PlaceName4",1)
;

INSERT INTO `Travel`.`TravelMembers`
(`TravelMembersID`,`TravelID`,`UserID`,`IsOwner`)
VALUES
(1,1,1,1),
(2,1,2,0),
(3,1,3,0),
(4,2,4,1),
(5,2,5,0),
(6,2,6,0),
(7,3,1,1),
(8,3,4,0),
(9,3,6,0),
(10,4,7,1),
(11,4,8,1),
(12,4,1,0)
;
