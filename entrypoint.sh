#!/bin/sh
chown -R postgres "$PGDATA"

if [ -z "$(ls -A "$PGDATA")" ]; then
    gosu postgres initdb
    sed -ri "s/^#(listen_addresses\s*=\s*)\S+/\1'*'/" "$PGDATA"/postgresql.conf

    pass="PASSWORD '$PGPASS'"
    authMethod=md5

    createSql="CREATE DATABASE $PGDB;"
    echo $createSql | gosu postgres postgres --single -jE
    echo

    userSql="CREATE USER $PGUSER WITH SUPERUSER $pass;"
    echo $userSql | gosu postgres postgres --single -jE
    echo

    { echo; echo "host all all 0.0.0.0/0 $authMethod"; } >> "$PGDATA"/pg_hba.conf
fi

exec gosu postgres "$@"
