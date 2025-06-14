# Script: usuarios_csv.ps1
$usuario = Read-Host "Introduce el nombre de usuario"
$grupo = Read-Host "Introduce el grupo"
$archivo = "usuarios.csv"
if (!(Test-Path $archivo)) {
    Write-Output "usuario,grupo" > $archivo
}
Write-Output "$usuario,$grupo" >> $archivo
Write-Output "Usuario $usuario añadido al grupo $grupo en $archivo"
