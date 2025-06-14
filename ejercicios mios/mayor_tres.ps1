# Script: mayor_tres.ps1
$a = Read-Host "Introduce el primer número"
$b = Read-Host "Introduce el segundo número"
$c = Read-Host "Introduce el tercer número"
$mayor = [int]$a
if ([int]$b -gt $mayor) { $mayor = [int]$b }
if ([int]$c -gt $mayor) { $mayor = [int]$c }
Write-Output "El mayor es: $mayor"
