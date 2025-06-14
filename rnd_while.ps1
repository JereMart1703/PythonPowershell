# Script: rnd_while.ps1

$numeroSecreto = Get-Random -Minimum 1 -Maximum 21
$intentos = 0
$acertado = $false

while (-not $acertado) {
    $intentoUsuario = Read-Host "Adivina el número entre 1 y 20"
    $intentos++
    if ($intentoUsuario -lt $numeroSecreto) {
        Write-Output "El número es más grande."
    } elseif ($intentoUsuario -gt $numeroSecreto) {
        Write-Output "El número es más pequeño."
    } else {
        Write-Output "¡Correcto! El número era $numeroSecreto."
        Write-Output "Número de intentos: $intentos"
        $acertado = $true
    }
}
