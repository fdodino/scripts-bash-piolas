# Script para ejecutar en el raíz donde se descargan los proyectos
cd $1

git checkout $2
git pull

# Versión Gradle -------------------------------------------
# Elegir la de seguros-kotlin como la última versión de Gradle que vamos a usar
./gradlew wrapper --gradle-version=8.12.1 --distribution-type=bin

# Build Gradle ---------------------------------------------
# Versión de Kotlin
sed -i 's/1.9.22/1.9.25/g' ./build.gradle.kts

# Versión de Kotest
sed -i 's/5.8.0/5.9.1/g' ./build.gradle.kts

# Versión de JDK - 2025 se respeta la misma LTS -> 21
# sed -i 's/"17"/"21"/g' ./build.gradle.kts

# Versión de Jacoco
sed -i 's/0.8.11/0.8.12/g' ./build.gradle.kts

# Versión de Mockk
sed -i 's/1.13.9/1.13.16/g' ./build.gradle.kts

# CI
cp ../eg-seguros-kotlin/.github/workflows/build.yml .github/workflows/build.yml

git add .
git commit -m "2025 migration"
git push
