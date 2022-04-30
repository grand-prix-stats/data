-- ----------------------------------------------------------------
-- gpsLapTimes
-- ----------------------------------------------------------------
drop table if exists gpsLapTimes;

create table gpsLapTimes as
select (select year from gpsRaces where raceId = l.raceId) as year,
       (select round from gpsRaces where raceId = l.raceId) as round,
       (select driverRef from gpsDrivers where driverId = l.driverId) as driverRef,
       l.*,
       (select milliseconds from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopMilliseconds,
       (select stop from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopNumber
  from lapTimes l;

alter table gpsLapTimes add primary key (raceId, driverId, lap);
alter table gpsLapTimes add unique index (year, round, driverId, lap);
alter table gpsLapTimes add index (driverId);
alter table gpsLapTimes add index (driverRef);
alter table gpsLapTimes add index (lap);
alter table gpsLapTimes add index lapPosition (raceId, lap, position);

alter table gpsLapTimes add column accruedMilliseconds int;
alter table gpsLapTimes add column lapLeaderDriverId int;
alter table gpsLapTimes add column lapLeaderMilliseconds int;
alter table gpsLapTimes add column lapLeaderAccruedMilliseconds int;
alter table gpsLapTimes add column raceWinnerDriverId int;
alter table gpsLapTimes add column millisecondsBehindWinner int;
alter table gpsLapTimes add column accruedMillisecondsBehindWinner int;
alter table gpsLapTimes add column millisecondsBehindLeader int;
alter table gpsLapTimes add column accruedMillisecondsBehindLeader int;
alter table gpsLapTimes add column averageLapMilliseconds int;
-- alter table gpsLapTimes add column averageLapAccruedMilliseconds int;
alter table gpsLapTimes add column millisecondsFromAverageLap int;
-- alter table gpsLapTimes add column accruedMillisecondsFromAverageLap int;


update gpsLapTimes l
   set l.accruedMilliseconds = (select sum(milliseconds) from lapTimes where raceId = l.raceId and driverId = l.driverId and lap <= l.lap),
       l.lapLeaderDriverId = (select driverId from lapTimes where raceId = l.raceId and lap = l.lap and position = 1),
       l.lapLeaderMilliseconds = (select milliseconds from lapTimes where raceId = l.raceId and lap = l.lap and position = 1),
       l.raceWinnerDriverId = (select winningDriverId from gpsRaces where raceId = l.raceId),
       l.averageLapMilliseconds = (select round(avg(milliseconds)) from lapTimes where raceId = l.raceId and lap = l.lap),
       l.millisecondsFromAverageLap = l.averageLapMilliseconds - l.milliseconds;
       
-- update gpsLapTimes l
--    set ;
       -- l.averageLapAccruedMilliseconds = (select sum(averageLapMilliseconds) from gpsLapTimes where raceId = l.raceId and driverId = l.driverId and lap <= l.lap),
       -- l.accruedMillisecondsFromAverageLap = l.averageLapAccruedMilliseconds - l.accruedMilliseconds;

update gpsLapTimes l
  join gpsLapTimes l2 on l2.raceId = l.raceId and l2.lap = l.lap and l2.driverId = l.lapLeaderDriverId
   set l.lapLeaderAccruedMilliseconds = l2.accruedMilliseconds,
       l.millisecondsBehindLeader = l2.milliseconds - l.milliseconds,
       l.accruedMillisecondsBehindLeader = l2.accruedMilliseconds - l.accruedMilliseconds;

update gpsLapTimes l
  join gpsLapTimes l2 on l2.raceId = l.raceId and l2.lap = l.lap and l2.driverId = l.raceWinnerDriverId
   set l.millisecondsBehindWinner = l2.milliseconds - l.milliseconds,
       l.accruedMillisecondsBehindWinner = l2.accruedMilliseconds - l.accruedMilliseconds;

-- update gpsLapTimes l
--    set l.millisecondsFromAverageLap = l.averageLapMilliseconds - l.milliseconds,
--        l.accruedMillisecondsFromAverageLap = l.averageLapAccruedMilliseconds - l.accruedMilliseconds;



-- ----------------------------------------------
-- Long query, takes about 1250 secs, instead of <100 sec above
-- create table gpsLapTimes as
-- select (select raceRef from gpsRaces where raceId = l.raceId) as raceRef,
--        (select driverRef from gpsDrivers where driverId = l.driverId) as driverRef,
--        l.*,
--        @accruedMilliseconds := (select sum(milliseconds) from lapTimes where raceId = l.raceId and driverId = l.driverId and lap <= l.lap) as accruedMilliseconds,
--        @lapLeaderDriverId := (select driverId from lapTimes where raceId = l.raceId and lap = l.lap and position = 1) as lapLeaderDriverId,
--        @lapLeaderAccruedMilliseconds := (select sum(milliseconds) from lapTimes where raceId = l.raceId and driverId = @lapLeaderDriverId and lap <= l.lap) as lapLeaderAccruedMilliseconds,
--        convert(@lapLeaderAccruedMilliseconds - @accruedMilliseconds, signed) as millisecondsBehindLeader,
--        (select milliseconds from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopMilliseconds,
--        (select stop from pitstops where raceId = l.raceId and driverId = l.driverId and lap = l.lap) as pitstopNumber
--   from lapTimes l;
