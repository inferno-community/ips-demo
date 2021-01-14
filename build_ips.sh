#!/bin/sh

read -p "Ready to build dynamic-fhir-servers? "

rm -rf dynamic-fhir-servers

git clone --single-branch --branch ips_artifacts https://github.com/inferno-community/dynamic-fhir-servers

read -p "Ready to build client-fhir-testing? "

rm -rf client-fhir-testing

git clone --single-branch --branch dockerize https://github.com/inferno-community/client-fhir-testing

read -p "Ready to run everything? "

# Run docker stuff
docker-compose pull
docker-compose up --build -d --force-recreate
sleep 20 && docker-compose exec dfs bin/setup_db.sh
echo "IPS services are now running!"
