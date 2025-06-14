# Script: usuario_params.ps1
# Uso: .\usuario_params.ps1 -Nombre Mario -Apellido López -Usuario mario33 -Nacimiento 2000

param(
    [Parameter(Mandatory=$true)]# mandatory indica que el parámetro es obligatorio
    [string]$Nombre,# tipo de dato string
    [Parameter(Mandatory=$true)]
    [string]$Apellido,
    [Parameter(Mandatory=$true)]
    [string]$Usuario,
    [Parameter(Mandatory=$true)]
    [int]$Nacimiento # tipo de dato int
)

$anioActual = (Get-Date).Year # te da el año actual
$edad = $anioActual - $Nacimiento # calcular la edad

if ($edad -ge 14) { # verificar si la edad es mayor o igual a 14
    Write-Output "Se ha creado a $Nombre $Apellido el usuario $Usuario"
} else { # verificar si la edad es menor a 14
    Write-Output "No se puede crear el usuario $Usuario a $Nombre $Apellido por tener menos de 14"
}
