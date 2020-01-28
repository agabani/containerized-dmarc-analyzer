FROM pypy:3.6-7.3

ENV PARSEDMARC_VERSION 6.8.2
ENV GEOIP_VERSION 4.1.5

RUN apt-get update \
    && apt-get install -y gcc gettext-base libxml2-dev libxslt-dev libz-dev \
    && curl -L -o geoipupdate_${GEOIP_VERSION}_linux_amd64.deb https://github.com/maxmind/geoipupdate/releases/download/v${GEOIP_VERSION}/geoipupdate_${GEOIP_VERSION}_linux_amd64.deb \
    && dpkg -i geoipupdate_${GEOIP_VERSION}_linux_amd64.deb \
    && rm geoipupdate_${GEOIP_VERSION}_linux_amd64.deb \
    && pip3 install -U parsedmarc==${PARSEDMARC_VERSION} \
    && rm -rf /root/.cache/ \
    && apt-get purge -y gcc \
    && apt-get autoremove -y \
    && rm -rf /var/lib/{apt,dpkg}/

COPY etc/GeoIP.template.conf /etc/GeoIP.template.conf
COPY etc/parsedmarc.template.ini /etc/parsedmarc.template.ini
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["parsedmarc", "-c", "/etc/parsedmarc.ini"]
