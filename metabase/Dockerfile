FROM metabase/metabase:latest

ARG environment
ARG repo

ENV AWS_ENV_PATH=/$repo/$environment/
ENV AWS_REGION=us-east-1

RUN apk update && apk upgrade && apk add --no-cache curl openssl ca-certificates wget
RUN apk add --no-cache tzdata
ENV TZ America/Recife

RUN curl -sSL https://github.com/eriksonlima-org/aws-env/raw/main/aws-env-linux -o aws-env && chmod +x aws-env

CMD eval $(./aws-env --formatInput=json)