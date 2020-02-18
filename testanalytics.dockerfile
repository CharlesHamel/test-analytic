FROM gcr.io/google-appengine/jetty
ADD target/test-analytics-1.0-SNAPSHOT.war $JETTY_BASE/webapps/root.war
WORKDIR $JETTY_BASE
RUN java -jar $JETTY_HOME/start.jar --approve-all-licenses --add-to-startd=jmx,stats,hawtio \
  && chown -R jetty:jetty $JETTY_BASE \
  && export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF8 \
  && apt-get update \
  && apt-get install -y --no-install-recommends apt-utils \
                                                curl \
                                                git \
  && apt-get purge -y maven \
  && curl -LOk https://repo.maven.apache.org/maven2/org/apache/maven/apache-maven/3.5.0/apache-maven-3.5.0-bin.tar.gz \
  && tar -zxf apache-maven-3.5.0-bin.tar.gz -C /usr/local/ \
  && ln -s /usr/local/apache-maven-3.5.0/bin/mvn /usr/bin/mvn \
  && git init . \
  && git remote add -t \* -f origin https://github.com/CharlesHamel/test-analytic.git \
  && git checkout master \
  && rm -f ~/.m2/repository/appengine-maven-plugin/*.lastUpdated \
  && mvn package \
  && mvn dependency:purge-local-repository
CMD ["mvn", "appengine:devserver"]

