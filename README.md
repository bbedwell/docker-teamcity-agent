# TeamCity Agent With Docker

## Building

```bash
docker build -t teamcity-agent .
docker build -t teamcity-agent:awscli ./awscli
```

## Starting with docker support

```bash
docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --link teamcity:teamcity \
        --name teamcity-agent \
        teamcity-agent
```

## Environment Variables
#### `TEAMCITY_SERVER`
This variable specifies the path, relative to the agent container, in which to access the TeamCity server instance. Defaults to `http://teamcity:8111`
#### `DOCKER_VERSION`
This variable specifies the docker binary version to pull down (defaults to `1.10.0`)

## Starting with AWS CLI
```bash
docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v ~/.aws:/root/.aws \
        --link teamcity:teamcity \
        --name teamcity-agent \
        teamcity-agent:awscli
```
