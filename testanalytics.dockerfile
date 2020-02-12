FROM ubuntu:18.04
MAINTAINER developer@cognibox.com
EXPOSE 8080
RUN apt-get update \
  && apt-get upgrade \
  && apt-get update
  && apt-get install -y --no-install-recommends \
  	git \
	openjdk-8-jdk \
	openjdk-8-jre \
	jetty9 \
	curl \
	&& apt-get purge -y maven \
	&& curl -LOk https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.0/apache-maven-3.5.0-bin.tar.gz \
	&& tar -zxf apache-maven-3.5.0-bin.tar.gz -C /usr/local/ \
	&& ln -s /usr/local/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
	&& git clone https://github.com/CharlesHamel/test-analytic.git testanalytics \
	&& cd testanalytics \
	&& export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
	&& systemctl start jetty9
CMD ["mvn", "package"]
CMD ["mvn", "appengine:devserver"]


