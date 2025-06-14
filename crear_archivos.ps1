# Script: crear_archivos.ps1

# Pedir al usuario el nombre de la carpeta
$nombreCarpeta = Read-Host "Introduce el nombre de la carpeta a crear"

# Crear la carpeta si no existe
if (-not (Test-Path $nombreCarpeta)) {
    New-Item -ItemType Directory -Path $nombreCarpeta | Out-Null
}

# Cambiar al directorio
Set-Location $nombreCarpeta

# Crear 10 archivos con contenido personalizado
for ($i = 0; $i -lt 10; $i++) {
    $contenido = "archivo $i"
    Set-Content -Path "archivo_$i.dat" -Value $contenido
}

Write-Output "Se han creado 10 archivos en la carpeta $nombreCarpeta."
