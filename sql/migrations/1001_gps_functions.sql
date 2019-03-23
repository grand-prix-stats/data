
-- ----------------------------------------------------------------
-- gpsOrdinal
-- ----------------------------------------------------------------
drop function if exists gpsOrdinal;

delimiter $$
create function gpsOrdinal(number bigint)
returns varchar(64)
deterministic
begin
    declare ord varchar(64);
    set ord = (select concat(number, case
        when number%100 between 11 and 13 then "th"
        when number%10 = 1 then "st"
        when number%10 = 2 then "nd"
        when number%10 = 3 then "rd"
        else "th"
    end));
    return ord;
end$$
delimiter ;

-- ----------------------------------------------------------------
-- gpsDriverFullName
-- ----------------------------------------------------------------
drop function if exists gpsDriverFullName;

delimiter $$
create function gpsDriverFullName(driverRef varchar(255))
returns varchar(255)
deterministic
begin
    return (select concat(forename, ' ', surname) from drivers d where d.driverRef = driverRef);
end$$
delimiter ;

-- ----------------------------------------------------------------
-- gpsDriverFlag
-- ----------------------------------------------------------------
drop function if exists gpsDriverFlag;

delimiter $$
create function gpsDriverFlag(driverRef varchar(255))
returns varchar(255)
deterministic
begin
    return (select concat(forename, ' ', surname, ' ', countryFlag) from gpsDrivers d where d.driverRef = driverRef);
end$$
delimiter ;

-- ----------------------------------------------------------------
-- gpsConstructorFlag
-- ----------------------------------------------------------------
drop function if exists gpsConstructorFlag;

delimiter $$
create function gpsConstructorFlag(constructorRef varchar(255))
returns varchar(255)
deterministic
begin
    return (select concat(name, ' ', countryFlag) from gpsConstructors d where d.constructorRef = constructorRef);
end$$
delimiter ;

-- ----------------------------------------------------------------
-- gpsCircuitFlag
-- ----------------------------------------------------------------
drop function if exists gpsCircuitFlag;

delimiter $$
create function gpsCircuitFlag(circuitRef varchar(255))
returns varchar(255)
deterministic
begin
    return (select concat(name, ' ', countryFlag) from gpsCircuits d where d.circuitRef = circuitRef);
end$$
delimiter ;

-- ----------------------------------------------------------------
-- gpsCircuit
-- ----------------------------------------------------------------
drop function if exists gpsCircuit;

delimiter $$
create function gpsCircuit(circuitRef varchar(255))
returns varchar(255)
deterministic
begin
    return (select name from gpsCircuits d where d.circuitRef = circuitRef);
end$$
delimiter ;

-- ----------------------------------------------------------------
-- gpsRaceFlag
-- ----------------------------------------------------------------
drop function if exists gpsRaceFlag;

delimiter $$
create function gpsRaceFlag(raceId bigint)
returns varchar(255)
deterministic
begin
    return (select concat(year, ' ', name, ' ', countryFlag) from gpsRaces d where d.raceId = raceId);
end$$
delimiter ;


-- ----------------------------------------------------------------
-- gpsPercent
-- ----------------------------------------------------------------
drop function if exists gpsPercent;

delimiter $$
create function gpsPercent(dividend float, divisor float)
returns varchar(255)
deterministic
begin
    if divisor = 0 then
        return '0.00%';
    end if;
    return concat(round(100 * ifnull(dividend, 0) / ifnull(divisor, 1), 2), '%');
end$$
delimiter ;
