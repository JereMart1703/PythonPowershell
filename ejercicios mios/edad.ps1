# Script: edad.ps1
$anioNacimiento = Read-Host "Introduce tu año de nacimiento"
$anioActual = (Get-Date).Year
$edad = $anioActual - [int]$anioNacimiento
Write-Output "Tienes $edad años"
