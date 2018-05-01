# KyClimber

Parcours : Développeur d'application Java /JEE  
Projet 6 : Site communautaire autour de l'escalade  

## Architecture

- **MAVEN** (multi-modules) :  
   * [ business ] : Couche métier (services de persistence)  
   * [ model ] : Entités (beans)  
   * [ webapp ] : Application web

## Frameworks et API

- **Apache STRUTS 2.5**
- **Spring Framework 4.3**
- **Hibernate 5.2** (JPA 2.1)
- **Log4j 2.10.0**

## Persistence

- **PostgreSQL 9.6**  (Driver 42.2.2)

La modification des informations de connection à la base de données doit être réalisée dans le fichier de configuration XML nommé "persistence.xml" (kyclimber/webapp/src/main/resources/META-INF/persistence.xml)

## Description

L'application propose la consultation de différents sites d'escalade classés par régions (France uniquement) avec une indexation de topos (enregistrés par des utilisateurs), la possibilité de laisser des commentaires (après authentification) et de réaliser une recherche multi-critères.

Un profil utilisateur est également proposé avec la possibilité de :
- renseigner des informations de localisation (pour l'échange de topos)
- sélectionner un avatar (affiché avec les commentaires)
- gérer l'ajout, la suppression et l'échange d'un topo
- modifier ou supprimer un commentaire

## Contact (Yan)

- E-mail : [nslr@riseup.net](mailto:nslr@riseup.net)
- Twitter : [https://twitter.com/FiendKyBox](https://twitter.com/FiendKyBox)
- Linkedin : [https://www.linkedin.com/in/kybox](https://www.linkedin.com/in/kybox)
