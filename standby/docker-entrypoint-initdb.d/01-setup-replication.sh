# This script must be sourced. It is thus not executable.

pg_ctl stop --wait

find "${PGDATA}" -mindepth 1 -delete

pg_basebackup \
    -R \
    -d postgresql://replicator:replicatorpass@primary \
    -D "${PGDATA}"

# Turn temp_server_stop into a no-op, since we've already stopped it
docker_temp_server_stop() {
  :
}
