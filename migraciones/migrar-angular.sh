git clone git@github.com:uqbar-project/$1.git
mv $1 $1-old
ng new $1
cd $1

# Copying files
cp ../$1-old/.vscode/settings.json ./.vscode
echo 20.4.0 > ./.nvmrc
cp ../$1-old/.gitignore .
cp ../$1-old/.eslintrc.json .
cp ../$1-old/.prettierrc.json .
cp ../$1-old/.htmlhintrc .
cp ../$1-old/public/favicon.ico public
# esto requiere hacerlo a manopla? cp ../$1-old/package.json .

# Installar ESLint
npm install --save-dev eslint @typescript-eslint/parser

# Instalar plugins adicionales
npm install --save-dev @typescript-eslint/eslint-plugin eslint-plugin-prettier

# Instalar Prettier y sus dependencias
npm install --save-dev prettier prettier-eslint eslint-config-prettier

# Copying folders
cp -R ../$1-old/.git .
cp -R ../eg-conversor-angular/.github .  # sacamos el npm run lint del CI
cp -R ../$1-old/src .
cp ../$1-old/README.md .
cp -R ../$1-old/badges .
cp -R ../$1-old/images . | true

rm package-lock.json
npm i

ng generate config karma

sed -i "s/eg-conversor-angular/$1/g" ./$1/.github/workflows/build.yml

git checkout -b 2023-version

# Revisar
#
# package.json -> no va lint, sí va 

# index.html
# package.json
# la app en general
# karma.conf.js