FROM bbedwell/teamcity-agent

RUN apk add --update python py-pip \
	&& pip install --upgrade awscli

VOLUME ${HOME}/.aws
