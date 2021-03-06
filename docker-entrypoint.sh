#!/bin/bash

while ! PGPASSWORD=gnaf psql -h db -U gnaf -l >/dev/null; do
  echo "** Waiting for PostgreSQL to start up and be ready for queries. **"
  sleep 5
done

echo "** Launching loader **"
python load-gnaf-27.py --gnaf-tables-path /data/*GNAF_PipeSeparatedValue*/ --admin-bdys-path /data/ --pghost db --pgdb gnaf --pguser gnaf --pgpassword gnaf
