FROM ubuntu:18.04
MAINTAINER developer@cognibox.com
RUN apt-get update \
  && apt-get install -y -qq wget unzip python \
  && apt-get install -y --no-install-recommends apt-utils \
     git \
     openjdk-8-jdk \
     openjdk-8-jre \
     curl \
  && apt-get purge -y maven \
  && curl -LOk https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.0/apache-maven-3.5.0-bin.tar.gz \
  && tar -zxf apache-maven-3.5.0-bin.tar.gz -C /usr/local/ \
  && ln -s /usr/local/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
  && git init . \
  && git remote add -t \* -f origin https://github.com/CharlesHamel/test-analytic.git \
  && git checkout master \
  && export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
  && mvn package
CMD ["mvn", "appengine:devserver"]
