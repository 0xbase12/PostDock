echo ">>> Making barman"

for VALS in "BARMAN_VERSION=2.5 BARMAN_PACKAGE_VERSION=2.5-1.pgdg90+1"; do
    eval $VALS

    for PG_CLIENT_VERSION in 10; do
        VALS="BARMAN_VERSION=$BARMAN_VERSION PG_CLIENT_VERSION=$PG_CLIENT_VERSION PG_CLIENT_LATEST=1"
        FILE_FROM="./src/includes/dockerfile/barman.part.dockerfile"
        FILE_TO="./src/barman.dockerfile"
        
        template $FILE_FROM $FILE_TO $VALS
    done
done
