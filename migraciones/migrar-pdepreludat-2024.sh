#!/bin/bash
# Validamos que pasen el nombre del proyecto
repo=$1
if [ "$repo" = "" ]
then
  echo "migrar: falta ingresar el nombre del repo"
  exit 1
fi

# Validamos que pasen el nombre del proyecto
proyecto=$2
if [ "$proyecto" = "" ]
then
  echo "migrar: falta ingresar el nombre del proyecto"
  exit 2
fi

# Descargamos el proyecto si no lo descargamos anteriormente y lo renombramos a old
if [ ! -d "$proyecto" ]
then
  git clone git@github.com:$repo/$proyecto.git
fi

mv ./$proyecto ./$proyecto-old

# Creo el proyecto con el formato nuevo
stack new $proyecto https://github.com/10Pines/pdepreludat/releases/latest/download/pdepreludat.hsfiles

# Copiamos los archivos del proyecto
cp -R ./$proyecto-old/src    ./$proyecto

cp -R ./$proyecto-old/asset*    ./$proyecto  2> /dev/null
cp -R ./$proyecto-old/im*       ./$proyecto  2> /dev/null
cp -R ./$proyecto-old/video*    ./$proyecto  2> /dev/null
cp -R ./$proyecto-old/README.md ./$proyecto  2> /dev/null

mv ./$proyecto-old/.git ./$proyecto

# Commiteamos el proyecto
cd $proyecto
git add .
git commit -m "Migración pdepreludat 2024"
git push

cd ..
echo "Proyecto $proyecto migrado correctamente"
