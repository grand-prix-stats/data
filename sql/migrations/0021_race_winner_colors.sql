--
-- Set constructor colors
--
alter table gpsRaces add column winningConstructorColor varchar(7);

update gpsRaces r
  join gpsConstructors c on r.winningConstructorId = c.constructorId
   set r.winningConstructorColor = c.mainColor;
