#
# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with
# this work for additional information regarding copyright ownership.
# The ASF licenses this file to You under the Apache License, Version 2.0
# (the "License"); you may not use this file except in compliance with
# the License.  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Use Java 8 image as default one.
FROM java:8

# Set Apache Ignite version.
ENV IGNITE_VERSION 2.7.0

# Set IGNITE_HOME variable.
ENV IGNITE_HOME /opt/ignite/apache-ignite-${IGNITE_VERSION}-bin

# Setting a path to an Apache Ignite configuration file. Used by run.sh script below.
ENV CONFIG_URI ${IGNITE_HOME}/config/example-kube.xml

# Make sure kubernetes lib is copied to 'libs' folder.
ENV OPTION_LIBS ignite-kubernetes

# Disabling quiet mode.
ENV IGNITE_QUIET=false

# Install or update needed tools.
RUN apt-get update && apt-get install -y --no-install-recommends unzip

# Creating and setting a working directory for following commands.
WORKDIR /opt/ignite

RUN curl https://dist.apache.org/repos/dist/release/ignite/${IGNITE_VERSION}/apache-ignite-${IGNITE_VERSION}-bin.zip -o ignite.zip \
    && unzip ignite.zip \
    && rm ignite.zip

# Copying the executable file and setting permissions.
#COPY ./run.sh $IGNITE_HOME/
#RUN chmod +x $IGNITE_HOME/run.sh

#COPY ./jackson-annotations-2.9.0.jar $IGNITE_HOME/libs
#COPY ./jackson-core-2.9.6.jar $IGNITE_HOME/libs
#COPY ./jackson-databind-2.9.6.jar $IGNITE_HOME/libs
#COPY ./jackson-dataformat-xml-2.8.5.jar $IGNITE_HOME/libs
#COPY ./jackson-module-jaxb-annotations-2.8.5.jar $IGNITE_HOME/libs
#COPY ./com.fasterxml.jackson.databind.jar $IGNITE_HOME/libs

#RUN chmod 755 $IGNITE_HOME/libs/*

RUN cd $IGNITE_HOME/config
RUN git clone https://github.com/MATRIX4284/ignite-kubernetes-config-repo

RUN cp ./ignite-kubernetes-config-repo/jackson-annotations-2.9.0.jar $IGNITE_HOME/libs
RUN cp ./ignite-kubernetes-config-repo/example-kube-rbac.xml $IGNITE_HOME/config
RUN cp ./ignite-kubernetes-config-repo/run.sh $IGNITE_HOME/

RUN chmod +x $IGNITE_HOME/run.sh


# Copying the configuration.
#COPY ./example-cache.xml $IGNITE_HOME/config
#COPY ./example-ignite.xml $IGNITE_HOME/config
#COPY ./example-data-regions.xml $IGNITE_HOME/config
#COPY ./example-default.xml $IGNITE_HOME/config

# Starting an Apache Ignite node.
CMD $IGNITE_HOME/run.sh

# Exposing the ports.
EXPOSE 11211 47100 47500 49112 8080 10800 10900


