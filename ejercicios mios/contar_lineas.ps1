# Script: contar_lineas.ps1
$nombreArchivo = Read-Host "Introduce el nombre del archivo"
if (Test-Path $nombreArchivo) {
    $lineas = Get-Content $nombreArchivo
    Write-Output "El archivo tiene $($lineas.Count) líneas."
} else {
    Write-Output "El archivo no existe."
}
