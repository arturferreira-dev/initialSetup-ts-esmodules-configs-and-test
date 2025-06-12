FROM node:22.14.0-alpine AS builder

WORKDIR /appbuilder
COPY . .
RUN npm ci
RUN npm run build


FROM node:22.14.0-alpine AS runner

WORKDIR /app
COPY --from=builder /appbuilder/dist ./
COPY --from=builder /appbuilder/*.json ./
COPY --from=builder /appbuilder/node_modules ./node_modules

CMD ["npm", "start"]