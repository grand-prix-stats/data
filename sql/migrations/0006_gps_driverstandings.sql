-- ----------------------------------------------------------------
-- gpsDriverStandings
-- This table stores one entry per driver per race (season + year)
-- ----------------------------------------------------------------
drop table if exists gpsDriverStandings;

create table gpsDriverStandings as
select d.driverId, d.driverRef, r.raceId, r.raceRef, r.year, r.round, r.date,
       co.name as country, co.flag as countryFlag, co.code as countryCode,
       ds.points, ds.position, ds.positionText, ds.wins       
  from driverStandings ds
  join gpsRaces r on ds.raceId = r.raceId
  join gpsSeasons sr on r.year = sr.year
  join drivers d on ds.driverId = d.driverId
  join gpsNationalities na on d.nationality = na.name
  join gpsCountries co on na.code = co.code;

alter table gpsDriverStandings add primary key (driverId, year, round);
alter table gpsDriverStandings add unique index driverRefYear (driverRef, year, round);
alter table gpsDriverStandings add index (driverId);
alter table gpsDriverStandings add index (raceId);
alter table gpsDriverStandings add index (position);
alter table gpsDriverStandings add unique index driverRaceYear (driverId, raceId);
alter table gpsDriverStandings add index (driverId, position);
