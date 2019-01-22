# Homepage

## Setup

```shell
nodenv install
rbenv install
bundle install
npm install -g gulp
middleman serve
```

## Deploy

```shell
cp .env-example .env
middleman s3_sync --build
```
