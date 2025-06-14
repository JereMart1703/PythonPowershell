# Script: aleatorio.ps1
$secreto = Get-Random -Minimum 1 -Maximum 101
$intentos = 0
Do {
    $intento = Read-Host "Adivina el número (1-100)"
    $intentos++
    if ([int]$intento -lt $secreto) {
        Write-Output "El número es mayor"
    } elseif ([int]$intento -gt $secreto) {
        Write-Output "El número es menor"
    }
} While ([int]$intento -ne $secreto)
Write-Output "¡Correcto! Lo has adivinado en $intentos intentos."
