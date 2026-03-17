FROM nginx
COPY index.html /usr/share/nginx/html/index.html
VOLUME ['/vol1']
EXPOSE 80
