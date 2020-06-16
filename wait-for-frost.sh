#!/bin/bash

RET=1
while [ $RET -ne 0 ]; do
        wget --spider --tries 1 --timeout 1 \
        	http://web:8080/FROST-Server/v1.0 \
        	--quiet --output-document - > /dev/null
        RET=$?
        sleep 1
done

PGPASSWORD="$POSTGRES_PASSWORD" psql -h "database" -p "5432" \
	-U $POSTGRES_USER $POSTGRES_DB \
	-c 'ALTER TABLE public."OBSERVATIONS" ADD CONSTRAINT OBSERVATIONS_UNIQUE UNIQUE ("DATASTREAM_ID", "RESULT_TIME");'

echo "Database constraint added."
