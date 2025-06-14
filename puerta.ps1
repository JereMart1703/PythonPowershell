# Script: puerta.ps1

Write-Output "Selecciona una puerta:"
Write-Output "1. Roja"
Write-Output "2. Azul"
Write-Output "3. Verde"
Write-Output "4. Amarilla"

$opcion = Read-Host "Introduce el número de la puerta (1-4)"

if ($opcion -eq 1) {
    Write-Output "Has elegido la puerta ROJA."
} elseif ($opcion -eq 2) {
    Write-Output "Has elegido la puerta AZUL."
} elseif ($opcion -eq 3) {
    Write-Output "Has elegido la puerta VERDE."
} elseif ($opcion -eq 4) {
    Write-Output "Has elegido la puerta AMARILLA."
} else {
    Write-Output "Puerta incorrecta. Debes elegir un número del 1 al 4."
}
