$numero = Read-Host "Introduce un numero entero para ver su tabla de multiplicar"
$numero = [int]$numero

Write-Output "Tabla de multiplicar del $numero"
for ($multiplicador = 1; $multiplicador -le 10; $multiplicador++) {
    $resultado = $numero * $multiplicador
    Write-Output "$numero x $multiplicador = $resultado"
}

