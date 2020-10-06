FROM nginx:alpine
COPY nginx/delegator.conf /etc/nginx/conf.d/delegator.conf
COPY /app /usr/share/nginx/html/delegator
COPY entrypoint.sh /opt/

RUN chmod +x /opt/entrypoint.sh

EXPOSE 80

# CMD ["nginx", "-g", "daemon off;"]
ENTRYPOINT [ "/opt/entrypoint.sh" ]
CMD ["start-server"]