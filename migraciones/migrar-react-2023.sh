if [ -d $1 ];
then
  echo "$1: already exists. Please remove the project folder and try again."
  exit 1
fi

git clone git@github.com:uqbar-project/$1.git
mv $1 $1-old
npm create vite@latest $1 --template react-swc
cd $1

# Copying base files
BASE=eg-hola-mundo-react
cp ../$BASE/.eslintrc.cjs .
cp -R ../$BASE/.github .
cp ../$BASE/.markdownlint.json .
echo 20.4.0 > .nvmrc
cp ../$BASE/.prettierrc .
cp -R ../$BASE/.vscode .
cp ../$BASE/.gitignore .
cp ../$BASE/vite.config.js .

# Moving old project
cp -R ../$1-old/.git .
cp ../$1-old/README.md .
cp -R ../$1-old/badges .
cp -R ../$1-old/images . | true
# index.html es nuevo, adaptarlo de public
cp ../$1-old/public/favicon.ico public
cp -R ../$1-old/src .
# renaming all *.js to *.jsx
find . -name '*.js' -exec mv {} {}x \;

# Reinstall dependencies
rm -f package-lock.json
npm install -D @testing-library/react @vitest/coverage-v8 @vitejs/plugin-react jsdom prettier vitest

# Revisar
