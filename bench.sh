#!/bin/bash

bombardier --fasthttp -c 500 -d 10s http://localhost:3000/
bombardier --fasthttp -c 500 -d 10s http://localhost:3000/id/1?name=bun
bombardier --fasthttp -c 500 -d 10s -m POST -H 'Content-Type: application/json' -f ./body.json http://localhost:3000/json
