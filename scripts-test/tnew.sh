#!/bin/bash

docker images | awk 'NR>1 {print $1}'