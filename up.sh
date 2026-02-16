#!/usr/bin/env bash
set -e
docker compose up -d
echo "Kafka UI: http://localhost:8088"
echo "Postgres: jdbc:postgresql://localhost:5432/portfolio (user=postgres, pass=postgres)"
