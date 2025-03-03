REM Attempting to kill tasks with names starting with "Aasx" and Aggr. Server
taskkill /F /IM "Aasx*" /T
taskkill /F /IM "AggregationServer*" /T

REM Closing any remaining command prompt windows
taskkill /F /FI "WINDOWTITLE eq Aasx*" /T

REM Changing directory to "path\to\directory\with\OPCUA-AASXServer" and starting "startForDemo.bat"
cd "path\to\directory\with\OPCUA-AASXServer"
Start "" "path\to\directory\with\OPCUA-AASXServer\startForDemo.bat"

REM Changing directory to "path\to\directory\with\REST-AASXServer" and starting "startForDemo.bat"
cd "path\to\directory\with\REST-AASXServer"
Start "" "path\to\directory\with\REST-AASXServer\startForDemo.bat"

REM Changing directory to "path\to\directory\with\OPCUA-AggrServer" and starting "AggregationServer.exe"
cd "path\to\directory\with\OPCUA-AggrServer"
Start "AggrOpcUaServer" "path\to\directory\with\OPCUA-AggrServer\AggregationServer.exe"