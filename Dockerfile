# Build phase
FROM node:alpine as builder
WORKDIR '/app'

# don't need volumes because no longer code changes needed
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# Run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

