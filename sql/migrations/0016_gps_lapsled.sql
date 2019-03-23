-- ----------------------------------------------------------------
-- gpsLapsLed
-- ----------------------------------------------------------------
drop table if exists gpsLapsLed;

create table gpsLapsLed as
select r.raceId, r.year, r.round, d.driverId, d.driverRef,
       (select constructorId from gpsRaceResults where raceId = r.raceId and driverId = l.driverId) as constructorId,
       (select constructorRef from gpsRaceResults where raceId = r.raceId and driverId = l.driverId) as constructorRef,
       count(1) as lapsled,
       (select laps from results r where r.raceId = l.raceId and position = 1) as laps
  from lapTimes l
  join drivers d on l.driverId = d.driverId
  join races r on r.raceId = l.raceId
 where position = 1
 group by l.raceId, l.driverId;

alter table gpsLapsLed add primary key (raceId, driverId);
alter table gpsLapsLed add unique index (year, round, driverId);
alter table gpsLapsLed add index (driverId);
alter table gpsLapsLed add index (driverRef);
alter table gpsLapsLed add index (constructorId);
alter table gpsLapsLed add index (constructorRef);
