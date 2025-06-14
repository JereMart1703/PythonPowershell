# Script: puerta_switch.ps1

Write-Output "Selecciona una puerta:"
Write-Output "1. Roja"
Write-Output "2. Azul"
Write-Output "3. Verde"
Write-Output "4. Amarilla"

$opcion = Read-Host "Introduce el número de la puerta (1-4)"

switch ($opcion) {
    1 { Write-Output "Has elegido la puerta ROJA." }
    2 { Write-Output "Has elegido la puerta AZUL." }
    3 { Write-Output "Has elegido la puerta VERDE." }
    4 { Write-Output "Has elegido la puerta AMARILLA." }
    default { Write-Output "Puerta incorrecta. Debes elegir un número del 1 al 4." }
}
