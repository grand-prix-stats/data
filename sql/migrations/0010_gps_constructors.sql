set session sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- ----------------------------------------------------------------
-- gpsConstructors
-- ----------------------------------------------------------------

drop table if exists gpsConstructors;

create table gpsConstructors as
select constructorId, constructorRef, count(year) as seasons, name,
       country, countryFlag, countryCode,
       convert(sum(wins), signed) as wins,
       convert(sum(podiums), signed) as podiums,
       convert(sum(topTen), signed) as topTen,
       convert(sum(poles), signed) as poles,
       sum(points) as points,
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
  from gpsSeasonConstructors
 group by constructorRef;

alter table gpsConstructors add primary key (constructorId);
alter table gpsConstructors add unique index (constructorRef);
