FROM metabase/metabase:latest

ARG environment
ARG repo

ENV AWS_ENV_PATH=/$repo/$environment/
ENV AWS_REGION=us-east-1

RUN apk update && apk upgrade && apk add --no-cache curl openssl ca-certificates wget
RUN apk add --no-cache tzdata
ENV TZ America/Recife

RUN curl -sSL https://github.com/Droplr/aws-env/raw/master/bin/aws-env-linux-amd64 -o aws-env && chmod +x aws-env

RUN eval $(./aws-env)