FROM ubuntu

MAINTAINER Jorge Rodrigues <jorgerodrigues9@outlook.com>

RUN apt update
RUN apt upgrade -y
RUN apt install nginx -y

ADD default /etc/nginx/sites-enabled/default
ADD index.html /var/www/html/index.html

# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 8080

# CMD service nginx start
# ENTRYPOINT [ "/etc/init.d/nginx" ]
CMD [ "nginx", "-g", "daemon off;" ]

# Para inspecionar o IP do container execute o comando abaixo:
# docker inspect CONTAINER ID | grep IPAddress

# INSTRUÇÕES

# Build: docker build -t nginx .
# Run: docker run -dp 8080:8080 -v `pwd`/var/www/html:/var/www/html:ro --name app nginx
# IP: docker inspect app | grep IPAddress
# Acesso: docker exec -it app bash
# Stop: docker stop app
# Remove: docker rm app