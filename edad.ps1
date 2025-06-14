# Script: edad.ps1

# Solicitar al usuario que ingrese su año de nacimiento
$anioNacimiento = Read-Host "Ingrese el año en que naciste"

# Obtener el año actual
$anioActual = (Get-Date).Year #te da el año actual

# Calcular la edad
$edad = $anioActual - $anioNacimiento

# Mostrar la edad
Write-Output "Tienes $edad años."