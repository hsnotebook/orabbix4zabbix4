FROM openjdk:8-jre-alpine

COPY orabbix/ /opt/orabbix/

WORKDIR /opt/orabbix

CMD ["sh", "/opt/orabbix/run.sh"]
