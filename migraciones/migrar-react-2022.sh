git clone git@github.com:uqbar-project/$1.git
mv $1 $1-old
npx create-react-app $1
cd $1

# Copying files
cp ../$1-old/.gitignore .
# .eslint no va más
# cp ../$1-old/.eslintrc.json .
cp ../$1-old/.markdownlint.json .
cp ../$1-old/.prettierrc .
cp ../$1-old/public/favicon.ico public
# esto requiere hacerlo a manopla? cp ../$1-old/package.json .

# Copying folders
cp -R ../$1-old/.git .
cp -R ../eg-hola-mundo-react/.github .  # sacamos el npm run lint del CI
cp -R ../$1-old/src .
cp ../$1-old/README.md .
cp -R ../$1-old/.vscode .
cp -R ../$1-old/badges .
cp -R ../$1-old/images . | true
echo 18.4.0 > .nvmrc

rm package-lock.json
npm i

# Revisar
#
# package.json -> no va lint, sí va 

# index.html
# App.js      -> mui para Material UI 5
# App.test.js -> await act(() => { botonSumar.click() })
#                usar screen en lugar de getByTestId directo
# index.js
# reportWebVitals.js
# setupTests.js
