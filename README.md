# Deno Express API
_______________________________________________________________________________

## Setup Guide

Install the project dependencies

```bash
deno install
```
_______________________________________________________________________________

Open the project directory in a separate terminal and run this command 
to start the server

```bash
deno task dev
```
_______________________________________________________________________________

## API Testing with Hurl

Open the project directory in a separate terminal and navigate 
to the the `api-testing directory`

_______________________________________________________________________________

### GET requests

_______________________________________________________________________________

/

```bash
hurl root_get.hurl
```
_______________________________________________________________________________

/users

```bash
hurl users_get.hurl
```
_______________________________________________________________________________

### POST requests

/users

```bash
hurl users_post_missing_userid.hurl
```
_______________________________________________________________________________

/users

```bash
hurl --variable userId="f6bcf2a0-d606-4ca3-929f-9d3100e587e5" users_post.hurl
```
_______________________________________________________________________________

## Building a Docker image from the Dockerfile

Run this command

```bash
docker build -t deno-express-api:1.0.0 .
```
_______________________________________________________________________________

## Creating a container instance from the Dockerfile

```bash
docker run -d -p 127.0.0.1:3000:3000 \
    --name deno-express-api-instance-one \
    deno-express-api:1.0.0
```
_______________________________________________________________________________
