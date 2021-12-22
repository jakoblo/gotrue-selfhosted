# gotrue-selfhosted

This is a Docker Compose setup for self-hosting Supabase/Netlify [GoTrue](https://github.com/supabase/gotrue).

## Before you begin
You need:
- Docker and Docker Compose installed
- Git

## Quick Start

### Local Dev Environment:
```
# Clone the repository
git clone https://github.com/majorgyb/gotrue-selfhosted

# Go to the docker folder
cd gotrue-selfhosted

# Start
docker-compose --env-file ./.env.example up 

```

### Production Environment
```
# Clone the repository
git clone https://github.com/majorgyb/gotrue-selfhosted

# Go to the docker folder
cd gotrue-selfhosted

# Copy the example env vars and CHANGE them for your prod env
cp .env.example .env

# Start
docker-compose up
```