FROM ubuntu:20.10

RUN apt-get update && apt-get install -y ghostscript

RUN mkdir /var/workdir && chown www-data:www-data /var/workdir

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh

USER www-data
WORKDIR /var/workdir

ENTRYPOINT ["/entrypoint.sh"]
CMD ["--help"]