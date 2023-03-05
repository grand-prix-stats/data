-- Constructor
alter table constructors add unique index constructorRef (constructorRef);
alter table constructors add index (nationality);
alter table constructorStandings add index (constructorId);
alter table constructorStandings add index (raceId);
delete from constructorStandings where constructorStandingsId = 24518;
alter table constructorStandings add unique index constructorRace (constructorId, raceId);

-- Driver
alter table drivers add unique index driverRef (driverRef);
alter table drivers add index (nationality);
alter table driverStandings add index (driverId);
alter table driverStandings add index (raceId);
-- delete duplicate standings
delete from driverStandings where driverStandingsId in (70225);
alter table driverStandings add unique index driverRace (driverId, raceId);

-- Circuits
update circuits set country = 'USA' where country = 'United States';

-- Races
alter table races modify column `date` DATE not null default '1900-01-01';
alter table races add unique index yearRound (year, round);

-- Results
alter table results add index (position);
alter table results add index (grid);
alter table results add index (driverId);
alter table results add index (constructorId);
alter table results add index (raceId);
alter table results add index driverRace (driverId, raceId);
alter table results add index constructorRace (constructorId, raceId);

-- Lap Times
alter table lapTimes add index (lap);
alter table lapTimes add index (milliseconds);
alter table lapTimes add index (position);
alter table lapTimes add index raceIdmillis (raceId, milliseconds);
alter table lapTimes add index driverId (driverId);
alter table lapTimes add index driverLap (raceId, driverId, lap);
alter table lapTimes add index driverLaps (raceId, driverId);
alter table lapTimes add index lapPosition (raceId, lap, position);

-- Pit Stops
alter table pitstops add index (lap);

-- Qualifying
alter table qualifying add index (raceId);
alter table qualifying add index (position);

