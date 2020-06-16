# Overview

- prometheus javaagent version: 0.12.0
- skywalking agent version: 8.0.0

# Usage

> scripts

```bash
./build.sh
./push.sh

docker tag stonewlg/monitor-agent:latest harbor06.chint.com/chint-public/monitor-agent:latest
docker push harbor06.chint.com/chint-public/monitor-agent:latest
```

> k8s yaml

```yaml
  initContainers:
  - name: init-agent
    image: stonewlg/monitor-agent:latest
    imagePullPolicy: IfNotPresent
    command: ["cp", "-r", "/agent", "/tmp/agent"]
    volumeMounts:
    - name: agent
      mountPath: /tmp/agent
  
  containers:
  - name: app
    env:
    - name: "JAVA_AGENT"
      value: "-javaagent:/agent/skywalking-agent/skywalking-agent.jar"
    - name: "SW_AGENT_NAME"
      value: "app"
    - name: "SW_AGENT_COLLECTOR_BACKEND_SERVICES"
      value: "127.0.0.1:11800"  
    volumeMounts:
    - name: agent
      mountPath: /agent
      subPath: agent  

  volumes:
  - name: agent
    emptyDir: {}

```