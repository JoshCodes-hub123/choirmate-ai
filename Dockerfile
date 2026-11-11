# MeyVu combined API + optical music recognition service.
# Build locally and verify memory use before deploying to a paid instance.
FROM node:22-bookworm-slim AS web-build
WORKDIR /app
COPY package*.json ./
RUN npm ci
COPY index.html vite.config.ts tsconfig.json ./
COPY src ./src
COPY public ./public
COPY server.ts ./
RUN npm run build

FROM python:3.11-slim-bookworm
ENV PYTHONDONTWRITEBYTECODE=1 \
    PYTHONUNBUFFERED=1 \
    NODE_ENV=production \
    PYTHON_SERVICE_URL=http://127.0.0.1:5001
RUN apt-get update && apt-get install -y --no-install-recommends \
    ffmpeg ghostscript libglib2.0-0 libgl1 libgomp1 ca-certificates curl \
    && rm -rf /var/lib/apt/lists/*
COPY --from=node:22-bookworm-slim /usr/local/bin/node /usr/local/bin/node
WORKDIR /app
COPY python/requirements.txt ./python/requirements.txt
RUN pip install --no-cache-dir -r python/requirements.txt
COPY python ./python
COPY --from=web-build /app/dist ./dist
COPY --from=web-build /app/node_modules ./node_modules
COPY package.json ./package.json
COPY docker-entrypoint.sh ./docker-entrypoint.sh
RUN chmod +x docker-entrypoint.sh
EXPOSE 3000
CMD ["./docker-entrypoint.sh"]
