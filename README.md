# KyClimber

Parcours : Développeur d'application Java /JEE  
Projet 6 : Site communautaire autour de l'escalade  

## Architecture

- **MAVEN** (multi-modules)

## Frameworks

- **Apache STRUTS 2.5**
- **Spring Framework 4.3**

## Persistence

- **Hibernate 5.2** (JPA 2.1)
- **PostgreSQL 9.6**  

La modification des informations de connection à la base de données doivent être réalisée dans le fichier de configuration XML nommé "persistence.xml" (kyclimber/webapp/src/main/resources/META-INF/persistence.xml)

## Description

L'application propose la consultation de différents sites d'escalade classés par régions (France uniquement) avec une indexation de topos (enregistrés par des utilisateurs), la possibilité de laisser des commentaires (après authentification) et de réaliser une recherche multi-critères.

Un profil utilisateur est également proposé avec la possibilité de :
- renseigner des informations de localisation (pour l'échange de topos)
- sélectionner un avatar (affiché avec les commentaires)
- gérer l'ajout, la suppression et l'échange d'un topo
- modifier ou supprimer un commentaire
