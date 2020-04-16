FROM alpine:latest

COPY ./prometheus-javaagent /agent/prometheus-javaagent
COPY ./skywalking-agent /agent/skywalking-agent
