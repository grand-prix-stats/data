
--
-- Set constructor colors to their last season livery colors
--
update gpsConstructors c
  join gpsSeasonConstructors sc on c.constructorRef = sc.constructorRef and c.lastSeason = sc.year
   set c.mainColor = sc.mainColor,
       c.secondaryColor = sc.secondaryColor;


--
-- Set driver colors to their last season main constructor livery colors
--
update gpsDrivers d
  join gpsSeasonDrivers sd on d.driverRef = sd.driverRef and d.lastSeason = sd.year
   set d.mainColor = sd.mainColor,
       d.secondaryColor = sd.secondaryColor;
