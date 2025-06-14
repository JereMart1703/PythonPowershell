# Script: analisis_variables.ps1

# Leer el archivo tiradas.csv (ignorando la cabecera)
$lineas = Get-Content tiradas.csv | Select-Object -Skip 1

# Inicializar contadores para cada suma posible (2 a 12)
$cont2 = 0; $cont3 = 0; $cont4 = 0; $cont5 = 0; $cont6 = 0; $cont7 = 0; $cont8 = 0; $cont9 = 0; $cont10 = 0; $cont11 = 0; $cont12 = 0
$totalTiradas = 0

foreach ($linea in $lineas) {
    $partes = $linea -split ","
    $suma = [int]$partes[2]
    switch ($suma) {
        2 { $cont2++ }
        3 { $cont3++ }
        4 { $cont4++ }
        5 { $cont5++ }
        6 { $cont6++ }
        7 { $cont7++ }
        8 { $cont8++ }
        9 { $cont9++ }
        10 { $cont10++ }
        11 { $cont11++ }
        12 { $cont12++ }
    }
    $totalTiradas++
}

Write-Output "De $totalTiradas tiradas : 2($([math]::Round(100*$cont2/$totalTiradas)))% 3($([math]::Round(100*$cont3/$totalTiradas)))% 4($([math]::Round(100*$cont4/$totalTiradas)))% 5($([math]::Round(100*$cont5/$totalTiradas)))% 6($([math]::Round(100*$cont6/$totalTiradas)))% 7($([math]::Round(100*$cont7/$totalTiradas)))% 8($([math]::Round(100*$cont8/$totalTiradas)))% 9($([math]::Round(100*$cont9/$totalTiradas)))% 10($([math]::Round(100*$cont10/$totalTiradas)))% 11($([math]::Round(100*$cont11/$totalTiradas)))% 12($([math]::Round(100*$cont12/$totalTiradas)))%"
