#!/bin/bash

echo "docker run -v "$PWD":/home/rstudio -p 8787:8787 -e DISABLE_AUTH=true rocker/rdocker_new" 
docker run -v "$PWD":/home/rstudio -p 8787:8787 -e DISABLE_AUTH=true rocker/rdocker_new
