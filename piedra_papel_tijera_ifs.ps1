# Script: piedra_papel_tijera_ifs.ps1

Write-Output "Elige: piedra, papel o tijera" # Juego de Piedra, Papel o Tijera
$usuario = Read-Host "Tu elección"# Solicitar al usuario su elección
$opciones = @("piedra", "papel", "tijera") # Definir las opciones disponibles
$maquina = $opciones[(Get-Random -Minimum 0 -Maximum 3)] # Elegir una opción aleatoria para la máquina
Write-Output "La máquina eligió: $maquina" # Mostrar la elección de la máquina

if ($usuario -eq $maquina) { # Comparar las elecciones del usuario y la máquina
    Write-Output "Empate!" # Si son iguales, es un empate
} elseif (($usuario -eq "piedra" -and $maquina -eq "tijera") -or
         ($usuario -eq "papel" -and $maquina -eq "piedra") -or
         ($usuario -eq "tijera" -and $maquina -eq "papel")) { # Si el usuario gana
    Write-Output "¡Ganaste!"
} elseif (($usuario -eq "piedra" -and $maquina -eq "papel") -or
         ($usuario -eq "papel" -and $maquina -eq "tijera") -or
         ($usuario -eq "tijera" -and $maquina -eq "piedra")) { # Si el usuario pierde
    Write-Output "Perdiste."
} else { # Si ninguna de las condiciones anteriores se cumple, la opción es inválida
    Write-Output "Opción no válida."
}
         