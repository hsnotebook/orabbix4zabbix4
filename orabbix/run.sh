#!/bin/bash

CONFIG_FILE="/opt/orabbix/conf/config.props"

sed -i "s/ZBX_SERVER_HOST/${ZBX_SERVER_HOST:-127.0.0.1}/g" ${CONFIG_FILE}
sed -i "s/ZBX_SERVER_PORT/${ZBX_SERVER_PORT:-10051}/g" ${CONFIG_FILE}
sed -i "s/ORACLE_HOST/${ORACLE_HOST:-127.0.0.1}/g" ${CONFIG_FILE}
sed -i "s/ORACLE_PORT/${ORACLE_PORT:-1521}/g" ${CONFIG_FILE}
sed -i "s/ORACLE_USER/${ORACLE_USER:-zabbix}/g" ${CONFIG_FILE}
sed -i "s/ORACLE_PASSWORD/${ORACLE_PASSWORD:-zabbix}/g" ${CONFIG_FILE}
sed -i "s/ORACLE_INSTANCE/${ORACLE_INSTANCE:-orcl}/g" ${CONFIG_FILE}

java \
	-Duser.timezone=Asia/Shanghai \
	-Dlog4j.configuration=./conf/log4j.properties \
	-cp $(for i in lib/*.jar ; do echo -n $i: ; done).:./orabbix-1.2.3.jar \
	com.smartmarmot.orabbix.bootstrap \
	start ./conf/config.props
