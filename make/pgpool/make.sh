echo ">>> Making pgpool"

for VALS in "PGPOOL_VERSION=3.7 PGPOOL_PACKAGE_VERSION=3.7.5-2.pgdg80+1";  do
    eval $VALS
    
    for PG_CLIENT_VERSION in 10; do
        VALS="$VALS PG_CLIENT_VERSION=$PG_CLIENT_VERSION PG_CLIENT_LATEST=1"

        FILE_FROM="./src/includes/dockerfile/pgpool.part.Dockerfile"
        FILE_TO="./src/pgpool.dockerfile"
        
        template $FILE_FROM $FILE_TO $VALS
    done
done
unset PGPOOL_VERSION PGPOOL_PACKAGE_VERSION VALS
