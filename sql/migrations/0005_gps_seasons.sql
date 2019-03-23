-- ----------------------------------------------------------------
-- gpsSeasons
-- ----------------------------------------------------------------
drop table if exists tmpSeasonRounds;
create table tmpSeasonRounds as select year, count(1) as rounds from races group by year;
alter table tmpSeasonRounds add unique index yearRounds (year, rounds);

drop table if exists gpsSeasons;
create table gpsSeasons as
select s.year,
       sr.rounds,
       (select date from races where year = s.year and round = 1) as startDate,
       (select date from races where year = s.year and round = sr.rounds) as endDate,
       @seasonPoints := (select sum(points) from results r, races ra where r.raceId = ra.raceId and ra.year = s.year) as seasonPoints,
       (select sum(points) from gpsRaceResults where year = s.year and position = 1) as driverAchievablePoints,
       (select sum(points) from gpsRaceResults where year = s.year and position in (1,2)) as teamAchievablePoints,
       (select max(points) from gpsRaceResults where year = s.year and position = 1) as driverMaxRacePoints,
       (select sum(points) from (select max(points) points from gpsRaceResults where year = 2014 and position = 1 union select max(points) points from gpsRaceResults where year = 2014 and position = 2) as p) as teamMaxRacePoints,
       (select count(distinct r.driverId) from results r, races ra where r.raceId = ra.raceId and position = 1 and ra.year = s.year) as uniqueWinningDrivers,
       (select count(distinct r.constructorId) from results r, races ra where r.raceId = ra.raceId and position = 1 and ra.year = s.year) as uniqueWinningConstructors,
       @participatingDrivers := (select count(distinct r.driverId) from results r, races ra where r.raceId = ra.raceId and ra.year = s.year) as participatingDrivers,
       @participatingConstructors := (select count(distinct r.constructorId) from results r, races ra where r.raceId = ra.raceId and ra.year = s.year) as participatingConstructors,
       (select count(distinct driverId) from driverStandings dr join races ra on ra.raceId = dr.raceId where dr.position = 1 and ra.year = s.year) as driversChampionshipLeaders,
       (select d.driverRef from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversChampionRef,
       (select d.driverId from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversChampionId,
       (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversChampionPoints,
       (select d.driverRef from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversSecondRef,
       (select d.driverId from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversSecondId,
       (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversSecondPoints,
       (select d.driverRef from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversThirdRef,
       (select d.driverId from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversThirdId,
       (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversThirdPoints,
       (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) - (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversFirstToSecondDeltaPoints,
       (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) - (select ds.points from drivers d, driverStandings ds, races r, tmpSeasonRounds sr where d.driverId = ds.driverId and r.raceId = ds.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) driversFirstToThirdDeltaPoints,
       (select count(distinct constructorId) from constructorStandings cr join races ra on ra.raceId = cr.raceId where cr.position = 1 and ra.year = s.year) as constructorsChampionshipLeaders,
       (select c.constructorRef from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsChampionRef,
       (select c.constructorId from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsChampionId,
       (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsChampionPoints,
       (select c.constructorRef from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsSecondRef,
       (select c.constructorId from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsSecondId,
       (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsSecondPoints,
       (select c.constructorRef from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsThirdRef,
       (select c.constructorId from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsThirdId,
       (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsThirdPoints,
       (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) - (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 2 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsFirstToSecondDeltaPoints,
       (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 1 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) - (select cs.points from constructors c, constructorStandings cs, races r, tmpSeasonRounds sr where c.constructorId = cs.constructorId and r.raceId = cs.raceId and position = 3 and r.round = sr.rounds and r.year = sr.year and r.year = s.year) constructorsFirstToThirdDeltaPoints,
       @meanDriverPoints := (@seasonPoints / @participatingDrivers) as meanDriverPoints,
       @meanConstructorPoints := (@seasonPoints / @participatingConstructors) as meanConstructorPoints
  from seasons s
  join tmpSeasonRounds sr on s.year = sr.year
 order by year desc;

alter table gpsSeasons add primary key (year);
alter table gpsSeasons add unique index yearRound (year, rounds);
drop table if exists tmpSeasonRounds;
