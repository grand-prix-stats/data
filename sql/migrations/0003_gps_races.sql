-- ----------------------------------------------------------------
-- gpsRaces
-- ----------------------------------------------------------------
drop table if exists gpsRaces;

create table gpsRaces as
select ra.raceId,
       concat(ra.year, lpad(ra.round, 2, '0')) as raceRef,
       ra.year,
       ra.round,
       ra.circuitId,
       ci.circuitRef,
       ci.name as circuitName,
       co.name as country,
       co.code as countryCode,
       co.flag as countryFlag,
       ra.name,
       ra.date,
       TIME_TO_SEC(ra.time) as `time`,
       re.driverId as winningDriverId,
       d.driverRef as winningDriverRef,
       re.constructorId as winningConstructorId,
       c.constructorRef as winningConstructorRef,
       c.name as winningConstructorName,
       re.grid as winningDriverGrid,
       re.points as points,
       @laps := re.laps as raceLaps,
       re.time as raceTime,
       @millis := re.milliseconds as raceMillis,
       @millis / @laps as raceMillisPerLap,
       @fastestLapMillis := (select min(milliseconds) from lapTimes where raceId = ra.raceId) as fastestLapMillis,
       @fastestLapTime := (select time from lapTimes where raceId = ra.raceId and milliseconds = @fastestLapMillis) as fastestLapTime,
       @fastestLapdriverId := (select driverId from lapTimes where raceId = ra.raceId and milliseconds = @fastestLapMillis) as fastestLapdriverId,
       @fastestLapNumber := (select lap from lapTimes where raceId = ra.raceId and milliseconds = @fastestLapMillis) as fastestLapNumber,
       (select q1 from qualifying where raceId = ra.raceId and position = 1) as polePositionTime,
       (select driverId from qualifying where raceId = ra.raceId and position = 1) as polePositiondriverId,
       (select driverRef from qualifying where raceId = ra.raceId and position = 1) as polePositiondriverRef
  from races ra
  join circuits ci on ra.circuitid = ci.circuitid
  join gpsCountries co on ci.country = co.name
  left join results re on ra.raceId = re.raceId and re.position = 1
  left join drivers d on d.driverId = re.driverId
  left join constructors c on c.constructorId = re.constructorId;

delete from gpsRaces where raceId = 828 and winningDriverId = 786;
delete from gpsRaces where raceId = 780 and winningDriverId = 479;
delete from gpsRaces where raceId = 784 and winningDriverId = 577;

alter table gpsRaces add primary key (raceId);
alter table gpsRaces add unique index (raceRef);
alter table gpsRaces add unique index yearRound (year, round);
alter table gpsRaces add index (circuitId);
alter table gpsRaces add index (circuitRef);
alter table gpsRaces add index (countryCode);
alter table gpsRaces add index (winningDriverId);
alter table gpsRaces add index (winningDriverRef);
alter table gpsRaces add index (winningConstructorId);
alter table gpsRaces add index (winningConstructorRef);
alter table gpsRaces add index (polePositiondriverId);
alter table gpsRaces add index (polePositiondriverRef);
