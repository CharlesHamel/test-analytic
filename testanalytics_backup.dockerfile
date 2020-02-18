FROM ubuntu:18.04
MAINTAINER developer@cognibox.com
RUN apt-get update \
  && apt-get install -y -qq wget unzip python \
  && apt-get install -y --no-install-recommends apt-utils \
     git \
     openjdk-8-jdk \
     openjdk-8-jre \
     curl \
  && export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
  && apt-get purge -y maven \
  && curl -LOk https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.0/apache-maven-3.5.0-bin.tar.gz \
  && tar -zxf apache-maven-3.5.0-bin.tar.gz -C /usr/local/ \
  && ln -s /usr/local/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
  && git init . \
  && git remote add -t \* -f origin https://github.com/CharlesHamel/test-analytic.git \
  && git checkout master \
  && wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip \
  && google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc \
  && mvn package
EXPOSE 8080
CMD ["EXPOSE", "8080"]
CMD ["mvn", "appengine:devserver"]
