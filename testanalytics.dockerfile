FROM ubuntu:18.04
MAINTAINER developer@cognibox.com
EXPOSE 8080
RUN apt-get update \
  && apt-get upgrade \
  && apt-get install -y -qq wget python unzip
  && apt-get install -y --no-install-recommends \
  	git \
	openjdk-8-jdk \
	openjdk-8-jre \
	curl \
	&& apt-get purge -y maven \
	&& curl -LOk https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.0/apache-maven-3.5.0-bin.tar.gz \
	&& tar -zxf apache-maven-3.5.0-bin.tar.gz -C /usr/local/ \
	&& ln -s /usr/local/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
	&& git clone https://github.com/CharlesHamel/test-analytic.git testanalytics \
	&& cd testanalytics \
	&& export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8
RUN wget https://dl.google.com/dl/cloudsdk/channels/rapid/google-cloud-sdk.zip && unzip google-cloud-sdk.zip && rm google-cloud-sdk.zip
RUN google-cloud-sdk/install.sh --usage-reporting=true --path-update=true --bash-completion=true --rc-path=/.bashrc 
CMD ["mvn", "package"]
CMD ["mvn", "appengine:devserver"]
