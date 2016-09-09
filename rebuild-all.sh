make
rm -r pgdata/*
docker-compose up -d postgis
sleep 10
docker-compose run import-external
docker-compose run import-osm
docker-compose run import-sql

rm export/tiles.mbtiles
docker-compose run -e BBOX="-180,-90,180,90" -e MIN_ZOOM="0" -e MAX_ZOOM="14" export
