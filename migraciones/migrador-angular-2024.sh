#!/bin/bash
# Validamos que pasen el nombre del repo
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
  echo "Descargando git@github.com:$repo/$proyecto.git"
  git clone git@github.com:$repo/$proyecto.git
fi

mv ./$proyecto ./$proyecto-old

ng new $proyecto --style=css --routing=true --defaults=true
cd ./$proyecto

# ng g c nombre-componente
# routes
# en la app principal borramos todo
# ts-config -> agregamos src para tener imports absolutos

# Copying files
cp ../$proyecto-old/.vscode/settings.json ./.vscode
echo 20.4.0 > ./.nvmrc
cp ../$proyecto-old/.gitignore .
cp ../$proyecto-old/.eslintrc.json .
cp ../$proyecto-old/.prettierrc.json .
cp ../$proyecto-old/.htmlhintrc .
cp ../$proyecto-old/public/favicon.ico ./public
# esto requiere hacerlo a manopla? cp ../$proyecto-old/package.json .

# Installar ESLint, Prettier
npm install --save-dev prettier eslint prettier-eslint @typescript-eslint/parser 

# Instalar plugins adicionales
npm install --save-dev @typescript-eslint/eslint-plugin eslint-plugin-prettier eslint-config-prettier


# Copiar carpetas
cp -R ../$proyecto-old/.git .
cp -R ../eg-conversor-angular/.github .  # sacamos el npm run lint del CI
cp ../$proyecto-old/README.md .
cp -R ../$proyecto-old/badges .
cp -R ../$proyecto-old/images . | true
cp -R ../$proyecto-old/karma.config.js .
# cp -R ../$proyecto-old/src .
# 
rm package-lock.json
npm i

git checkout -b 2024-version

# Revisar
#
# package.json -> no va lint, sí va 

# cada componente
# index.html
# package.json
# la app en general
# karma.conf.js