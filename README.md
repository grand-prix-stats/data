# Grand Prix Stats Data Repository
Data backing Grand Prix Stats website and API.

## Data

This data repository is composed from multiple data sources, including third-parties, 
data collected from public domain, and data programmatically derived from the former.

#### Features Included
- ✅ Full data from Ergast DB
- ✅ Driver, Constructor and Circuit nationalities with **emoji** flags (🇺🇸,🇪🇸,🇬🇧,🇩🇪...)
- ✅ Constructor (and driver) **colors** season by season (derived from car livery)
- ✅ Driver and Constructor **accruals** (season and career totals)
  - Wins, podiums, top 10 finishes, points, pole positions, fastest laps, participations, races finishes, etc
- ✅ Lap time **deltas**
- ✅ Laps led


## Sources

### Ergast F1 Database
Website: http://ergast.com/mrd/db/

This fantastic database provides most of the data
available in this repository. A mirror of the Ergast F1 database is provided in this repository.

[Ergast F1 DB Mirror Image (ergast-f1db.sql)](https://raw.githubusercontent.com/grand-prix-stats/data/master/mirror/ergast-f1db.sql)


## Download Grand Prix Stats Database
You can directly download the latest `f1stats` database dump available. 

[Download Grand Prix Stats Database (f1stats.sql)](https://raw.githubusercontent.com/grand-prix-stats/data/master/db/f1stats.sql)

If you wish to run these scripts on your machine, 
you can do it by cloning this repository:
```
$ git clone https://github.com/grand-prix-stats/data.git
```

### Available Commands

Download latest third-party databases and resources:
```
$ make download
```

Reset/create database:
```
$ make resetdb
```

Import data and compute accruals:
```
$ make import
```

Dump `f1stats` database:
```
$ make dump
```
