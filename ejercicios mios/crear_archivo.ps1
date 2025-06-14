# Script: crear_archivo.ps1
$nombreArchivo = Read-Host "Introduce el nombre del archivo"
New-Item -Path $nombreArchivo -ItemType File | Out-Null
Write-Output "Archivo $nombreArchivo creado"
