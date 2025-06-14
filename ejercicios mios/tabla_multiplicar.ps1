# Script: tabla_multiplicar.ps1
$numero = Read-Host "Introduce un número"
for ($i = 1; $i -le 10; $i++) {
    $resultado = [int]$numero * $i
    Write-Output "$numero x $i = $resultado"
}
