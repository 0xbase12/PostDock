echo ">>> Making docker-compose"

FILE_FROM='./src/includes/docker-compose/docker-compose.yml'
for POSTGRES_VERSION in 10; do
    for REPMGR_VERSION in 3.3; do
        for PGPOOL_VERSION in 3.7; do
            for BARMAN_VERSION in 2.5; do
                PGPOOL_POSTGRES_CLIENT_VERSION="$POSTGRES_VERSION"
                BARMAN_POSTGRES_CLIENT_VERSION="$POSTGRES_VERSION"
                VALS="POSTGRES_VERSION=$POSTGRES_VERSION PGPOOL_VERSION=$PGPOOL_VERSION BARMAN_VERSION=$BARMAN_VERSION REPMGR_VERSION=$REPMGR_VERSION PGPOOL_POSTGRES_CLIENT_VERSION=$PGPOOL_POSTGRES_CLIENT_VERSION BARMAN_POSTGRES_CLIENT_VERSION=$BARMAN_POSTGRES_CLIENT_VERSION"

                FILE_TO="./docker-compose/docker-compose.yml"
                template $FILE_FROM $FILE_TO $VALS
            done
        done
    done
done
