
DROP TABLE IF EXISTS `gpsPictures`;

CREATE TABLE `gpsPictures` (
    `pictureId` int(11) NOT NULL AUTO_INCREMENT,
    `pictureUrl` varchar(255) NOT NULL,
    `copyright` varchar(255) NULL,
    `sourceUrl` varchar(255) NULL,
    `constructorRef` varchar(255) NULL,
    `carRef` varchar(255) NULL,
    `driverRef` varchar(255) NULL,
    `raceRef` varchar(255) NULL,
    `circuitRef` varchar(255) NULL,
    PRIMARY KEY (`pictureId`),
    UNIQUE KEY `pictureUrl` (`pictureUrl`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;


INSERT INTO `gpsPictures` 
(`pictureId`, `pictureUrl`, `copyright`, `sourceUrl`, `constructorRef`, `carRef`, `driverRef`, `raceRef`, `circuitRef`) 
VALUES 
('1', 'https://www.grandprixstats.org/media/images/Marcus_Ericsson_2016_Malaysia_FP2_1.jpg', 'CC BY-SA 4.0', 'https://en.wikipedia.org/wiki/Sauber_C35#/media/File:Marcus_Ericsson_2016_Malaysia_FP2_1.jpg', 'sauber', 'sauber_c35', 'ericsson', NULL, 'sepang');