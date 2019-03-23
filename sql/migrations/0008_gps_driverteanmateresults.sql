-- ----------------------------------------------------------------
-- gpsDriverTeammateResults
-- ----------------------------------------------------------------
drop table if exists gpsDriverTeammateResults;

create table gpsDriverTeammateResults as
select year, round, date as raceDate, raceTime, dr.raceId,
       dr.driverId dDriverId, dd.driverRef dDriverRef, dr.number dNumber,
       dd.code dCode, dr.resultId dResultId, dr.constructorId dConstructorId,
       dr.grid dGrid, dr.position dPosition, dr.positionText dPositionText,
       dr.positionOrder dPositionOrder, dr.points dPoints, dr.laps dLaps,
       dr.time dTime, dr.milliseconds dMilliseconds, dr.fastestLap dFastestLap,
       dr.rank dRank, dr.fastestLapTime dFastestLapTime,
       dr.fastestLapSpeed dFastestLapSpeed, dr.statusId dStatusId,
       tr.driverId tDriverId, td.driverRef tDriverRef, tr.number tNumber,
       td.code tCode, tr.resultId tResultId, tr.constructorId tConstructorId,
       tr.grid tGrid, tr.position tPosition, tr.positionText tPositionText,
       tr.positionOrder tPositionOrder, tr.points tPoints, tr.laps tLaps,
       tr.time tTime, tr.milliseconds tMilliseconds, tr.fastestLap tFastestLap,
        tr.rank tRank, tr.fastestLapTime tFastestLapTime,
        tr.fastestLapSpeed tFastestLapSpeed, tr.statusId tStatusId
  from gpsRaceResults dr
  join results tr on dr.constructorId = tr.constructorId and dr.raceId = tr.raceId and dr.driverId <> tr.driverId
  join drivers dd on dd.driverId = dr.driverId
  join drivers td on td.driverId = tr.driverId;

alter table gpsDriverTeammateResults modify column `raceDate` DATE not null default '1900-01-01';
alter table gpsDriverTeammateResults add primary key (dResultId, tResultId);
alter table gpsDriverTeammateResults add index (dConstructorId);
alter table gpsDriverTeammateResults add index (dDriverId);
alter table gpsDriverTeammateResults add index (dDriverRef);
alter table gpsDriverTeammateResults add index (dPosition);
alter table gpsDriverTeammateResults add index (tConstructorId);
alter table gpsDriverTeammateResults add index (tDriverId);
alter table gpsDriverTeammateResults add index (tDriverRef);
alter table gpsDriverTeammateResults add index (tPosition);
