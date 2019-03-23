set session sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- ----------------------------------------------------------------
-- gpsDrivers
-- ----------------------------------------------------------------

drop table if exists gpsDrivers;

create table gpsDrivers as
select driverId, driverRef, count(year) as seasons, forename, surname,
       permanentNumber, code, dob, country, countryFlag, countryCode,
       convert(sum(wins), signed) as wins,
       convert(sum(podiums), signed) as podiums,
       convert(sum(topTen), signed) as topTen,
       convert(sum(poles), signed) as poles,
       sum(points) as points,
       sum(achievablePoints) as achievablePoints,
       convert(sum(finishedInPoints), signed) as finishedInPoints,
       convert(sum(fastestLaps), signed) as fastestLaps,
       convert(sum(participations), signed) as participations,
       convert(sum(racesFinished), signed) as racesFinished,
       convert(sum(didNotFinish), signed) as didNotFinish,
       convert(sum(didNotStart), signed) as didNotStart,
       min(year) as firstSeason,
       max(year) as lastSeason,
       min(firstRace) as firstRace,
       max(lastRace) as lastRace,
       min(firstWin) as firstWin,
       max(lastWin) as lastWin,
       convert(sum(championships), signed) as championships,
       convert(sum(subChampionships), signed) as subChampionships
  from gpsSeasonDrivers
 group by driverRef;

alter table gpsDrivers add primary key (driverId);
alter table gpsDrivers add unique index (driverRef);
