# Script: paran3numeros.ps1

param (
    [Parameter(Mandatory=$true, HelpMessage="Dame el primer numero entero")]
    [int]$primerNumero,
    [Parameter(Mandatory=$true, HelpMessage="Dame el segundo numero entero")]
    [int]$segundoNumero,
    [Parameter(Mandatory=$true, HelpMessage="Dame el tercer numero entero")]
    [int]$tercerNumero
)

$suma = $primerNumero + $segundoNumero + $tercerNumero

Write-Output "La suma de los tres numeros es: $suma"
