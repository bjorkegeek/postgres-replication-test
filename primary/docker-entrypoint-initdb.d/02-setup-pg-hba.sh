#!/bin/sh

ACTUAL_FILE=/var/lib/postgresql/data/pg_hba.conf
TEMP_FILE=/tmp/pg_hba.conf

(
    # Keep all existing comments
    grep -E '^#' "${ACTUAL_FILE}"
    echo "host replication replicator samenet scram-sha-256"
    echo "host all replicator all reject"
    echo "host all all all scram-sha-256"
) > "${TEMP_FILE}"

for cmd in chcon chmod chown
do
    $cmd --reference "${ACTUAL_FILE}" "${TEMP_FILE}"
done

mv "${TEMP_FILE}" "${ACTUAL_FILE}"

