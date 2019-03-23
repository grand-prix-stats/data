# Grand Prix Stats Data Repository
Data backing Grand Prix Stats website and API.

## Data

This data repository is composed from multiple data sources, including third-parties, 
data collected from public domain, and data
programmatically derived from the former.

### Ergast F1 Database
Website: http://ergast.com/mrd/db/

This fantastic database provides most of the data
available in this repository. A mirror of the Ergast F1 database is provided in this repository.

[Ergast F1 DB Mirror Image (ergast-f1db.sql)](/ergast-f1db.sql)


## Cloning this Repository

```
$ git clone https://github.com/grand-prix-stats/data.git
```

### Available Commands

Download latest third-party databases and resources:
```
$ make download
```
