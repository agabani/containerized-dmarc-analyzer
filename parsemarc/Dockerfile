FROM pypy:3.5-7-slim

ENV PARSEDMARC_VERSION 6.5.4
RUN apt-get update \
    && apt-get install -y gcc gettext-base \
    && pip install -U parsedmarc==$PARSEDMARC_VERSION \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg}/

COPY etc/parsedmarc.template.ini /etc/parsedmarc.template.ini

CMD ["/bin/bash", "-c", "envsubst < /etc/parsedmarc.template.ini > /etc/parsedmarc.ini && parsedmarc -c /etc/parsedmarc.ini"]
