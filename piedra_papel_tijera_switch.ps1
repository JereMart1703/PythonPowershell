# Script: piedra_papel_tijera_switch.ps1

Write-Output "Elige: piedra, papel o tijera"
$usuario = Read-Host "Tu elección"
$opciones = @("piedra", "papel", "tijera")
$maquina = $opciones[(Get-Random -Minimum 0 -Maximum 3)]
Write-Output "La máquina eligió: $maquina"

switch ("$usuario-$maquina") {
    "piedra-piedra" { Write-Output "Empate!" }
    "papel-papel" { Write-Output "Empate!" }
    "tijera-tijera" { Write-Output "Empate!" }
    "piedra-tijera" { Write-Output "¡Ganaste!" }
    "papel-piedra" { Write-Output "¡Ganaste!" }
    "tijera-papel" { Write-Output "¡Ganaste!" }
    "piedra-papel" { Write-Output "Perdiste." }
    "papel-tijera" { Write-Output "Perdiste." }
    "tijera-piedra" { Write-Output "Perdiste." }
    default { Write-Output "Opción no válida." }
}
