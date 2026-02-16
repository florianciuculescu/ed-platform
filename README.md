# ed-platform (Kafka + Postgres + Kafka UI)

This repository provides **local infrastructure** for the event-driven portfolio demo (Kafka-based microservices).

Starts everything with Docker Compose:
- **Kafka** (message broker)
- **Kafka UI** (web UI for inspecting topics/messages/consumer groups)
- **Postgres** (database used by the services)

This is **NOT** a Spring Boot application.  
It contains only Docker Compose + helper scripts.

---

## Why this repo exists

In a microservices setup, services depend on infrastructure (Kafka, DB, etc.).
Instead of installing these on your machine, we run them in Docker so:
- anyone can start the demo quickly
- the environment is reproducible
- the services (`order-service`, `payment-service`, etc.) can be run from IntelliJ/terminal

---

### Prerequisites

- Docker Desktop installed and running
- Docker Compose available (comes with Docker Desktop)

Check Docker:
```bash
docker version
docker compose version
```
---

### Start the platform

- Start the repo root:
```bash
./up.sh
```
What you should get:

- Kafka UI: http://localhost:8088
- Postgres exposed on port 5432
- Kafka exposed on port 9092

### Stop the platform (and remove the volumes)


```bash
./down.sh
```

---

Connection details:

Kafka

- Bootstrap servers (from host/mac): localhost:9092

Postgres

- JDBC URL: jdbc:postgresql://localhost:5432/portfolio
- user: postgres
- password: postgres

### Clean restart
```bash
./down.sh
./up.sh
```

---

### Related services (run separately)
This repo only starts infrastructure. The actual services run separately:

- order-service

  - exposes **POST /api/orders**
  - stores orders in Postgres
  - publishes **OrderCreated** events from Kafka
- payment-service
    
  - consumes **OrderCreated** events from Kafka