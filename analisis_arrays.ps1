# Script: analisis_arrays.ps1

# Leer el archivo tiradas.csv (ignorando la cabecera)
$lineas = Get-Content tiradas.csv | Select-Object -Skip 1

# Crear un array para contar las sumas de 2 a 12 (índice 0 = suma 2)
$conteos = @(0,0,0,0,0,0,0,0,0,0,0)
$totalTiradas = 0

foreach ($linea in $lineas) {
    $partes = $linea -split ","
    $suma = [int]$partes[2]
    $conteos[$suma-2]++
    $totalTiradas++
}

# Construir la salida
$resultado = "De $totalTiradas tiradas :"
for ($i = 0; $i -lt $conteos.Length; $i++) {
    $suma = $i + 2
    $porcentaje = [math]::Round(100 * $conteos[$i] / $totalTiradas)
    $resultado += " $suma($porcentaje%)"
}
Write-Output $resultado
