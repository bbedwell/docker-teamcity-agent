#!/usr/bin/env bash

AGENT_DIR="${HOME}/agent"

if [ ! -d "$AGENT_DIR" ]; then
	cd ${HOME}
	echo "Setting up agent at ${AGENT_DIR}"
	mkdir -p $AGENT_DIR
	wget --progress=bar:force $TEAMCITY_SERVER/update/buildAgent.zip
	unzip -q -d $AGENT_DIR buildAgent.zip
	rm buildAgent.zip
	chmod +x $AGENT_DIR/bin/agent.sh
	echo "serverUrl=${TEAMCITY_SERVER}" > $AGENT_DIR/conf/buildAgent.properties
	echo "name=" >> $AGENT_DIR/conf/buildAgent.properties
	echo "workDir=../work" >> $AGENT_DIR/conf/buildAgent.properties
	echo "tempDir=../temp" >> $AGENT_DIR/conf/buildAgent.properties
	echo "systemDir=../system" >> $AGENT_DIR/conf/buildAgent.properties
else
	echo "Found agent at ${AGENT_DIR}"
fi
$AGENT_DIR/bin/agent.sh run
