#!/bin/bash

echo "----- Get (/) -----"
curl -X GET http://localhost:3000
echo ""
echo "----- Get (/id) -----"
curl -X GET http://localhost:3000/id/3?name=bun -v
echo ""
echo "----- Post (json) -----"
curl -X POST -d @body.json http://localhost:3000/json
echo ""

