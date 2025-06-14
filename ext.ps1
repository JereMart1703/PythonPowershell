# Script: ext.ps1
# Cambia la extensión de todos los archivos .dat a .txt en la carpeta actual

foreach ($archivo in Get-ChildItem -Filter *.dat) {
    $nuevoNombre = $archivo.Name -replace '\.dat$', '.txt'
    Rename-Item $archivo.Name $nuevoNombre
}

Write-Output "Se han renombrado todos los archivos .dat a .txt."
