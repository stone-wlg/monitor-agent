#!/usr/bin/env bash

cd "$( dirname "${BASH_SOURCE[0]}" )"

docker run -it --rm stonewlg/monitor-agent:latest ash
