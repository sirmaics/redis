FROM ubuntu:16.04

RUN apt-get update && apt-get install -y redis-server supervisor
COPY redis_supervisor.conf /etc/supervisor/conf.d/redis.conf

RUN mkdir /data && chown redis:redis /data
VOLUME /data
WORKDIR /data

COPY docker-entrypoint.sh /usr/local/bin/
RUN ln -s usr/local/bin/docker-entrypoint.sh /entrypoint.sh # backwards compat
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
CMD ["tail -f /dev/null"]

EXPOSE 6379
