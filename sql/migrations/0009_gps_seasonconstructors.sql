-- ----------------------------------------------------------------
-- gpsSeasonConstructors
-- ----------------------------------------------------------------
drop table if exists gpsSeasonConstructors;

create table gpsSeasonConstructors as
select c.constructorId, c.constructorRef, s.year, c.name,
       co.name as country, co.flag as countryFlag, co.code as countryCode,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 1) as wins,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position in (1,2,3)) as podiums,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position between 1 and 10) as topTen,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 2) as position2,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 3) as position3,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 4) as position4,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 5) as position5,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 6) as position6,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 7) as position7,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 8) as position8,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 9) as position9,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 10) as position10,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and grid = 1) as poles,
       (select round(sum(points), 2) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year) as points,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and points > 0) as finishedInPoints,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and `rank` = 1) as fastestLaps,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year) as participations,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position is not null) as racesFinished,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position is null and grid > 0) as didNotFinish,
       (select count(1) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position is null and grid = 0) as didNotStart,
       (select min(r.date) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year) as firstRace,
       (select max(r.date) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year) as lastRace,
       (select min(r.date) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 1) as firstWin,
       (select max(r.date) from gpsRaceResults r where r.constructorId = c.constructorId and year = s.year and position = 1) as lastWin,
       (select position from gpsConstructorStandings ds where ds.constructorId = c.constructorId and year = s.year) as standingsPosition,
       (select count(1) from gpsConstructorStandings ds where ds.constructorId = c.constructorId and position = 1 and year = s.year) as championships,
       (select count(1) from gpsConstructorStandings ds where ds.constructorId = c.constructorId and position = 2 and year = s.year) as subChampionships
  from seasons s
  join constructors c
  join gpsNationalities na on c.nationality = na.name
  join gpsCountries co on na.code = co.code
 where c.constructorId in (select distinct constructorId from gpsRaceResults where year = s.year);

alter table gpsSeasonConstructors add primary key (constructorId, year);
alter table gpsSeasonConstructors add unique index (constructorRef, year);
