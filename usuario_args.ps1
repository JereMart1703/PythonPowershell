# Script: usuario_args.ps1
# Uso: .\usuario_args.ps1 Mario López mario33 2000

$nombre = $args[0] # args es un array que contiene los argumentos pasados al script
$apellido = $args[1]
$usuario = $args[2]
$nacimiento = [int]$args[3]

$anioActual = (Get-Date).Year
$edad = $anioActual - $nacimiento

if ($edad -ge 14) {
    Write-Output "Se ha creado a $nombre $apellido el usuario $usuario"
} else {
    Write-Output "No se puede crear el usuario $usuario a $nombre $apellido por tener menos de 14"
}
