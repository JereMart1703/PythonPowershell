# Script: csv.ps1
# Gestiona usuarios en un archivo usuarios.csv: crea o elimina usuarios con contraseña aleatoria

param (
    # Nombre del usuario (obligatorio, si no se da, el script se detiene)
    [string]$usuario,
    # Grupo del usuario, por defecto "A"
    [string]$grupo = "A",
    # Switch para borrar usuario
    [switch]$delete
)

# Nombre del archivo CSV donde se guardan los usuarios
$archivoCSV = "usuarios.csv"

# Si no se recibe el nombre de usuario, mostrar mensaje y salir
if (-not $usuario) {
    Write-Output "No me han dado usuario"
    exit
}

# Función para generar una contraseña aleatoria de 8 caracteres
function GenerarPassword {
    $chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789!@#~$%&"
    $salida = ""
    for ($i = 0; $i -lt 8; $i++) {
        $r = Get-Random -Minimum 0 -Maximum $chars.Length
        $salida += $chars[$r]
    }
    Write-Output $salida
}

# Si el archivo no existe, crear el encabezado
if (!(Test-Path $archivoCSV)) {
    Write-Output "usuario,grupo,password" > $archivoCSV
}

# Leer los usuarios existentes del archivo CSV
$usuariosExistentes = Import-Csv -Path $archivoCSV

# Si se usa el switch -delete, intentar borrar el usuario
if ($delete) {
    if ($usuariosExistentes | Where-Object { $_.usuario -eq $usuario }) {
        # Filtrar todos menos el usuario a borrar
        $usuariosActualizados = $usuariosExistentes | Where-Object { $_.usuario -ne $usuario }
    # Guardar el nuevo archivo sin el usuario borrado
        $usuariosActualizados | Export-Csv -Path $archivoCSV -NoTypeInformation
        Write-Output "El usuario $usuario ha sido eliminado del archivo."
    } else {
        Write-Output "El usuario $usuario no existe, no se puede eliminar."
    }
}
else {
    # Si el usuario ya existe, mostrar mensaje de error
    if ($usuariosExistentes | Where-Object { $_.usuario -eq $usuario }) {
        Write-Output "El usuario $usuario ya existe, no se puede crear."
    } else {
        # Generar contraseña aleatoria
        $password = GenerarPassword
        # Añadir el usuario al archivo CSV
        Write-Output "$usuario,$grupo,$password" >> $archivoCSV
        Write-Output "El usuario $usuario ha sido creado con la password $password en el grupo $grupo."
    }
}
