#!/bin/bash

echo "docker run -v "$PWD":/home/rstudio -p 8787:8787 -e DISABLE_AUTH=true rocker/rstudio" 
docker run -v "$PWD":/home/rstudio -p 8787:8787 -e DISABLE_AUTH=true rocker/rstudio
