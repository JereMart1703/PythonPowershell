# Script: crear_usuarios_grupos.ps1
# Crea los grupos GPWS01 a GPWS09 y usuarios tunombre_gpwsXX_YY en cada grupo
# Añade los usuarios al grupo correspondiente y al grupo 'Usuarios' para acceso gráfico

$nombreBase = "tunombre" # Cambia esto por tu nombre real si lo deseas
$contraseña = "alumno"   # Contraseña por defecto para todos los usuarios

# Bucle principal para crear los grupos GPWS01 a GPWS09
for ($numeroGrupo = 1; $numeroGrupo -le 9; $numeroGrupo++) {
    # Formatea el nombre del grupo como GPWS01, GPWS02, ..., GPWS09
    $nombreGrupo = "GPWS{0:D2}" -f $numeroGrupo
    # Comprueba si el grupo ya existe
    $existeGrupo = Get-LocalGroup | Select-String -Pattern $nombreGrupo -Quiet

    if ($existeGrupo) {
        # Si el grupo existe, muestra mensaje y no lo crea
        Write-Output "El grupo $nombreGrupo existe, no se crea"
    } else {
        # Si el grupo no existe, lo crea y muestra mensaje
        New-LocalGroup -Name $nombreGrupo -Description "Grupo $nombreGrupo creado"
        Write-Output "El grupo $nombreGrupo no existe, se crea"
    }

    # Bucle para crear usuarios tunombre_gpwsXX_YY (YY de 01 a 09) en cada grupo
    for ($numeroUsuario = 1; $numeroUsuario -le 9; $numeroUsuario++) {
        # Formatea el nombre del usuario
        $nombreUsuario = "{0}_gpws{1:D2}_{2:D2}" -f $nombreBase, $numeroGrupo, $numeroUsuario
        # Comprueba si el usuario ya existe
        $usuarioExiste = Get-LocalUser -Name $nombreUsuario -ErrorAction SilentlyContinue

        if ($usuarioExiste) {
            # Si el usuario existe, muestra mensaje y no lo crea
            Write-Output "El usuario $nombreUsuario existe, no se crea"
        } else {
            # Si el usuario no existe, lo crea con la contraseña 'alumno'
            $securePassword = ConvertTo-SecureString $contraseña -AsPlainText -Force
            New-LocalUser -Name $nombreUsuario -Password $securePassword -FullName $nombreUsuario
            Write-Output "El usuario $nombreUsuario con grupo $nombreGrupo no existe, se crea"
        }

        # Comprueba si el usuario está en el grupo correspondiente
        $miembroGrupo = Get-LocalGroupMember -Group $nombreGrupo -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq $nombreUsuario }
        if ($miembroGrupo) {
            # Si ya es miembro, muestra mensaje
            Write-Output "El usuario $nombreUsuario ya esta en el grupo $nombreGrupo no se hace nada"
        } else {
            # Si no es miembro, lo añade al grupo y muestra mensaje
            Add-LocalGroupMember -Group $nombreGrupo -Member $nombreUsuario
            Write-Output "El usuario $nombreUsuario no esta en el grupo $nombreGrupo, se hace miembro"
        }

        # Comprueba si el usuario está en el grupo 'Usuarios' para acceso gráfico
        $miembroUsuarios = Get-LocalGroupMember -Group "Usuarios" -ErrorAction SilentlyContinue | Where-Object { $_.Name -eq $nombreUsuario }
        if ($miembroUsuarios) {
            # Ya está en el grupo Usuarios, no hacer nada
        } else {
            # Si no está, lo añade al grupo 'Usuarios'
            Add-LocalGroupMember -Group "Usuarios" -Member $nombreUsuario
        }
    }
}

# Ejemplo de borrado de usuarios y grupos:
# foreach ($i in  $(Get-LocalUser |sls -Pattern "tunombre_")){ Remove-LocalUser -Name $i }
# foreach ($i in  $(Get-LocalGroup |sls -Pattern  "GPWS")){ Remove-LocalGroup -Name $i }
