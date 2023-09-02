# Create a custom image
FROM node:18
WORKDIR /app
# . means work directory
COPY package.json .
ARG NODE_ENV
RUN if [ "$NODE_ENV" = "development" ]; \
        then npm install; \
        else npm install --only production; \
        fi

COPY . ./
ENV PORT 3000
EXPOSE $PORT
CMD [ "node", "index.js" ]


