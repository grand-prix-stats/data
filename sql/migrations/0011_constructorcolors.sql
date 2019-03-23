--
-- Constructor colors
--
alter table gpsConstructors add column mainColor varchar(7) not null default "#888888";
alter table gpsConstructors add column secondaryColor varchar(7) not null default "#444444";
