MS SQL server with expi40db database is required for data collection purposes - you can run it locally via <a href="https://hub.docker.com/r/microsoft/mssql-server">docker container</a>:
```
docker run -e "ACCEPT_EULA=Y" -e "MSSQL_SA_PASSWORD=Y0ur.password" -p 1433:1433 -v sqlvolume:/var/opt/mssql --name mssqlserver mcr.microsoft.com/mssql/server:2022-latest

sqlcmd -S localhost,1433 -U sa -P Y0ur.password

CREATE DATABASE expi40db
go
USE expi40db
go
CREATE TABLE PRODUCTION_DATA (ID int IDENTITY(1, 1), ENDPOINT varchar(255), NODEID varchar(255), VALUE varchar(255), TIMESTAMP datetime);
go
```

Application configuration is present in directory <a href="https://github.com/FEI-thridos/EXPI40-Application/tree/main/UnityOpcuaResources">UnityOpcuaResources</a>.</br>
Contents of directory are:
- PlugAndProduce.bat - A batch file that ensures easy reconfigurability of I-DT platform.
- Directory "assetBundles" - Individual asset bundles from the AAS Repository are downloaded to this directory.
- Directory "assetDLLs" - Individual scripts (.dll) for the line parts are downloaded to this directory.
- Directory "translation" - Directory contains an XML document with the structure of translations into Slovak, English and German languages.
- Directory "clientConfig" - Directory contains an XML document with settings for OPC UA Client.
- Directory "AIService" - Implementation of a service "MotoHoursService" - at the current stage it is just a simple statistical tool that evaluates the uptime of individual line parts and notifies user in Applicaiton. Research of extending I-DT platform with services is currently undergoing.</br>
![image](https://github.com/user-attachments/assets/1f4e881c-e05d-45f6-bfc8-783310561a41)</br>
(NodeId | uptime in last 5 minutes | uptime in last hour)
