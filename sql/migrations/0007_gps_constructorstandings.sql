-- ----------------------------------------------------------------
-- gpsConstructorStandings
-- This table stores one entry per constructor per race (season + year)
-- ----------------------------------------------------------------
drop table if exists gpsConstructorStandings;

create table gpsConstructorStandings as
select c.constructorId, c.constructorRef, r.raceId, r.year, r.round, r.date,
       co.name as country, co.flag as countryFlag, co.code as countryCode,
       cs.points, cs.position, cs.positionText, cs.wins
  from constructorStandings cs
  join races r on cs.raceId = r.raceId
  join gpsSeasons sr on r.year = sr.year
  join constructors c on cs.constructorId = c.constructorId
  join gpsNationalities na on c.nationality = na.name
  join gpsCountries co on na.code = co.code;

alter table gpsConstructorStandings add primary key (constructorId, year, round);
alter table gpsConstructorStandings add unique index constructorRefYear (constructorRef, year, round);
alter table gpsConstructorStandings add index (constructorId);
alter table gpsConstructorStandings add index (constructorRef);
alter table gpsConstructorStandings add index (position);
alter table gpsConstructorStandings add unique index constructorRaceYear (constructorId, raceId);
alter table gpsConstructorStandings add index (constructorId, position);
