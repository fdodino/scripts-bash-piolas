
## Lista de scripts

### Automatizaciones

- [Hacer un fetch prune recursivo desde una carpeta donde hay múltiples ejemplos](./automatizaciones/fetch-prune-rec.sh): ejecutarlo sin parámetros desde la carpeta raíz
- [Crear un PR para migración](./automatizaciones/crear-pr-migracion.sh): hay que pararse en la carpeta raíz y pasarle el nombre del directorio donde está el ejemplo
- [Enviar correcciones en forma masiva](./automatizaciones/enviar-correcciones.sh): hay que pararse en el directorio raíz, eso busca todos los directorios y hace un push con las correcciones a cada repo.


### Migraciones

- [Migrar ejemplo de React 2021 a 2022](./migraciones/migrar-react-2022.sh): tenés que bajarte el proyecto en `-old` y genera un proyecto nuevo con Create React App pasando fuentes y cosas generales. Requiere que luego revises bien el proyecto.
- [Migrar ejemplo de Kotlin 2022 a 2023](./migraciones/migrar-kotlin-2023.sh): pararse en el raíz y pasarle como parámetros la carpeta de origen donde está migrado el ejemplo y la carpeta destino donde está el ejemplo que querés migrar.
- [Migrar ejemplo de Angular 2022 a 2023](./migraciones/migrar-angular.sh): te parás en el raíz, le pasás el nombre simple del proyecto en github, te clona el proyecto en `-old` y genera un proyecto nuevo con ng new pasando fuentes y cosas generales. Requiere que luego revises bien el proyecto.
- [Pdepreludat](./migraciones/migrar-pdepreludat-2024.sh): le pasás el repo y el nombre del ejemplo, lo descarga, genera un nuevo template actualizado, copia los fuentes (Library.hs y Spec.hs) y los sube al repo