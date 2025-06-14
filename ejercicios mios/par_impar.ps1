# Script: par_impar.ps1
$numero = Read-Host "Introduce un número"
if ([int]$numero % 2 -eq 0) {
    Write-Output "El número es par"
} else {
    Write-Output "El número es impar"
}
