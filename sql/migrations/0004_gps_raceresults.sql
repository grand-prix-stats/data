-- ----------------------------------------------------------------
-- gpsRaceResults
-- ----------------------------------------------------------------
drop table if exists gpsRaceResults;

create table gpsRaceResults as
select ra.raceRef, ra.year, ra.round, ra.date, ra.time as raceTime,
       ra.circuitid, c.circuitRef,
       ra.countryCode, ra.country, ra.countryFlag,
       d.driverRef, co.constructorRef,
       r.*
  from gpsRaces ra
  join circuits c on ra.circuitid = c.circuitid
  left join results r on ra.raceId = r.raceId
  left join drivers d on d.driverId = r.driverId
  left join constructors co on co.constructorId = r.constructorId;

alter table gpsRaceResults add index raceresult (raceId, resultId);
alter table gpsRaceResults add index (raceRef);
alter table gpsRaceResults add index yearRound (year, round);
alter table gpsRaceResults add index (circuitid);
alter table gpsRaceResults add index (countryCode);
alter table gpsRaceResults add index (driverId);
alter table gpsRaceResults add index (driverRef);
alter table gpsRaceResults add index (constructorId);
alter table gpsRaceResults add index (constructorRef);
alter table gpsRaceResults add index (position);
alter table gpsRaceResults add index (positionOrder);
alter table gpsRaceResults add index (year, round, positionOrder);
