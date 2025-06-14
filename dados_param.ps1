# Script: dados_param.ps1

param(
    [Parameter(Position=0)]
    [string]$Tiradas
)

if ($Tiradas -eq 'help') {
    Write-Output "Uso del script dados.ps1:"
    Write-Output ".\dados.ps1 <número_de_tiradas>"
    Write-Output "Ejemplo: .\dados.ps1 100"
    Write-Output "Si no se proporciona ningún argumento, se preguntará cuántas tiradas deseas hacer."
    Write-Output "Si se usa el argumento 'help', se mostrará esta ayuda."
} else {
    if ($Tiradas) {
        $numTiradas = [int]$Tiradas
    } else {
        $numTiradas = Read-Host "¿Cuántas tiradas quieres hacer?"
        $numTiradas = [int]$numTiradas
    }
    "Dado1,Dado2,Suma" > tiradas.csv
    for ($i = 1; $i -le $numTiradas; $i++) {
        $dado1 = Get-Random -Minimum 1 -Maximum 7
        $dado2 = Get-Random -Minimum 1 -Maximum 7
        $suma = $dado1 + $dado2
        "$dado1,$dado2,$suma" >> tiradas.csv
    }
    Write-Output "Se han guardado $numTiradas tiradas en tiradas.csv."
}
