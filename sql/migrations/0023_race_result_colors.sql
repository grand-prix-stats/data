alter table gpsRaceResults add column constructorColor varchar(7) not null default "#888888" after constructorRef;

update gpsRaceResults rr
  join gpsSeasonConstructors sc on rr.year = sc.year and rr.constructorRef = sc.constructorRef
   set rr.constructorColor = sc.mainColor;
