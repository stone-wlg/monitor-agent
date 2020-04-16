#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

docker image push stonewlg/monitor-agent:latest
