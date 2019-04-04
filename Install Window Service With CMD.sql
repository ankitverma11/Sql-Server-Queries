cd..
c:\windows\microsoft.net\framework\v4.0.30319\installutil.exe [your windows service path to exe]

Run As Administrator
"C:\Windows\cd Microsoft.NET\Framework\v4.0.30319\installutil D:\Data\Genecis_SVN\Genacis.root\GENACIS2017\Services\CopyExclusionZoneToPGSQL\bin\Debug\CopyExclusionZoneToPGSQL.exe

Run As Administrator For Unistall
"C:\Windows\cd Microsoft.NET\Framework\v4.0.30319\installutil /u D:\Data\Genecis_SVN\Genacis.root\GENACIS2017\Services\CopyExclusionZoneToPGSQL\bin\Debug\CopyExclusionZoneToPGSQL.exe


On test Server 
Run As Administrator
"C:\Windows\cd Microsoft.NET\Framework\v4.0.30319\installutil C:\GenacisApp\Services2017\UdpToMsmqMessageHandlerService\bin\Debug\CopyExclusionZoneToPGSQL.exe

On test Server 
Run As Administrator
"C:\Windows\cd Microsoft.NET\Framework\v4.0.30319    installutil C:\GenacisApp\Services2017\PlantCoverageService1\bin\Debug\PlantCoverageService.exe

On test Server 
Run As Administrator
"C:\Windows\cd Microsoft.NET\Framework\v4.0.30319   installutil /u C:\GenacisApp\Services2017\PlantCoverageService1\bin\Debug\PlantCoverageService.exe


On test Server 
Run As Administrator
"C:\Windows\cd Microsoft.NET\Framework\v4.0.30319    installutil C:\GenacisApp\Services2017\LoadTotalPlantAreaFromSQltoPGSQl\bin\Debug\LoadTotalPlantAreaFromSQLtoPgSQL.exe


New test Server
C:\Windows\Microsoft.NET\Framework\v4.0.30319>installutil F:\GenacisApp\Services2017\DrivePathCommunityMappingService2\bin\Debug\DrivePathCommunityMappingService.exe


C:\Windows\Microsoft.NET\Framework\v4.0.30319>installutil F:\GenacisApp\Services2017\PlantCoverageService1\bin\Debug\PlantCoverageService.exe



<?xml version="1.0" encoding="utf-8"?>
<configuration>
  <appSettings>

	  <add key="LoggingEnabled" value="true" />
	  <add key="ImagePath" value="\Common\Images\" />
	  <add key="WorkOrderImagePath" value="\Common\WorkOrderImages\" />
	  <add key="ErrorLogPath" value="/Common/ErrorLog/CreateImageForWorkOrderLog.txt" />
	  <add key="GenacisConnectionString" value="server=192.168.0.8;database=GenacisLive;User ID=saGenacis;Pwd=G3n@c15;pooling=true;Max Pool Size=100"/>
	  <add key="ApplicationPath" value="C:\GenacisApp\GenacisPublished"/>
	  <add key="WorkOrderImageDelaySeconds" value="9000"/>
	  <add key="VirtualDirectoryPath" value="http://192.168.0.8/Genacis/" />

	  <!--value define the time in minute,service will update leak address after the given min value.-->
	  <add key="Minute" value=".25"/>
    
  </appSettings>
<startup><supportedRuntime version="v4.0" sku=".NETFramework,Version=v4.6.1"/></startup></configuration>
