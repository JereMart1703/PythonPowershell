# Script: suma_array.ps1
$numeros = @(1,2,3,4,5)
$suma = 0
foreach ($n in $numeros) { $suma += $n }
Write-Output "La suma total es: $suma"
