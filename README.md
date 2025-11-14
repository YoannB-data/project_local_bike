# Modélisation des données d'une entreprise de magasin de vélos

# Contexte du projet

L'entreprise Local Bike est une entreprise qui vend des vélos dans 3 villes aux Etats-Unis : Santa Cruz (CA), Baldwin (NY) et Rowlett (TX).
Elle souhaite développer son premier tableau de bord et se lancer dans l'exploitation de ses données. 

L'objectif est de fournir des insights stratégiques permettant d'optimier les processus, de maximiser les ventes et d'accroitre les revenus.
Local Bike souhaite ainsi devenir plus performante et data-driven.

En tant qu'Analytics Engineer, il nous est demandé de modéliser les données pour permettre cette transition.

# Structure des données & Vérifications initiales

Les diagramme entités-relations de l'entreprise Local Bike est le suivant :

<p align="center">
  <img width="658" height="531" alt="image" src="https://github.com/user-attachments/assets/8da02844-1934-4cf6-8634-c5d3e6f40ec4" />
</p>

# Modélisation des données

## Cible

Nous allons mettre en place une architecture en médaillon.

La couche mart, à destination des équipes métiers, sera constitué de 4 modèles, pour 4 visions statégiques :
* Une vision par client, avec le nombre de commande, les sommes totals dépensées et la moyenne par commande et la durée de vie du client
* Une vision par produit, avec les quantités vendues, les revenus générés et son stock
* Une vision par magasin, avec les quantités vendues, les revenus générés et son stock
* Une vision des performance quotidienne, avec le nombre de commande, les quantités vendues, le total des revenus et la moyenne des revenus

Un modèle supplémentaire a été développé pour créer l'analyse ABC par produit (méthode de classification découlant du principe de Pareto, la catégorie A regroupant 5% des produits qui génère 40% des revenus, catégorie B avec 20% des produits pour 80% des revenus, le reste étant en C).

## Mise en place de la modélisation 

### Staging (couche Bronze)
Création d'un modèle par table de données :
* Nettoyage rapide des données
* Normalisation des types
* Suppression des doublons
* Création des clés primaire

### Intermediate (couche Silver)
Enrichissement des données :
* Enrichissement des tables les plus importantes, en vue en préparation de la couche Gold
* Premiers calculs

### Mart (couche Gold)
Création des modèles pour les dashboards :
* Aggrégation des données
* Croisements complexes
* Calculs plus pertinents pour les métiers
