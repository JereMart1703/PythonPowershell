# Script: puerta2.ps1

Write-Output "Selecciona una puerta:"
Write-Output "1. Roja"
Write-Output "2. Azul"
Write-Output "3. Verde"
Write-Output "4. Amarilla"

$opcion = Read-Host "Introduce el número de la puerta (1-4)"

if ($opcion -eq 3) {
    Write-Output "¡Has elegido la puerta VERDE! Puedes lanzar una moneda para ver si ganas o pierdes."
    $eleccionUsuario = Read-Host "Elige: cara o cruz"
    $lanzamiento = Get-Random -Minimum 0 -Maximum 2
    if ($lanzamiento -eq 0) {
        $resultado = "cara"
    } else {
        $resultado = "cruz"
    }
    Write-Output "La moneda salió: $resultado"
    if ($eleccionUsuario -eq $resultado) {
        Write-Output "¡Has ganado!"
    } else {
        Write-Output "Has perdido."
    }
} elseif ($opcion -eq 1 -or $opcion -eq 2 -or $opcion -eq 4) {
    Write-Output "Has perdido. Solo la puerta VERDE te da la oportunidad de ganar."
} else {
    Write-Output "Puerta incorrecta. Debes elegir un número del 1 al 4."
}
