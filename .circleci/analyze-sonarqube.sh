#!/bin/bash
#################################################
# based on https://github.com/Sagacify/ci-tools
#################################################

SONAR_VERSION="sonar-scanner-cli-3.0.3.778"
SONAR_DIR="sonar-scanner-3.0.3.778"

wget -P $HOME -N "https://sonarsource.bintray.com/Distribution/sonar-scanner-cli/${SONAR_VERSION}.zip"
unzip -d $HOME $HOME/$SONAR_VERSION.zip

DEFAULT_SONAR_PARAMS="-Dsonar.login=$SONAR_TOKEN \
                      -Dsonar.projectName=$CIRCLE_PROJECT_REPONAME \
                      -Dsonar.projectVersion=$CIRCLE_BUILD_NUM"

if [ "$CIRCLE_BRANCH" == "master" ]; then
    echo "Analyzing ${CIRCLE_BRANCH} branch to push issues to SonarQube server"
    $HOME/$SONAR_DIR/bin/sonar-scanner $DEFAULT_SONAR_PARAMS \
    -Dsonar.projectKey=$CIRCLE_PROJECT_USERNAME:$CIRCLE_PROJECT_REPONAME;
