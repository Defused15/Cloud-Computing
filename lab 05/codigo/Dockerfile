# Imagen base: servidor web Apache
FROM httpd:2.4

# Código de la aplicación en el directorio que sirve Apache
COPY index.html /usr/local/apache2/htdocs/

EXPOSE 80

# Punto de montaje del volumen
VOLUME /usr/local/apache2/htdocs/
