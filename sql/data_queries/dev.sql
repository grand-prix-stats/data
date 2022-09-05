select * from drivers where nationality not in (select distinct name from gpsNationalities);
select * from constructors where nationality not in (select name from gpsNationalities);


select * from races where year = 2021;
select * from qualifying where raceId in (select raceId from races where year = 2021) and driverId = 1 order by qualifyId;

select * from drivers where driverId = 1;


select * from qualifying where raceId = 1061;
select * from results where raceId = 1061;
select * from driverStandings where raceId = 1061;


select * from gpsSeasonConstructors where year = 2018 order by constructorRef;
select * from gpsSeasonConstructors where year = 2019 order by constructorRef;
select * from gpsSeasonConstructors where year = 2020 order by constructorRef;
select * from gpsSeasonConstructors where year = 2021 order by constructorRef;


select * from races where year = 2022;
select * from gpsRaces where year = 2021;
select * from circuits c join races r on r.circuitId = c.circuitId where year = 2022;

select * from drivers d where d.nationality not in (select gn.name from gpsNationalities gn);
select * from circuits c where c.country not in (select gc.name from gpsCountries gc);
select * from gpsCountries;
select * from gpsNationalities;


            select year,
                   rounds,
                   participatingDrivers as participatingDrivers,
                   uniqueWinningDrivers as uniqueWinningDrivers,
                   participatingConstructors as participatingConstructors,
                   uniqueWinningConstructors as uniqueWinningConstructors,
                   ifnull(driverAchievablePoints, 0) as driverAchievablePoints,
                   ifnull(teamAchievablePoints, 0) as constructorAchievablePoints
              from gpsSeasons order by year;


select year, round, driverRef, gpsDriverFlag(driverRef) as driver,
                   rr.points, positionText,
                   c.mainColor
              from gpsRaceresults rr
              join gpsConstructors c on rr.constructorid = c.constructorid
             where year = 2022
               and driverRef is not null
             order by year, round, positionOrder;

SELECT
	year,
	driverRef,
	gpsDriverCodeFlag (driverRef) AS driver,
	positionText,
	c.mainColor
FROM
	gpsDrivers d
	JOIN gpsConstructors c ON d.constructorid = c.constructorid
WHERE
	year = 2022
-- 	AND driverRef IS NOT NULL
ORDER BY
	year,
	round,
	positionOrder;

select * from gpsNationalities;

select * FROM drivers;


describe gpsCircuits;

select * from gpsLapTimes where year = 2022;
select * from gpsLapsLed where year = 2022;

select sum(2) from gpsLapTimes;

select gpsDriverCodeFlag(driverRef),
       (select avg(`position`) as avgPosition
  from gpsLapTimes lt
 where year = 2022
 order by avgPosition;

select gpsDriverCodeFlag(driverRef) as driver,
	   (select avg(position) from gpsLapTimes where driverId = sd.driverId and year = sd.year) as avgPosition, 
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 1) as p1,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 2) as p2,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 3) as p3,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 4) as p4,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 5) as p5,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 6) as p6,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 7) as p7,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 8) as p8,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 9) as p9,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 10) as p10,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 11) as p11,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 12) as p12,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 13) as p13,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 14) as p14,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 15) as p15,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 16) as p16,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 17) as p17,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 18) as p18,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 19) as p19,
	   (select count(1) from gpsLapTimes where driverId = sd.driverId and year = sd.year and `position` = 20) as p20
  from gpsSeasonDrivers sd
 where year = 2022
 order by avgPosition;

select gpsDriverCodeFlag(driverRef) as driver,
	   (select avg(position) from gpsLapTimes where driverId = sd.driverId and year = sd.year and round = 3) as avgPosition 
  from gpsSeasonDrivers sd
 where year = 2022
 order by avgPosition;

select gpsDriverCodeFlag(sd.driverRef) as driver,
	   position,
	   count(position) as laps
  from gpsSeasonDrivers sd
  join gpsLapTimes lt on lt.driverId = sd.driverId and lt.year = sd.year
 where sd.year = 2022
 group by sd.driverRef, position
 order by driver, position;

select concat(sd.code, ' ', sd.countryFlag) as driver,
	   position,
	   count(position) as laps
  from gpsSeasonDrivers sd
  join gpsLapTimes lt on lt.driverId = sd.driverId and lt.year = sd.year
 where sd.year = 2022
--  group by sd.code, sd.countryFlag, position
 group by driver, position
 order by driver, position;


select * from gpsSeasonDrivers where year = 2022;

describe circuits;

select * from gpsRaces where year = 1996 and round = 1;

select *
  from gpsLaptimes
 where year = 1996 and round = 1 and position = 1
 order by lap;


select * from gpsRaceResults where year = 2022 ;

select sd.driverRef, sd.forename, sd.surname, sd.code, sd.countryFlag, sd.points, sd.mainColor,
	   @r1flag := (select countryFlag from gpsRaces where year = sd.year and round = 1) as r1Flag,
	   @r2flag := (select countryFlag from gpsRaces where year = sd.year and round = 2) as r2Flag,
	   @r3flag := (select countryFlag from gpsRaces where year = sd.year and round = 3) as r3Flag,
	   rr1.points as r1points, rr1.position as r1position, 
       rr2.points as r2points, rr2.position as r2position, 
       rr3.points as r3points, rr3.position as r3position
  from gpsSeasonDrivers sd
  join gpsRaceResults rr1 on sd.year = rr1.year and sd.driverRef = rr1.driverRef and rr1.round = 1 and rr1.points > 0
  join gpsRaceResults rr2 on sd.year = rr2.year and rr1.driverId = rr2.driverId and rr2.round = 2 and rr2.points > 0
  join gpsRaceResults rr3 on sd.year = rr3.year and rr1.driverId = rr3.driverId and rr3.round = 3 and rr3.points > 0
 where sd.year = 2022
 order by sd.points desc;

select *
  from (select driverRef from gpsRaceResults where year = 2022 and round = 1 and points > 0) as round1
  join (select driverRef from gpsRaceResults where year = 2022 and round = 2 and points > 0) as round2 on round1.driverRef = round2.driverRef
  join (select driverRef from gpsRaceResults where year = 2022 and round = 3 and points > 0) as round3 on round1.driverRef = round3.driverRef
  ;

select * 
  from gpsSeasonDrivers ds
 where ds.year = 2022
   and driverRef in (select driverRef from gpsRaceResults where year = ds.year and round = 1 and points > 0)
   and driverRef in (select driverRef from gpsRaceResults where year = ds.year and round = 2 and points > 0)
   and driverRef in (select driverRef from gpsRaceResults where year = ds.year and round = 3 and points > 0);
   
select * from gpsDriverStandings where year = 2022;




select * from gpsSeasons where year = 2022;
select * from races where year = 2022;
select d.driverRef, ds.*, r.year, r.round, r.date
  from driverStandings ds, races r, gpsSeasons sr, drivers d
 where ds.raceId = r.raceId and r.year = sr.year and r.round = sr.rounds
   and ds.driverId = d.driverId;



select * from driverStandings where raceId in (select raceId from races where year = 2022) order by driverid, points desc;
select * from gpsDriverStandings where year = 2021 order by round, position;
select * from gpsDriverStandings where year = 2022;

select * from gpsSeasonDrivers ds where ds.year = 2021;
select * from gpsSeasonDrivers ds where ds.year = 2022;

select count(distinct driverid) from gpsDriverstandings where position = 1;
select count(distinct driverRef) from gpsSeasonDrivers where standingsPosition = 1;
select count(distinct constructorRef) from gpsSeasonConstructors where standingsPosition = 1;

select * from gpsConstructorStandings where year = 2022;


select * from gpsSeasonDrivers where year = 2021;
select * from gpsRaces where year = 2022;
select * from gpsRaceResults where circuitRef = 'imola' and `position` < 4 order by year desc, position asc;

-- Last 5 podiums at next race
select rr1.year,
       r.name as raceName,
       gpsDriverFullName(rr1.driverRef) as p1,
       gpsDriverCodeFlag(rr2.driverRef) as p2,
       gpsDriverCodeFlag(rr3.driverRef) as p3,
       rr1.laps,
       rr1.time as p1Time,
       rr2.time as p2Time,
       rr3.time as p3Time,
       rr1.milliseconds as p1Milliseconds,
       rr2.milliseconds as p2Milliseconds,
       rr3.milliseconds as p3Milliseconds,
       (select mainColor from gpsSeasonConstructors where constructorRef = rr1.constructorRef and year = rr1.year) as p1ConstructorColor,
       (select mainColor from gpsSeasonConstructors where constructorRef = rr2.constructorRef and year = rr2.year) as p2ConstructorColor,
       (select mainColor from gpsSeasonConstructors where constructorRef = rr3.constructorRef and year = rr3.year) as p3ConstructorColor
  from gpsRaceResults rr1
  join gpsRaceResults rr2 on rr1.raceRef = rr2.raceRef
  join gpsRaceResults rr3 on rr1.raceRef = rr3.raceRef
  join gpsRaces r on r.raceRef = rr1.raceRef
 where rr1.circuitRef = (select circuitRef from gpsRaces where winningDriverId is null order by raceRef limit 0,1)
   and rr1.`position` = 1
   and rr2.`position` = 2
   and rr3.`position` = 3
 order by rr1.year desc
 limit 0,5;

        select rr1.year,
               r.circuitName,
               r.country,
               r.countryFlag,
               r.name as raceName,
               r.round,
               rr1.laps,
               (select surname from gpsDrivers where driverRef = rr1.driverRef) as p1,
               (select surname from gpsDrivers where driverRef = rr2.driverRef) as p1,
               (select surname from gpsDrivers where driverRef = rr3.driverRef) as p1,
               rr1.time as p1Time,
               rr2.time as p2Time,
               rr3.time as p3Time,
               rr1.milliseconds as p1Milliseconds,
               rr2.milliseconds as p2Milliseconds,
               rr3.milliseconds as p3Milliseconds,
               (select mainColor from gpsSeasonConstructors where constructorRef = rr1.constructorRef and year = rr1.year) as p1ConstructorColor,
               (select mainColor from gpsSeasonConstructors where constructorRef = rr2.constructorRef and year = rr2.year) as p2ConstructorColor,
               (select mainColor from gpsSeasonConstructors where constructorRef = rr3.constructorRef and year = rr3.year) as p3ConstructorColor
          from gpsRaceResults rr1
          join gpsRaceResults rr2 on rr1.raceRef = rr2.raceRef
          join gpsRaceResults rr3 on rr1.raceRef = rr3.raceRef
          join gpsRaces r on r.raceRef = rr1.raceRef
         where rr1.circuitRef = 'bahrain'
           and rr1.`position` = 1
           and rr2.`position` = 2
           and rr3.`position` = 3
         order by rr1.year desc
         limit 0,5;

select * from gpsRaces where year = 2020 order by round;

select * from gpsRaceResults order by raceRef desc;

-- Next race!!!
select * from gpsRaces where winningDriverId is null order by raceRef limit 0,1;

-- Last race!!!
select * from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1;
-- Penultimate race
select * from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1;




-- Lap chart
select * 
  from gpsRaces r
  join gpsLapTimes lt on lt.year = r.year and lt.round = r.round
  join gpsDrivers d on d.driverRef = lt.driverRef
 where r.year = 2022
   and r.round = 4;

select r.year, 
       r.round,
       r.name,
       r.raceLaps, 
       r.circuitName,
       r.country,
       r.countryFlag,
       d.forename,
       d.surname,
       lt.lap,
       lt.position,
       lt.milliseconds,
       rr.grid,
       rr.`position` as finalPosition
  from gpsRaces r
  join gpsRaceResults rr on rr.year = r.year and rr.round = r.round
  join gpsDrivers d on d.driverRef = rr.driverRef
  left join gpsLapTimes lt on lt.year = r.year and lt.round = r.round and lt.driverRef = rr.driverRef
 where r.year = 2022
   and r.round = 4
 order by rr.position, lt.lap;


select * from lapTimes where driverId = 832 and raceId = 1076;
select * from lapTimes where driverId = 832 and raceId = 1077;
select * from gpsLapTimes where driverRef = 'sainz' and year = 2022 and round = 3;
select * from gpsLapTimes where driverRef = 'sainz' and year = 2022 and round = 4;




-- lap time accrued

select lap, milliseconds, driverRef,
                   accruedMilliseconds, 
                   millisecondsBehindLeader,
                   accruedMillisecondsBehindLeader,
                   averageLapMilliseconds,
                   averageLapAccruedMilliseconds,
                   millisecondsFromAverageLap,
                   accruedMillisecondsFromAverageLap
              from gpsLaptimes
             -- where year = 2022 and round = 4 -- and driverRef = 'leclerc'
             order by lap;

select * from gpsLapTimes where year = 2022 and round = 4;


select round(avg(milliseconds)) from lapTimes;





-- driver standings before and after last race
select * from gpsDriverStandings ds where year = 2022;

select *
  from gpsDrivers d
  join gpsDriverStandings dsp on d.driverRef = dsp.driverRef
  join gpsDriverStandings dsl on d.driverRef = dsl.driverRef
  join gpsRaces r on r.raceId = dsl.raceId
 where dsp.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1)
   and dsl.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1)
 order by dsl.position
;

select d.driverRef, d.forename, d.surname, d.code, d.permanentNumber, d.countryFlag, d.mainColor,
       dsp.position as previousPosition,
       dsp.points as previousPoints,
       dsl.position,
       dsl.points,
       dsp.position - dsl.position as positionDelta,
       dsl.points - dsp.points as pointDelta,
       r.name, r.countryFlag as raceFlag,
       r.date as raceDate
  from gpsDrivers d
  join gpsDriverStandings dsp on d.driverRef = dsp.driverRef
  join gpsDriverStandings dsl on d.driverRef = dsl.driverRef
  join gpsRaces r on r.raceId = dsl.raceId
 where dsp.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1)
   and dsl.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1)
 order by dsl.position;

        select dl.driverRef,
               dl.surname,
               dl.code,
               dl.permanentNumber,
               dsl.points,
               dl.mainColor,
               dp.driverRef as previousDriverRef,
               dp.surname as previousSurname,
               dp.code as previousCode,
               dp.permanentNumber as previousPermanentNumber,
               dsp.points as previousPoints,
               dp.mainColor as previousMainColor,
               @lastPosition := (select position from gpsDriverStandings where driverRef = dl.driverRef and raceRef = rl.raceRef) as position,
               @previousPosition := (select position from gpsDriverStandings where driverRef = dl.driverRef and raceRef = rp.raceRef) as previousPosition,
               @previousPosition - @lastPosition as positionDelta,
               rl.name as raceName,
               rl.countryFlag as raceFlag,
               rl.date as raceDate
          from gpsRaces rl
          join gpsRaces rp
          join gpsDriverStandings dsl on dsl.raceRef = rl.raceRef
          join gpsDriverStandings dsp on dsp.raceRef = rp.raceRef and dsl.position = dsp.position
          join gpsDrivers dl on dl.driverRef = dsl.driverRef
          join gpsDrivers dp on dp.driverRef = dsp.driverRef
         where rl.raceRef = (select raceRef from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1)
           and rp.raceRef = (select raceRef from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1)
         order by dsl.position;

select * from gpsRaceResults where year = 2022 and round = 4;


-- consturctor standings before and after last race
select * from gpsConstructorStandings ds where year = 2022;

select *
  from gpsConstructors c
  join gpsConstructorStandings csp on c.constructorRef = csp.constructorRef
  join gpsConstructorStandings csl on c.constructorRef = csl.constructorRef
 where csp.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1)
   and csl.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1)
 order by csl.position
;

select c.constructorRef, c.name, c.countryFlag, c.mainColor,
       csp.position, csp.points, 
       csl.position, csl.points,
       csp.position - csl.position as positionDelta,
       csl.points - csp.points as pointDelta
  from gpsConstructors c
  join gpsConstructorStandings csp on c.constructorRef = csp.constructorRef
  join gpsConstructorStandings csl on c.constructorRef = csl.constructorRef
 where csp.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1)
   and csl.raceId = (select raceId from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1)
 order by csl.position;

        select cl.constructorRef,
               cl.name,
               csl.points,
               cl.mainColor,
               @lastPosition := (select position from gpsConstructorStandings where constructorRef = cl.constructorRef and raceRef = rl.raceRef) as position,
               cp.constructorRef as previousConstructorRef,
               cp.name as previousName,
               csp.points as previousPoints,
               cp.mainColor as previousMainColor,
               @previousPosition := (select position from gpsConstructorStandings where constructorRef = cl.constructorRef and raceRef = rp.raceRef) as previousPosition,
               @previousPosition - @lastPosition as positionDelta,
               rl.name as raceName,
               rl.countryFlag as raceFlag,
               rl.date as raceDate,
               rl.year,
               rl.round
          from gpsRaces rl
          join gpsRaces rp
          join gpsConstructorStandings csl on csl.raceRef = rl.raceRef
          join gpsConstructorStandings csp on csp.raceRef = rp.raceRef and csl.position = csp.position
          join gpsConstructors cl on cl.constructorRef = csl.constructorRef
          join gpsConstructors cp on cp.constructorRef = csp.constructorRef
         where rl.raceRef = (select raceRef from gpsRaces where winningDriverId is not null order by raceRef desc limit 0,1)
           and rp.raceRef = (select raceRef from gpsRaces where winningDriverId is not null order by raceRef desc limit 1,1)
         order by csl.position;



-- last finished races (for a given driver)

select * 
  from gpsRaceResults rr
  join gpsRaces r on r.raceRef = rr.raceRef
 where driverRef = 'max_verstappen'
   and statusId = 1
 order by r.raceRef desc
 ;

select rr.year, rr.country, rr.countryFlag, r.circuitName, r.name as raceName, 
       rr.grid, rr.position, rr.grid - rr.position as positionsGained,
       d.mainColor, sc.name, sc.mainColor, s.status
  from gpsRaceResults rr
  join gpsRaces r on r.raceRef = rr.raceRef
  join gpsDrivers d on d.driverRef = rr.driverRef
  join gpsSeasonConstructors sc on sc.constructorRef = rr.constructorRef and sc.year = rr.year
  join status s on rr.statusId = s.statusId
 where rr.driverRef = 'max_verstappen'
   and (s.statusId = 1 or s.status like '%Lap%')
 order by rr.raceRef desc
 ;

select * from gpsRaces;
select * from gpsRaceResults;
select * from status;
select * from status where status like "%Laps";


-- season standings

select *
  from gpsDriverStandings ds
  join gpsDrivers d on ds.driverRef = d.driverRef
  join gpsRaces r on r.raceRef = ds.raceRef
 where ds.year = 2022
 order by ds.raceRef desc, position;

select ds.round, 
       r.name as raceName, r.country as raceCountry, r.countryFlag as raceFlag,
       ds.driverRef, d.forename, d.surname, d.code, d.permanentNumber,
       ds.position, ds.points
  from gpsDriverStandings ds
  join gpsDrivers d on ds.driverRef = d.driverRef
  join gpsRaces r on r.raceRef = ds.raceRef
 where ds.year = 2022
 order by ds.raceRef desc, position;

select *
  from gpsSeasonDrivers sd 
  join gpsRaces r on r.year = sd.year
  left join gpsDriverStandings ds on ds.driverRef = sd.driverRef and ds.raceRef = r.raceRef
 where sd.year = 2022
   and sd.driverRef = 'vettel';

select r.round, r.name as raceName, r.country as raceCountry, r.countryFlag as raceFlag,
       sd.driverRef, sd.forename, sd.surname, sd.code, sd.permanentNumber, sd.mainColor,
       ifnull(ds.position, (select max(position) from gpsDriverStandings where year = sd.year)) as position, 
       ifnull(ds.points, 0) as points
  from gpsSeasonDrivers sd 
  join gpsRaces r on r.year = sd.year
  left join gpsDriverStandings ds on ds.driverRef = sd.driverRef and ds.raceRef = r.raceRef
 where sd.year = 2022
   and r.winningDriverId is not null
   and sd.driverRef = 'hulkenberg';


select round, countryFlag, countryTag, raceTag from gpsRaces where year = 2022;
select * from gpsCircuits;