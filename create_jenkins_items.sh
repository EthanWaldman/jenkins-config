#!/bin/bash
#
	JENKINS_CLI_CMD="java -jar /usr/local/share/applications/jenkins-cli.jar -s http://localhost:8080 -auth admin:`cat ~jenkins/secrets/initialAdminPassword`"
	for CONFIG_INPUT in *.xml
	do
		ITEM_TYPE=`basename ${CONFIG_INPUT} | cut -d'-' -f1`
		ITEM_NAME=`basename ${CONFIG_INPUT} | cut -d'-' -f2- \
			| cut -d'.' -f1`
		echo "Loading ${ITEM_TYPE}: ${ITEM_NAME}..."
		${JENKINS_CLI_CMD} create-${ITEM_TYPE} ${ITEM_NAME} < ${CONFIG_INPUT}
	done
	exit
