
alter table gpsSeasons add column constructorsChampionColor varchar(7);

update gpsSeasons s
  join gpsConstructors c on s.constructorsChampionId = c.constructorId
   set s.constructorsChampionColor = c.mainColor;
