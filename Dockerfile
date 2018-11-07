FROM alpine AS git

RUN apk add -U git && \
    git clone https://github.com/Siot/PaWebControl.git


FROM node:11-alpine

EXPOSE 8000

COPY --from=git /PaWebControl /app

WORKDIR /app

RUN npm install && \
    npm run build

CMD ["run", "start"]
ENTRYPOINT ["npm"]
