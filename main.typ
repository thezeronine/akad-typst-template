#import "@preview/glossarium:0.5.6": gls, glspl
#import "@preview/acrostiche:0.5.2": acr, acrpl

#import "template/template.typ": template

#show: template

= Einleitung<h-intro>
#lorem(150)

== Unterüberschrift<h-heading>
#lorem(50)

= Hauptteil<h-main>
#lorem(50)

#figure(
  ```yaml
    app:
      build:
        context: .
        dockerfile: docker/Dockerfile
      volumes:
        - .:/var/www/html
        - ./docker/php.ini:/usr/local/etc/php/conf.d/custom.ini
      environment:
        - PHP_IDE_CONFIG=serverName=app
      ports:
        - "9000:9000"
      depends_on:
        - db
      networks:
        - app_network
      extra_hosts:
        - "host.docker.internal:host-gateway"
  ```,
  caption: [Service: app - PHP Runtime],
)<lst-docker-app>

= Schluss<h-outro>
#lorem(150)
