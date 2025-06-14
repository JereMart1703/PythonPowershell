# Script: rnd_do_until.ps1

$numeroSecreto = Get-Random -Minimum 1 -Maximum 21 # Genera un número aleatorio entre 1 y 20
$intentos = 0 # Inicializa el contador de intentos

Do { # Bucle Do-Until para adivinar el número
    $intentoUsuario = Read-Host "Adivina el número entre 1 y 20"
    $intentos++ # Incrementa el contador de intentos
    if ($intentoUsuario -lt $numeroSecreto) { # Compara el intento del usuario con el número secreto
        Write-Output "El número es más grande."
    } elseif ($intentoUsuario -gt $numeroSecreto) { # Compara el intento del usuario con el número secreto
        Write-Output "El número es más pequeño."
    } else { # El usuario ha adivinado el número
        Write-Output "¡Correcto! El número era $numeroSecreto."
        Write-Output "Número de intentos: $intentos"
    }
} Until ($intentoUsuario -eq $numeroSecreto) # Continúa hasta que el usuario adivine el número
