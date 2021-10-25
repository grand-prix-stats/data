alter table gpsSeasonConstructors add column mainColor varchar(7) not null default "#888888";
alter table gpsSeasonConstructors add column secondaryColor varchar(7) not null default "#444444";

--
-- Basic colors for all seasons
--

update gpsSeasonConstructors set mainColor = "#E00D19", secondaryColor = "#000000" where constructorRef = "ferrari";
update gpsSeasonConstructors set mainColor = "#F6AFC1", secondaryColor = "#283777" where constructorRef = "racing_point";
update gpsSeasonConstructors set mainColor = "#B49663", secondaryColor = "#000000" where constructorRef = "haas";
update gpsSeasonConstructors set mainColor = "#FCA13B", secondaryColor = "#0D1D20" where constructorRef = "mclaren";
update gpsSeasonConstructors set mainColor = "#18A19B", secondaryColor = "#D7D7D5" where constructorRef = "mercedes";
update gpsSeasonConstructors set mainColor = "#021F48", secondaryColor = "#FDCC2F" where constructorRef = "red_bull";
update gpsSeasonConstructors set mainColor = "#FEF336", secondaryColor = "#000000" where constructorRef = "renault";
update gpsSeasonConstructors set mainColor = "#8D1028", secondaryColor = "#FFFFFF" where constructorRef = "sauber";
update gpsSeasonConstructors set mainColor = "#031D87", secondaryColor = "#FC181D" where constructorRef = "toro_rosso";
update gpsSeasonConstructors set mainColor = "#1AA1DB", secondaryColor = "#EAE4ED" where constructorRef = "williams";

update gpsSeasonConstructors set mainColor = "#8D1028", secondaryColor = "#444444" where constructorRef = "alfa";
update gpsSeasonConstructors set mainColor = "#FFA500", secondaryColor = "#444444" where constructorRef = "arrows";
update gpsSeasonConstructors set mainColor = "#FFFFFF", secondaryColor = "#444444" where constructorRef = "bar";
update gpsSeasonConstructors set mainColor = "#73C2FB", secondaryColor = "#444444" where constructorRef = "benetton";
update gpsSeasonConstructors set mainColor = "#20359D", secondaryColor = "#444444" where constructorRef = "bmw_sauber";
update gpsSeasonConstructors set mainColor = "#243F73", secondaryColor = "#444444" where constructorRef = "brabham";
update gpsSeasonConstructors set mainColor = "#243F73", secondaryColor = "#444444" where constructorRef = "brabham-climax";
update gpsSeasonConstructors set mainColor = "#07316F", secondaryColor = "#444444" where constructorRef = "brabham-ford";
update gpsSeasonConstructors set mainColor = "#243F73", secondaryColor = "#444444" where constructorRef = "brabham-repco";
update gpsSeasonConstructors set mainColor = "#E2F833", secondaryColor = "#FFFFFF" where constructorRef = "brawn";
update gpsSeasonConstructors set mainColor = "#144D44", secondaryColor = "#444444" where constructorRef = "brm";
update gpsSeasonConstructors set mainColor = "#124411", secondaryColor = "#444444" where constructorRef = "caterham";
update gpsSeasonConstructors set mainColor = "#273027", secondaryColor = "#444444" where constructorRef = "cooper";
update gpsSeasonConstructors set mainColor = "#273027", secondaryColor = "#444444" where constructorRef = "cooper-climax";
update gpsSeasonConstructors set mainColor = "#1A2446", secondaryColor = "#444444" where constructorRef = "cooper-maserati";
update gpsSeasonConstructors set mainColor = "#1A284B", secondaryColor = "#444444" where constructorRef = "eagle-weslake";
update gpsSeasonConstructors set mainColor = "#DBC75F", secondaryColor = "#444444" where constructorRef = "epperly";
update gpsSeasonConstructors set mainColor = "#FFFFFF", secondaryColor = "#444444" where constructorRef = "hesketh";
update gpsSeasonConstructors set mainColor = "#FFFFFF", secondaryColor = "#444444" where constructorRef = "honda";
update gpsSeasonConstructors set mainColor = "#BE9D56", secondaryColor = "#444444" where constructorRef = "hrt";
update gpsSeasonConstructors set mainColor = "#D33949", secondaryColor = "#444444" where constructorRef = "kurtis_kraft";
update gpsSeasonConstructors set mainColor = "#C4333B", secondaryColor = "#444444" where constructorRef = "kuzma";
update gpsSeasonConstructors set mainColor = "#095921", secondaryColor = "#444444" where constructorRef = "jaguar";
update gpsSeasonConstructors set mainColor = "#FFFF01", secondaryColor = "#444444" where constructorRef = "jordan";
update gpsSeasonConstructors set mainColor = "#0F5DBB", secondaryColor = "#444444" where constructorRef = "ligier";
update gpsSeasonConstructors set mainColor = "#457439", secondaryColor = "#444444" where constructorRef = "lotus-brm";
update gpsSeasonConstructors set mainColor = "#025839", secondaryColor = "#444444" where constructorRef = "lotus-climax";
update gpsSeasonConstructors set mainColor = "#025839", secondaryColor = "#444444" where constructorRef = "lotus-ford";
update gpsSeasonConstructors set mainColor = "#F6CA46", secondaryColor = "#444444" where constructorRef = "lotus_f1";
update gpsSeasonConstructors set mainColor = "#006400", secondaryColor = "#444444" where constructorRef = "lotus_racing";
update gpsSeasonConstructors set mainColor = "#5E0A16", secondaryColor = "#444444" where constructorRef = "manor";
update gpsSeasonConstructors set mainColor = "#E53524", secondaryColor = "#444444" where constructorRef = "march";
update gpsSeasonConstructors set mainColor = "#5E0A16", secondaryColor = "#444444" where constructorRef = "marussia";
update gpsSeasonConstructors set mainColor = "#C0BEC3", secondaryColor = "#444444" where constructorRef = "maserati";
update gpsSeasonConstructors set mainColor = "#3FB2B3", secondaryColor = "#444444" where constructorRef = "matra-ford";
update gpsSeasonConstructors set mainColor = "#AAAAAA", secondaryColor = "#444444" where constructorRef = "mclaren-ford";
update gpsSeasonConstructors set mainColor = "#343434", secondaryColor = "#444444" where constructorRef = "mf1";
update gpsSeasonConstructors set mainColor = "#1B1D1D", secondaryColor = "#444444" where constructorRef = "minardi";
update gpsSeasonConstructors set mainColor = "#2077C9", secondaryColor = "#444444" where constructorRef = "penske";
update gpsSeasonConstructors set mainColor = "#DDDDDD", secondaryColor = "#444444" where constructorRef = "porsche";
update gpsSeasonConstructors set mainColor = "#0D1773", secondaryColor = "#444444" where constructorRef = "prost";
update gpsSeasonConstructors set mainColor = "#FA9B27", secondaryColor = "#444444" where constructorRef = "shadow";
update gpsSeasonConstructors set mainColor = "#FFA500", secondaryColor = "#444444" where constructorRef = "spyker";
update gpsSeasonConstructors set mainColor = "#FFA500", secondaryColor = "#444444" where constructorRef = "spyker_mf1";
update gpsSeasonConstructors set mainColor = "#FFFFFF", secondaryColor = "#444444" where constructorRef = "stewart";
update gpsSeasonConstructors set mainColor = "#E30010", secondaryColor = "#FFFFFF" where constructorRef = "super_aguri";
update gpsSeasonConstructors set mainColor = "#09630C", secondaryColor = "#B49663" where constructorRef = "team_lotus";
update gpsSeasonConstructors set mainColor = "#D70028", secondaryColor = "#FFFFFF" where constructorRef = "toyota";
update gpsSeasonConstructors set mainColor = "#274B72", secondaryColor = "#444444" where constructorRef = "tyrrell";
update gpsSeasonConstructors set mainColor = "#336667", secondaryColor = "#444444" where constructorRef = "vanwall";
update gpsSeasonConstructors set mainColor = "#F60002", secondaryColor = "#444444" where constructorRef = "virgin";
update gpsSeasonConstructors set mainColor = "#FC8881", secondaryColor = "#444444" where constructorRef = "watson";
update gpsSeasonConstructors set mainColor = "#A3805E", secondaryColor = "#444444" where constructorRef = "wolf";

#
# Season specific livery colors
#

update gpsSeasonConstructors set mainColor = "#F6AFC1", secondaryColor = "#283777" where constructorRef = "racing_point" and year between 2019 and 2019;

update gpsSeasonConstructors set mainColor = "#F6AFC1", secondaryColor = "#0D5FA6" where constructorRef = "force_india" and year between 2017 and 2018;
update gpsSeasonConstructors set mainColor = "#F07840", secondaryColor = "#343434" where constructorRef = "force_india" and year between 2014 and 2016;
update gpsSeasonConstructors set mainColor = "#F07840", secondaryColor = "#18A75F" where constructorRef = "force_india" and year between 2009 and 2013;
update gpsSeasonConstructors set mainColor = "#C81625", secondaryColor = "#B49663" where constructorRef = "force_india" and year between 2008 and 2008;

update gpsSeasonConstructors set mainColor = "#B49663", secondaryColor = "#101010" where constructorRef = "haas" and year = 2019;
update gpsSeasonConstructors set mainColor = "#EA2040", secondaryColor = "#464A4C" where constructorRef = "haas" and year <= 2018;

update gpsSeasonConstructors set mainColor = "#FCA13B", secondaryColor = "#0D1D20" where constructorRef = "mclaren" and year between 2017 and 2018;
update gpsSeasonConstructors set mainColor = "#545454", secondaryColor = "#C50A15" where constructorRef = "mclaren" and year between 2015 and 2016;
update gpsSeasonConstructors set mainColor = "#B8B8B8", secondaryColor = "#0D0D0D" where constructorRef = "mclaren" and year = 2014;
update gpsSeasonConstructors set mainColor = "#B8B8B8", secondaryColor = "#E30B17" where constructorRef = "mclaren" and year between 2006 and 2013;
update gpsSeasonConstructors set mainColor = "#B8B8B8", secondaryColor = "#0D0D0D" where constructorRef = "mclaren" and year between 1997 and 2005;
update gpsSeasonConstructors set mainColor = "#C50A15", secondaryColor = "#FFFFFF" where constructorRef = "mclaren" and year between 1974 and 1994;
update gpsSeasonConstructors set mainColor = "#FCA13B", secondaryColor = "#FFFFFF" where constructorRef = "mclaren" and year between 1968 and 1973;

update gpsSeasonConstructors set mainColor = "#18A19B", secondaryColor = "#D7D7D5" where constructorRef = "mercedes" and year >= 2010;
update gpsSeasonConstructors set mainColor = "#D7D7D5", secondaryColor = "#D7D7D5" where constructorRef = "mercedes" and year < 2010;

update gpsSeasonConstructors set mainColor = "#021F48", secondaryColor = "#FDCC2F" where constructorRef = "red_bull" and year between 2016 and 2018;
update gpsSeasonConstructors set mainColor = "#381ea0", secondaryColor = "#FDCC2F" where constructorRef = "red_bull" and year between 2013 and 2014;
update gpsSeasonConstructors set mainColor = "#021F48", secondaryColor = "#FDCC2F" where constructorRef = "red_bull" and year between 2005 and 2012;

update gpsSeasonConstructors set mainColor = "#FEF336", secondaryColor = "#000000" where constructorRef = "renault" and year between 2016 and 2018;
update gpsSeasonConstructors set mainColor = "#B4975E", secondaryColor = "#FC3836" where constructorRef = "renault" and year between 2011 and 2011;
update gpsSeasonConstructors set mainColor = "#FDD330", secondaryColor = "#000000" where constructorRef = "renault" and year between 2010 and 2010;
update gpsSeasonConstructors set mainColor = "#FDD330", secondaryColor = "#FC6320" where constructorRef = "renault" and year between 2007 and 2009;
update gpsSeasonConstructors set mainColor = "#FDD330", secondaryColor = "#3FABE6" where constructorRef = "renault" and year between 2002 and 2006;
update gpsSeasonConstructors set mainColor = "#FDD330", secondaryColor = "#FFFFFF" where constructorRef = "renault" and year between 1979 and 1985;
update gpsSeasonConstructors set mainColor = "#FDD330", secondaryColor = "#000000" where constructorRef = "renault" and year between 1977 and 1978;

update gpsSeasonConstructors set mainColor = "#8D1028", secondaryColor = "#FFFFFF" where constructorRef = "sauber" and year between 2018 and 2019;
update gpsSeasonConstructors set mainColor = "#0736A5", secondaryColor = "#A17A5D" where constructorRef = "sauber" and year = 2017;
update gpsSeasonConstructors set mainColor = "#11489A", secondaryColor = "#FEC951" where constructorRef = "sauber" and year between 2015 and 2016;
update gpsSeasonConstructors set mainColor = "#3A3A41", secondaryColor = "#EC3A32" where constructorRef = "sauber" and year between 2010 and 2014;
update gpsSeasonConstructors set mainColor = "#3A80D8", secondaryColor = "#18A19B" where constructorRef = "sauber" and year between 1996 and 2005;
update gpsSeasonConstructors set mainColor = "#121D32", secondaryColor = "#FDCC2F" where constructorRef = "sauber" and year = 1995;
update gpsSeasonConstructors set mainColor = "#025839", secondaryColor = "#FFFFFF" where constructorRef = "sauber" and year = 1994;
update gpsSeasonConstructors set mainColor = "#222126", secondaryColor = "#FFFFFF" where constructorRef = "sauber" and year = 1993;

update gpsSeasonConstructors set mainColor = "#031D87", secondaryColor = "#FC181D" where constructorRef = "toro_rosso" and year between 2017 and 2018;
update gpsSeasonConstructors set mainColor = "#031D87", secondaryColor = "#CBB29A" where constructorRef = "toro_rosso" and year between 2006 and 2016;

update gpsSeasonConstructors set mainColor = "#1AA1DB", secondaryColor = "#FAFAFA" where constructorRef = "williams" and year between 2019 and 2019;
update gpsSeasonConstructors set mainColor = "#EAE4ED", secondaryColor = "#082957" where constructorRef = "williams" and year between 2014 and 2018;
update gpsSeasonConstructors set mainColor = "#252943", secondaryColor = "#FAFAFA" where constructorRef = "williams" and year between 2011 and 2013;
update gpsSeasonConstructors set mainColor = "#002F62", secondaryColor = "#FAFAFA" where constructorRef = "williams" and year between 2009 and 2010;
update gpsSeasonConstructors set mainColor = "#252943", secondaryColor = "#FAFAFA" where constructorRef = "williams" and year between 2000 and 2008;
update gpsSeasonConstructors set mainColor = "#8A1915", secondaryColor = "#E38F2A" where constructorRef = "williams" and year between 1998 and 1999;
update gpsSeasonConstructors set mainColor = "#06369F", secondaryColor = "#9B7B36" where constructorRef = "williams" and year between 1994 and 1997;
update gpsSeasonConstructors set mainColor = "#082398", secondaryColor = "#FFDA52" where constructorRef = "williams" and year between 1985 and 1993;
update gpsSeasonConstructors set mainColor = "#21352E", secondaryColor = "#FFDA52" where constructorRef = "williams" and year between 1983 and 1984;
update gpsSeasonConstructors set mainColor = "#FAFAFA", secondaryColor = "#21352E" where constructorRef = "williams" and year between 1977 and 1982;
update gpsSeasonConstructors set mainColor = "#B49663", secondaryColor = "#101010" where constructorRef = "williams" and year between 1976 and 1976;
update gpsSeasonConstructors set mainColor = "#FAFAFA", secondaryColor = "#DF2B3B" where constructorRef = "williams" and year between 1975 and 1975;
update gpsSeasonConstructors set mainColor = "#B10713", secondaryColor = "#FAFAFA" where constructorRef = "williams" and year between 1974 and 1974;
update gpsSeasonConstructors set mainColor = "#B10713", secondaryColor = "#101010" where constructorRef = "williams" and year between 1973 and 1973;

# 2020

update gpsSeasonConstructors set mainColor = "#8D1028", secondaryColor = "#FFFFFF" where constructorRef = "alfa" and year = 2020;
update gpsSeasonConstructors set mainColor = "#031D87", secondaryColor = "#FC181D" where constructorRef = "alphatauri" and year = 2020;
update gpsSeasonConstructors set mainColor = "#E00D19", secondaryColor = "#000000" where constructorRef = "ferrari" and year = 2020;
update gpsSeasonConstructors set mainColor = "#B49663", secondaryColor = "#000000" where constructorRef = "haas" and year = 2020;
update gpsSeasonConstructors set mainColor = "#FCA13B", secondaryColor = "#0D1D20" where constructorRef = "mclaren" and year = 2020;
update gpsSeasonConstructors set mainColor = "#18A19B", secondaryColor = "#D7D7D5" where constructorRef = "mercedes" and year = 2020;
update gpsSeasonConstructors set mainColor = "#F6AFC1", secondaryColor = "#283777" where constructorRef = "racing_point" and year = 2020;
update gpsSeasonConstructors set mainColor = "#021F48", secondaryColor = "#FDCC2F" where constructorRef = "red_bull" and year = 2020;
update gpsSeasonConstructors set mainColor = "#FEF336", secondaryColor = "#000000" where constructorRef = "renault" and year = 2020;
update gpsSeasonConstructors set mainColor = "#1AA1DB", secondaryColor = "#EAE4ED" where constructorRef = "williams" and year = 2020;

