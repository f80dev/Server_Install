#docker rm -f tryton-postgres
#docker rm -f tryton

docker run --name tryton-postgres -e POSTGRES_PASSWORD=hh4271 -e POSTGRES_DB=tryton -d postgres
docker run --link tryton-postgres:postgres -it tryton/tryton trytond-admin -d tryton --all
docker run --name tryton -p 8000:8000 --link tryton-postgres:postgres -d tryton/tryton
