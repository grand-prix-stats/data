echo "Importing Ergast F1 DB..."
mysql --default-character-set=utf8mb4 f1stats < mirror/ergast-f1db.sql

for file in `ls sql/migrations/*.sql | sort -V`; do
    echo "Running migration: $file";
    mysql --default-character-set=utf8mb4 f1stats < $file;
done;