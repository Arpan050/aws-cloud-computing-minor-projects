FROM node:24-alpine

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

COPY --chown=node:node app.js ./app.js

USER node
EXPOSE 3000

CMD ["node", "app.js"]
