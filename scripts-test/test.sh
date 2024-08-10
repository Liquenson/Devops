#!/bin/bash

docker images --format "{{.Repository}}" | sort | uniq
