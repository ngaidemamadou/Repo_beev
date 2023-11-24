Voici une petite explication de comment fonctionne le code: 


1. Contexte :

L'objectif était de comprendre les parts de marché automobile dans plusieurs pays en utilisant une base de données virtuelle.

2. Étapes :

Installation des Bibliothèques : J'ai installé les bibliothèques nécessaires  SQLAlchemy, Psycopg2-binary) pour  se connecter à la base de données PostgreSQL.

Import des Bibliothèques et Chargement des Données : J'ai utilisé Pandas pour charger les données des voitures et des consommateurs depuis des fichiers CSV.

Traitement des Données : J'ai remarqué un problème avec les noms de colonnes dans les données des consommateurs(sonsumers_data). J'ai sauté la première ligne et renommé les colonnes pour avoir une table propre et bien établie.

Connexion à la Base de Données : J'ai établi une connexion à la base de données PostgreSQL (test_db) en utilisant SQLAlchemy. Une vérification a été effectuée pour assurer la réussite de la connexion.

Insertion des Données : Les données des voitures et des consommateurs ont été insérées dans les tables correspondantes de la base de données PostgreSQL.

Analyse Bonus - Graphique : J'ai écrit une requête SQL pour compter le nombre de voitures électriques et thermiques vendues chaque année. Les résultats ont été utilisés pour créer un graphique illustrant cette information.

3. Remarques :


- Le fichier CSV des consommateurs(consumers_data) a nécessité un traitement pour corriger les noms de colonnes.

- j'ai eu quelques diffultés lors de l'installation de docker, il a fallu que je reinstalle le WSL. 



![WSL](https://hackmd.io/_uploads/BktUaZR4p.jpg)


