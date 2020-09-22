# Homepage

## Setup

```shell
rbenv install
bundle install
nodenv install
npm install -g gulp
middleman serve
```

## Deploy

```shell
cp .env-example .env
middleman s3_sync --build
```
