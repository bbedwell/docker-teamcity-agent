# TeamCity Agent With Docker

This container is TeamCity agent that has access to the hosts docker socket for dind (docker in docker)

## Starting with docker support

```bash
docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        --link teamcity:teamcity \
        --name teamcity-agent \
        bbedwell/teamcity-agent:latest
```

## Starting with AWS CLI
For added AWS CLI support, use the `awscli` tag
```bash
docker run -d \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -v ~/.aws:/root/.aws \
        --link teamcity:teamcity \
        --name teamcity-agent \
        bbedwell/teamcity-agent:awscli
```

## Environment Variables
#### `TEAMCITY_SERVER`
This variable specifies the path, relative to the agent container, in which to access the TeamCity server instance. Defaults to `http://teamcity:8111`
