set session sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- ----------------------------------------------------------------
-- gpsCircuits
-- ----------------------------------------------------------------
drop table if exists gpsCircuits;

create table gpsCircuits as
select c.*,
       co.flag as countryFlag, co.code as countryCode,
       (select count(1) from races where circuitid = c.circuitid) as races,
       (select count(distinct driverId) from gpsRaceResults where circuitid = c.circuitid) as totalDrivers,
       (select count(distinct driverId) from gpsRaceResults where circuitid = c.circuitid and position = 1) as winningDrivers,
       (select count(distinct driverId) from gpsRaceResults where circuitid = c.circuitid and position < 4) as podiumDrivers,
       (select driverRef from gpsRaceResults where circuitid = c.circuitid and position = 1 group by driverId order by count(1) desc limit 0,1) as mostWinsDriver,
       (select count(1) from gpsRaceResults where circuitid = c.circuitid and position = 1 group by driverId order by count(1) desc limit 0,1) as mostWinsDriverWins,
       (select count(distinct constructorId) from gpsRaceResults where circuitid = c.circuitid) as totalConstructors,
       (select count(distinct constructorId) from gpsRaceResults where circuitid = c.circuitid and position = 1) as winningConstructors,
       (select count(distinct constructorId) from gpsRaceResults where circuitid = c.circuitid and position < 4) as podiumConstructors,
       (select constructorRef from gpsRaceResults where circuitid = c.circuitid and position = 1 group by constructorId order by count(1) desc limit 0,1) as mostWinsConstructor,
       (select count(1) from gpsRaceResults where circuitid = c.circuitid and position = 1 group by constructorId order by count(1) desc limit 0,1) as mostWinsConstructorWins
  from circuits c
  join gpsCountries co on c.country = co.name;

alter table gpsCircuits add primary key (circuitid);
alter table gpsCircuits add unique index (circuitRef);
alter table gpsCircuits add index (country);
alter table gpsCircuits add index (countryCode);
alter table gpsCircuits add index (mostWinsDriver);
alter table gpsCircuits add index (mostWinsConstructor);
