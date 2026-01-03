# --- Build Stage ---
FROM node:22-alpine AS builder

# Install pnpm
RUN npm install -g pnpm@10.20.0

WORKDIR /app

# Copy lockfile and package files
COPY pnpm-lock.yaml* pnpm-workspace.yaml package.json ./
COPY apps/home-assistant-matter-hub/package.json ./apps/home-assistant-matter-hub/
COPY packages/backend/package.json ./packages/backend/
COPY packages/common/package.json ./packages/common/

# Install dependencies
RUN pnpm install --frozen-lockfile

# Copy source code
COPY . .

# Build the application
RUN pnpm run build

# --- Production Stage ---
FROM node:22-alpine

ENV HAMH_STORAGE_LOCATION="/data"
ENV NODE_ENV=production

WORKDIR /app

# Install pnpm for running the production script if needed, 
# or we can just run the bundled file.
RUN npm install -g pnpm@10.20.0

# Copy necessary files from builder
COPY --from=builder /app /app

# Expose ports
# Web UI
EXPOSE 8482
# Matter (TCP/UDP)
EXPOSE 5540/tcp
EXPOSE 5540/udp

# Define volume for persistent data
VOLUME ["/data"]

# Start the application
CMD ["pnpm", "--filter", "home-assistant-matter-hub", "run", "start"]
