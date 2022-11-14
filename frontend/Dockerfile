FROM nginx:stable-alpine

RUN rm -f /etc/nginx/conf.d/default.conf
COPY ["nginx.conf", "/etc/nginx/conf.d"]
COPY ["index.html", "css.css", "js.js", "/usr/share/nginx/html/"]

