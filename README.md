# Proyecto Bases de Datos Avanzadas
## **Aplicación Web: Restaurante " Mi Comidita "**
##### *Luis Barajas Pérez - A01370934 , Mauricio Rico Zavala - A01370874 y Daniel Tapia A01022285*
###### 09 - 05 - 18
---
### Manual de Instalación:
1. Clonar el repositorio 
    - Copiar el link de Clone or download
    - Dirigirse a la terminal, entrar al folder en el cual se desea tener la aplicación y correr el comando:
        - `$ git clone (link)`
2. Correr en la terminal los siguiente comandos:
    1. `$ docker-compose up --build`
En otra terminal ejecutamos los siguientes comandos:
    2. `$ docker-compose run website rails neo4j:migrate`
    3. `$ docker-compose run website rails neo4j:seed`
    4. `$ docker-compose run website bundle exec wheneverize`
### Manual de Usuario:
Una vez completados los pasos de Instalacion, podemos abrir la aplicacion en http://localhost:3000/ y la pantalla que debemos observar es la siguiente:
![alt text](Restaurante-MiComidita/img/Captura de pantalla 2018-05-09 a la(s) 11.18.14.png)
### Descripción trabajo realizado:

&nbsp;&nbsp;&nbsp;&nbsp; Para llevar a cabo este proyecto, se le requirió al equipo construir una aplicación web de cualquier tipo en la que se pudiera utilizar la plataforma de bases de datos en forma de grafos de Neo4j. En nuestro equipo decidimos implementar esta herramienta de bases de datos con una aplicación web construida en Ruby on Rails. Poder desarrollar una aplicación en Rails nos permite establecer el back-end de la apliación de una manera más sencilla e integrar la logísitica de Neo4j directamente al app. Es importante considerar que mucho del trabajo que se tiene que hacer para organizar una base de datos de Neo4j es arreglado por el framework de la aplicación entonces la organización entre pantalla e información de la base.
&nbsp;&nbsp;&nbsp;&nbsp; El principal trabajo realizado para la aplicación es organizar la relación entre los requests que los usuarios harán mediante las herramientas de la aplicación a nuestra base de datos Neo4j.


<!-- ###### Database
This application uses Neo4j to power the database. The local instance for the database has to be listening in the port 7474 of your localhost. Also you will have to run the `$ bundle exec figaro install` command in order to generate the application.yml file, necessary for your private login username and password. After running it go to config/application.yml and configure the `DB_USERNAME: "(your username here)"` and the `DB_PASSWORD: "(your password here)"` variables. -->
