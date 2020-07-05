FROM nginx:latest

RUN rm /usr/share/nginx/html/index.html

COPY ./greenapp/index.html /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]