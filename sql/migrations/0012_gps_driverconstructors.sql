-- ----------------------------------------------------------------
-- gpsDriverConstructors
-- ----------------------------------------------------------------
drop table if exists gpsDriverConstructors;

create table gpsDriverConstructors as
select year, driverRef, constructorRef, count(*) as races 
  from gpsRaceResults
 where driverRef is not null
 group by year, driverRef, constructorRef
 order by year, driverRef, races desc, constructorRef;

alter table gpsDriverConstructors add primary key (year, driverRef, constructorRef);
