Google Test Analytics
=================

This is a fork of the [Google Test Analytics project](https://testing.googleblog.com/2011/10/google-test-analytics-now-in-open.html).

How to run Google Test Analytics
----------------

Using the container
----------------
You need [Docker Compose](https://docs.docker.com/compose/) to build this project.

    docker-compose build testanalytics
    docker-compose up testanalytics

#### OR

How to build?
----------------
You need [Maven](https://maven.apache.org/) to build this project.

1. Clone this repo
2. Run 
>mvn package

How to run a development server?
-----------------

You can take a tour through test-analytics-ng by deploying it to a local Jetty instance.

>mvn appengine:devserver

Navigate to http://localhost:8080
The admin console is running at http://localhost:8080/_ah/admin


Requirements
-----------------

I have successfully built and run this version of test-analytics using Java 8 and Maven 3.5. It does **not** build with newer versions of Java. There is a [pull request](https://github.com/martinschneider/google-test-analytics/pull/1) to upgrade the underlying frameworks and support Java 13. Feel free to contribute!

Deploying test-analytics-ng in AppScale
-------

AppScale (http://www.appscale.com/) is an open-source GAE (Google App Engine) implementation. You can deploy and use test-analytics-ng in it.

How-to coming soon. 