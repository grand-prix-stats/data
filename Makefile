
all: download import migrate dump

download:
	@echo "Downloading mirror of Ergast F1 DB..."
	curl -O "http://ergast.com/downloads/f1db.sql.gz"
	gunzip -k -f f1db.sql.gz
	mv f1db.sql.gz db/ergast-f1db.sql.gz

resetdb:
	@echo "Resetting MySQL f1stats database..."
	mysql < sql/setupdb.sql

import:
	echo "Importing Ergast F1 DB..."
	mysql --default-character-set=utf8mb4 f1stats < f1db.sql

migrate:
	scripts/migrate.sh

dump:
	mysqldump -u root f1stats > db/grand-prix-stats.sql
	tar -czvf db/grand-prix-stats.sql.tar.gz db/grand-prix-stats.sql

convert:
	scripts/convertdb.sh

