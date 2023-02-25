# Script para ejecutar en el raíz donde se descargan los proyectos
cd $1
cp -R .github ../$2
cp build.gradle.kts ../$2
cp -R gradle ../$2
cp gradlew ../$2
cp gradlew.bat ../$2
cd ../$2
