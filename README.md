Test Analytics
=================

Fork du projet [Google Test Analytics](https://testing.googleblog.com/2011/10/google-test-analytics-now-in-open.html).

Test Analytics comprend deux parties principales: d'abord et avant tout, c'est un outil étape par étape pour créer une matrice ACC qui est plus rapide et beaucoup plus simple que les feuilles de calcul Google que nous utilisions avant que l'outil n'existe. Il fournit également des visualisations de la matrice et des risques associés à vos capacités ACC qui étaient difficiles ou impossibles à faire dans une simple feuille de calcul.

Pour un projet de taille moyenne, une panne initiale de l'ACC peut prendre de 20 minutes à une heure. Pendant ce temps, vous définirez les trois parties du modèle ACC pour votre projet: Attributs, Composants et Capacités.


Comment exécuter Test Analytics
----------------

Dans un container (Recommandé)
----------------
Vous avez besoin de [Docker Compose](https://docs.docker.com/compose/) pour build ce projet.

    docker-compose build testanalytics
    docker-compose up testanalytics

#### OU ALORS

Comment faire le build?
----------------
Vous avez besoin de [Maven](https://maven.apache.org/) pour build ce projet.

1. Clonez ce repo
2. Run
>mvn package

Comment exécuter sur un serveur de développement?
-----------------

You can take a tour through test-analytics-ng by deploying it to a local Jetty instance.

>mvn appengine:devserver

Aller vers http://localhost:8080
La console d'administration s'exécute sur http://localhost:8080/_ah/admin


Requis
-----------------

Cette version de test-analytics se crée et s'exécute en utilisant Java 8 et Maven 3.5. Il ne ** build ** pas avec les nouvelles versions de Java. Il existe une [pull request] (https://github.com/martinschneider/google-test-analytics/pull/1) pour mettre à niveau les frameworks sous-jacents et prendre en charge Java 13. N'hésitez pas à contribuer!

Veuillez noter que cette version a complètement été traduite en français

Déploiement de test-analytics-ng dans AppScale
-------

AppScale (http://www.appscale.com/) est une implémentation open source GAE (Google App Engine). Vous pouvez y déployer et utiliser test-analytics-ng.
