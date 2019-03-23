--
-- Driver colors (from constructor)
--
alter table gpsDrivers add column mainColor varchar(7) not null default "#888888";
alter table gpsDrivers add column secondaryColor varchar(7) not null default "#444444";

alter table gpsSeasonDrivers add column mainColor varchar(7) not null default "#888888";
alter table gpsSeasonDrivers add column secondaryColor varchar(7) not null default "#444444";

update gpsSeasonDrivers sd
  join gpsSeasonConstructors sc on sc.constructorRef = sd.mainConstructorRef and sc.year = sd.year
   set sd.mainColor = sc.mainColor,
       sd.secondaryColor = sc.secondaryColor;
