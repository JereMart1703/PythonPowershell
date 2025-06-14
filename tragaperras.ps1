# Script: tragaperras.ps1

$dinero = 100 # Dinero inicial del jugador
$maximoPartidas = 1000 # Máximo de partidas a jugar
$partidasRealizadas = 0 # Contador de partidas jugadas
$frutas = @('limon', 'manzana', 'platano', 'siete') # Rulos disponibles

while ($dinero -ge 1 -and $partidasRealizadas -lt $maximoPartidas) { # Bucle para jugar hasta que el jugador no tenga dinero o alcance el máximo de partidas
    $dinero-- # Paga 1 € por jugar
    $partidasRealizadas++ # Incrementa el contador de partidas jugadas
    $tiradaActual = @() # Array para almacenar la tirada actual
    for ($rulo = 0; $rulo -lt 3; $rulo++) { # Genera 3 rulos aleatorios
        $tiradaActual += $frutas[(Get-Random -Minimum 0 -Maximum $frutas.Length)] # Selecciona una fruta aleatoria
    }
    if ($tiradaActual[0] -eq $tiradaActual[1] -and $tiradaActual[1] -eq $tiradaActual[2]) { # Comprueba si las 3 frutas son iguales
        if ($tiradaActual[0] -eq 'siete') { # Si las 3 frutas son 'siete'
            $dinero += 100
        } else { # Si las 3 frutas son iguales pero no 'siete'
            $dinero += 1 
        }
    }
}

Write-Output "Dinero final: $dinero €"
Write-Output "Partidas jugadas: $partidasRealizadas"
