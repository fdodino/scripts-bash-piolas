
## Lista de scripts

### Actividades masivas

- [Hacer un fetch prune recursivo desde una carpeta donde hay múltiples ejemplos](./fetch-prune-rec.sh): ejecutarlo sin parámetros desde la carpeta raíz
- [Crear un PR para migración](./crear-pr-migracion.sh): hay que pararse en la carpeta raíz y pasarle el nombre del directorio donde está el ejemplo
- [Enviar correcciones en forma masiva](./enviar-correcciones.sh): hay que pararse en el directorio raíz, eso busca todos los directorios y hace un push con las correcciones a cada repo.


### Migraciones

- [Migrar ejemplo de Kotlin 2022 a 2023](./migrar-kt-2023.sh): pararse en el raíz y pasarle como parámetros la carpeta de origen donde está migrado el ejemplo y la carpeta destino donde está el ejemplo que querés migrar.
- [Migrar ejemplo de React 2021 a 2022](./migrate-react.sh): tenés que bajarte el proyecto en `-old` y genera un proyecto nuevo con Create React App pasando fuentes y cosas generales. Requiere que luego revises bien el proyecto.



