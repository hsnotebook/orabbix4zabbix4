@echo off
 setLocal EnableDelayedExpansion
 set CLASSPATH="
 for /R ./lib %%a in (*.jar) do (
   set CLASSPATH=!CLASSPATH!;%%a
 )
set CLASSPATH=!CLASSPATH!"

java -Duser.language=en -Duser.country=US -Dlog4j.configuration=./conf/log4j.properties -cp  %CLASSPATH%;orabbix-1.2.3.jar com.smartmarmot.orabbix.bootstrap start ./conf/config.props &