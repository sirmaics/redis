FROM redis:latest
RUN mkdir /usr/local/etc/redis
COPY ./redis.conf /usr/local/etc/redis/redis.conf
CMD [ "redis-server", "/usr/local/etc/redis/redis.conf" ]