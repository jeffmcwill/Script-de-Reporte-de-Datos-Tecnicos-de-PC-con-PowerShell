#script de reporte de estado de pc con PowerShell

function Reporte(){
    "----------------------------------"
    "Reporte de datos de $env:username"
    "----------------------------------"

    "Fecha del reporte: ", 
    (Get-Date)
    "---------------------"

    "Usuario Actual: ", 
    ([System.Security.Principal.WindowsIdentity]::GetCurrent()).name

    "---------------------"
    "Nombre de Discos: ", 
    (Get-WmiObject Win32_LogicalDisk).VolumeName

    "---------------------"
    "Sistema operativo Actual: ", 
    (Get-CimInstance Win32_OperatingSystem).Caption
    
    "---------------------"
    "Modelo de PC :", 
    [system.environment]::MachineName
    "-----------------------"

    "Tipo de Arquitectura: ", 
    (gwmi win32_computersystem).SystemType

    "----------------------"
    "Bios Firmware: "
    (Get-ComputerInfo).BiosFirmwareType
    
    "-----------------------"
    "Tamaño de pantalla actual:" , 
    (Get-WmiObject win32_VideoController).VideoModeDescription
    
    "-----------------------"
    "Nombre del Procesador: ", 
    (Get-CimInstance Win32_Processor).Name
    
    "-----------------------"
    "Tarjeta de Video:", 
    (Get-WmiObject win32_VideoController).Name

    "------------------------"
    "Correo de cuenta registrada como administrador del sistema: ",
    (Get-ComputerInfo).WindowsRegisteredOwner

    "------------------------"
    "Fecha de instalacion del sistema operativo: ",
    (Get-ComputerInfo).OsInstallDate
    
    "-----------------------"
    "Actualizaciones del sistema Instaladas:",
    (Get-Hotfix).Description
     
    "----------------------"
    "Fechas de Actualizaciones de sistema:",
    (Get-HotFix).InstalledOn
    "----------------------"
    "Version del sistema Antimalware:",     
    (Get-MpComputerStatus).AMEngineVersion

    "----------------------"
    "¿El servicio de Antimalware esta funcionando?:",
    (Get-MpComputerStatus).AMServiceEnabled
    
    "----------------------"
    "¿Cuando fue actualizado el sistema antimalware del pc?:",
    (Get-MpComputerStatus).AntivirusSignatureLastUpdated
    
    "----------------------"
    "El servicio AntiSpyWare esta funcionando?:",
    (Get-MpComputerStatus).AntispywareEnabled

    "----------------------"
    "¿Cuando fue actualizado el sistema AntiSpyWare del pc?:",
    (Get-MpComputerStatus).AntispywareSignatureLastUpdated
    
    "----------------------"
    "Ultima actualizacion de las politicas de dispositivos:",
    (Get-MpComputerStatus).DeviceControlPoliciesLastUpdated
    
    "----------------------"
    "Fecha del ultimo escaneo completo del sistema operativo:",
    (Get-MpComputerStatus).FullScanEndTime

    "----------------------"
    "Fecha del ultimo escaneo rapido del sistema operativo:",
    (Get-MpComputerStatus).QuickScanEndTime
    
    "----------------------"
    "Proteccion de red?: ",
    (Get-MpComputerStatus).NISEnabled

    "----------------------"
    "Impresoras Instaladas: ",
    (get-printer).name

    "----------------------"
    "Drivers de las impresoras: ",
    (get-printer).DriverName

    "--------"
    "Listo. Script creado por Jeff McWill 18/11/22."
}
#---------------
#sistema que escribe el reporte (mejorar presentacion)

#con new item se crea un txt, recomiendo comentarlo cuando ya tengas
#el archivo txt creado, despues solo dejalo como Add-content y no causara
#problemas.

#1
New-Item reporte.txt

#Cuando ya lo ejecutaste 1 vez, a partir de ahi, dejar Add-Content.
#2
#Add-Content reporte.txt
Set-Content reporte.txt -Value (Reporte)
