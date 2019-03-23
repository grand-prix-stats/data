-- ----------------------------------------------------------------
-- gpsDriverStandings
-- ----------------------------------------------------------------
drop table if exists gpsDriverStandings;

create table gpsDriverStandings as
select d.driverRef, ds.*, r.year, r.round, r.date
  from driverStandings ds, races r, gpsSeasons sr, drivers d
 where ds.raceId = r.raceId and r.year = sr.year and r.round = sr.rounds
   and ds.driverId = d.driverId;

alter table gpsDriverStandings add primary key (driverStandingsId);
alter table gpsDriverStandings add unique index driverIdyear (driverId, year);
alter table gpsDriverStandings add unique index driverRefyear (driverRef, year);
alter table gpsDriverStandings add index (driverId);
alter table gpsDriverStandings add index (raceId);
alter table gpsDriverStandings add index (position);
alter table gpsDriverStandings add unique index driverRace (driverId, raceId);
alter table gpsDriverStandings add index (driverId, position);
