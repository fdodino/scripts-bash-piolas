# Script para ejecutar en el raíz donde se descargan los proyectos
cd $1

# Versión Gradle -------------------------------------------
# Elegir la de seguros-kotlin como la última versión de Gradle que vamos a usar
rm -rf gradle* .gradle
cp -R ../eg-seguros-kotlin/gradle* .

# Build Gradle ---------------------------------------------
# Versión de Kotlin
sed -i 's/1.8.10/1.9.22/g' ./build.gradle.kts

# Versión de Kotest
sed -i 's/5.5.5/5.8.0/g' ./build.gradle.kts

# Versión de JDK
sed -i 's/"17"/"21"/g' ./build.gradle.kts

# Versión de Jacoco
sed -i 's/0.8.8/0.8.11/g' ./build.gradle.kts

# Versión de Mockk
sed -i 's/1.13.4/1.13.9/g' ./build.gradle.kts

# CI
cp ../eg-seguros-kotlin/.github/workflows/build.yml .github/workflows/build.yml
