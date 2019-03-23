
DROP TABLE IF EXISTS `gpsCars`;

CREATE TABLE `gpsCars` (
    `carId` int(11) NOT NULL AUTO_INCREMENT,
    `carRef` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `constructorRef` varchar(255) NOT NULL,
    `year` int(11) NOT NULL,
    `engineName` varchar(255) NULL,
    `engineCC` float NULL,
    `engineCylinders` varchar(255) NULL,
    `url` varchar(255) NULL,
    PRIMARY KEY (`carId`),
    UNIQUE KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `gpsCars` 
(`carId`, `carRef`, `name`, `constructorRef`, `year`, `engineName`, `engineCC`, `engineCylinders`, `url`) 
VALUES 
('1', 'simtek_s941', 'Simtek S941', 'simtek', '1994', 'Ford HBD 6 3.5 V8', '3500', 'V8', 'https://en.wikipedia.org/wiki/Simtek_S941'),
('2', 'sauber_c35', 'Sauber C35', 'sauber', '2016', NULL, NULL, NULL, 'https://en.wikipedia.org/wiki/Sauber_C35');