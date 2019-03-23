-- ----------------------------------------------------------------
-- gpsConstructorStandings
-- ----------------------------------------------------------------
drop table if exists gpsConstructorStandings;

create table gpsConstructorStandings as
select c.constructorRef, cs.*, r.year, r.round, r.date
  from constructorStandings cs, races r, gpsSeasons sr, constructors c
 where cs.raceId = r.raceId and r.year = sr.year and r.round = sr.rounds
   and cs.constructorId = c.constructorId;

alter table gpsConstructorStandings add primary key (constructorStandingsId);
alter table gpsConstructorStandings add unique index (constructorId, year);
alter table gpsConstructorStandings add unique index (constructorRef, year);
alter table gpsConstructorStandings add index (constructorId);
alter table gpsConstructorStandings add index (constructorRef);
alter table gpsConstructorStandings add index (position);
alter table gpsConstructorStandings add index (constructorId, position);
