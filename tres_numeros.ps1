# Script: paran3numeros.ps1

# Pedir los números al usuario de forma sencilla
$primerNumero = Read-Host "Primer numero"
$segundoNumero = Read-Host "Segundo numero"
$tercerNumero = Read-Host "Tercer numero"

# Sumar los números (conversión a entero)
$suma = [int]$primerNumero + [int]$segundoNumero + [int]$tercerNumero

Write-Output "La suma es: $suma"
