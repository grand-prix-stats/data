-- ----------------------------------------------------------------
-- gpsLapTimes
-- ----------------------------------------------------------------
drop table if exists gpsLapTimes;

create table gpsLapTimes as
select (select year from gpsRaces where raceId = l.raceId) as year,
       (select round from gpsRaces where raceId = l.raceId) as round,
       (select driverRef from gpsDrivers where driverId = l.driverId) as driverRef,
       l.*,
-- from lapTimes l;
       (select milliseconds from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopMilliseconds,
       (select stop from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopNumber
  from lapTimes l;

alter table gpsLapTimes add primary key (raceId, driverId, lap);
alter table gpsLapTimes add unique index (year, round, driverId, lap);
alter table gpsLapTimes add index (driverId);
alter table gpsLapTimes add index (driverRef);
alter table gpsLapTimes add index (lap);
alter table gpsLapTimes add index lapPosition (raceId, lap, position);

alter table gpsLapTimes add column accruedMilliseconds int after milliseconds;
alter table gpsLapTimes add column lapLeader int after accruedMilliseconds;
alter table gpsLapTimes add column lapLeaderMilliseconds int after lapLeader;
alter table gpsLapTimes add column lapLeaderAccruedMilliseconds int after lapLeaderMilliseconds;
alter table gpsLapTimes add column millisecondsBehindLeader int after lapLeaderAccruedMilliseconds;
alter table gpsLapTimes add column accruedMillisecondsBehindLeader int after millisecondsBehindLeader;
alter table gpsLapTimes add column averageLapMilliseconds int after accruedMillisecondsBehindLeader;
alter table gpsLapTimes add column averageLapAccruedMilliseconds int after averageLapMilliseconds;
alter table gpsLapTimes add column millisecondsFromAverageLap int after averageLapMilliseconds;
alter table gpsLapTimes add column accruedMillisecondsFromAverageLap int after millisecondsFromAverageLap;
-- alter table gpsLapTimes add column pitstopMilliseconds int after millisecondsBehindLeader;
-- alter table gpsLapTimes add column pitstopNumber int after pitstopMilliseconds;

update gpsLapTimes l
   set accruedMilliseconds = (select sum(milliseconds) from lapTimes where raceId = l.raceId and driverId = l.driverId and lap <= l.lap);

update gpsLapTimes l
   set lapLeader = (select driverId from lapTimes where raceId = l.raceId and lap = l.lap and position = 1),
       lapLeaderMilliseconds = (select milliseconds from lapTimes where raceId = l.raceId and lap = l.lap and position = 1);

update gpsLapTimes l
  join gpsLapTimes l2 on l2.raceId = l.raceId and l2.lap = l.lap and l2.driverId = l.lapLeader
   set l.lapLeaderAccruedMilliseconds = l2.accruedMilliseconds,
       l.millisecondsBehindLeader = l2.milliseconds - l.milliseconds,
       l.accruedMillisecondsBehindLeader = l2.accruedMilliseconds - l.accruedMilliseconds;

update gpsLapTimes l
  join gpsRaces r on r.raceId = l.raceId
   set l.averageLapMilliseconds = r.raceMillisPerLap,
       l.averageLapAccruedMilliseconds = r.raceMillisPerLap * l.lap;

update gpsLapTimes l
   set l.millisecondsFromAverageLap = l.averageLapMilliseconds - l.milliseconds,
       l.accruedMillisecondsFromAverageLap = l.averageLapAccruedMilliseconds - l.accruedMilliseconds;

-- update gpsLapTimes l
--   join pitstops p on p.raceId = l.raceId and p.driverId = l.driverId and p.lap = l.lap
--    set l.pitstopMilliseconds = p.milliseconds,
--        l.pitstopNumber = p.stop;

-- ----------------------------------------------
-- Long query, takes about 1250 secs, instead of <100 sec above
-- create table gpsLapTimes as
-- select (select raceRef from gpsRaces where raceId = l.raceId) as raceRef,
--        (select driverRef from gpsDrivers where driverId = l.driverId) as driverRef,
--        l.*,
--        @accruedMilliseconds := (select sum(milliseconds) from lapTimes where raceId = l.raceId and driverId = l.driverId and lap <= l.lap) as accruedMilliseconds,
--        @lapLeader := (select driverId from lapTimes where raceId = l.raceId and lap = l.lap and position = 1) as lapLeader,
--        @lapLeaderAccruedMilliseconds := (select sum(milliseconds) from lapTimes where raceId = l.raceId and driverId = @lapLeader and lap <= l.lap) as lapLeaderAccruedMilliseconds,
--        convert(@lapLeaderAccruedMilliseconds - @accruedMilliseconds, signed) as millisecondsBehindLeader,
--        (select milliseconds from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopMilliseconds,
--        (select stop from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopNumber
--   from lapTimes l;
