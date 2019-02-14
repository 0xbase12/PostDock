echo ">>> Making postgres"


for VALS in "POSTGRES_VERSION=10 REPMGR_VERSION=4.2 REPMGR_SYNTAX_V4=1 REPMGR_PACKAGE_VERSION=4.2.0-1.pgdg+1 POSTGIS_VERSION=2.5"; do
    eval $VALS
    FILE_FROM="./src/includes/dockerfile/postgis.part.Dockerfile"

    VALS="POSTGRES_VERSION=$POSTGRES_VERSION"
    FILE_TO="./src/postgis.dockerfile"

    template $FILE_FROM $FILE_TO $VALS

    unset REPMGR_SYNTAX_V4 REPMGR_SYNTAX_V3 POSTGRES_VERSION REPMGR_VERSION REPMGR_PACKAGE_VERSION
done
