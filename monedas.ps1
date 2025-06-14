# Script: monedas.ps1

# Lanzar 3 monedas
$resultadosMonedas = @()
for ($numeroLanzamiento = 1; $numeroLanzamiento -le 3; $numeroLanzamiento++) {
    $moneda = Get-Random -Minimum 0 -Maximum 2
    if ($moneda -eq 0) {
        $resultadosMonedas += "cara"
    } else {
        $resultadosMonedas += "cruz"
    }
}

Write-Output "Resultados: $($resultadosMonedas -join ', ')"

# Calcular si son 3 caras
$totalCaras = ($resultadosMonedas | Where-Object { $_ -eq "cara" }).Count
if ($totalCaras -eq 3) {
    Write-Output "¡Han salido 3 caras!"
} else {
    Write-Output "No han salido 3 caras."
}

# Calcular probabilidad teórica
$probabilidadTresCaras = 1 / 8
Write-Output "La probabilidad teórica de obtener 3 caras es: $probabilidadTresCaras (o 12.5%)"
