-- ----------------------------------------------------------------
-- gpsSeasonDrivers
-- ----------------------------------------------------------------
drop table if exists gpsSeasonDrivers;

create table gpsSeasonDrivers as
select d.driverId, d.driverRef, s.year, d.forename, d.surname,
       d.number as permanentNumber,
       d.code, d.dob, co.name as country, co.flag as countryFlag, co.code as countryCode,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 1) as wins,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position in (1,2,3)) as podiums,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position between 1 and 10) as topTen,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 2) as position2,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 3) as position3,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 4) as position4,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 5) as position5,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 6) as position6,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 7) as position7,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 8) as position8,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 9) as position9,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 10) as position10,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and grid = 1) as poles,
       (select round(sum(points), 2) from gpsRaceResults r where r.driverId = d.driverId and year = s.year) as points,
       s.driverAchievablePoints as achievablePoints,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and points > 0) as finishedInPoints,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and `rank` = 1) as fastestLaps,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year) as participations,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position is not null) as racesFinished,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position is null and grid > 0) as didNotFinish,
       (select count(1) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position is null and grid = 0) as didNotStart,
       (select min(r.date) from gpsRaceResults r where r.driverId = d.driverId and year = s.year) as firstRace,
       (select max(r.date) from gpsRaceResults r where r.driverId = d.driverId and year = s.year) as lastRace,
       (select min(r.date) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 1) as firstWin,
       (select max(r.date) from gpsRaceResults r where r.driverId = d.driverId and year = s.year and position = 1) as lastWin,
       (select position from gpsDriverStandings ds where ds.driverId = d.driverId and year = s.year) as standingsPosition,
       (select count(1) from gpsDriverStandings ds where ds.driverId = d.driverId and position = 1 and year = s.year) as championships,
       (select count(1) from gpsDriverStandings ds where ds.driverId = d.driverId and position = 2 and year = s.year) as subChampionships,
       (select constructorRef from gpsDriverConstructors dc where dc.driverRef = d.driverRef and year = s.year order by races desc limit 0,1) as mainConstructorRef
  from gpsSeasons s
  join drivers d
  join gpsNationalities na on d.nationality = na.name
  join gpsCountries co on na.code = co.code
 where d.driverId in (select distinct driverId from gpsRaceResults where year = s.year);

alter table gpsSeasonDrivers add primary key (driverId, year);
alter table gpsSeasonDrivers add unique index (driverRef, year);
