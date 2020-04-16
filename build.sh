#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

docker image rm stonewlg/monitor-agent:latest
docker build -t stonewlg/monitor-agent:latest .
