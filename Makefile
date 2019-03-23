
download:
	@echo "Downloading mirror of Ergast F1 DB..."
	curl -O "http://ergast.com/downloads/f1db.sql.gz"
	gunzip -k -f f1db.sql.gz
	mv f1db.sql mirror/ergast-f1db.sql
	rm f1db.sql.gz

resetdb:
	@echo "Resetting MySQL f1stats database..."
	mysql < sql/setupdb.sql

import:
	scripts/import.sh
