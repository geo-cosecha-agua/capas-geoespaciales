# Conversión de capas del Portal Geoespacial del Proyecto Cosecha de Agua en Nicaragua
## Descripción general
Este repositorio contiene la documentación y el código fuente de un programa desarrollado para la conversión, entre formatos geoespaciales y sistemas espaciales de referencia (SRS, *Spatial Reference System*), de un conjunto de capas utilizadas en el [Portal Geoespacial del Proyecto Cosecha de Agua en Nicaragua](https://geo-cosecha-agua.github.io/).

El programa está implementado en el lenguaje de comandos [Bash](https://www.gnu.org/software/bash/) y utiliza la biblioteca [GDAL](https://gdal.org/) para realizar las conversiones entre formatos geoespaciales (ej. de Shapefile a GeoJSON) y entre SRS (ej. de UTM 16N a WGS84). Para facilitar su uso y mantenimiento, el programa se ejecuta en un ambiente [Conda](https://docs.conda.io/).

En el resto de este documento, se describen las entradas, procesamiento y salidas del programa; y se detallan los comandos necesarios para su ejecución. Se incluye también una sección con los comandos necesarios para crear el ambiente Conda en el que se ejecuta el programa.

Los comandos y programas utilizados en este repositorio fueron probados en el sistema operativo [Ubuntu 18.04.5 LTS (Bionic Beaver)](https://releases.ubuntu.com/18.04/). Ya que todas las herramientas utilizadas son multiplataforma, pueden funcionar también en otros sistemas operativos, probablemente con algunos ajustes menores.

## Entradas, procesamiento y salidas
### Entradas
- Directorio ```datos-originales``` con archivos de las capas geoespaciales en sus formatos originales.

### Procesamiento
- Ejecución del programa ```geo-cosecha-agua-conversion-capas.sh```

### Salidas
- Archivos con capas geoespaciales convertidas. Se graban en el directorio principal del repositorio.

## Ejecución del programa
Los siguientes comandos deben ejecutarse en la línea de comandos del sistema operativo. Se recomienda utilizar la interfaz de línea de comandos de Anaconda. Se asume que el ambiente Conda ha sido creado de la manera que se muestra en la sección siguiente a esta.
```shell
# Activación del ambiente Conda
$ conda activate geo-cosecha-agua-conversion-capas

# Clonación del repositorio
$ git clone https://github.com/geo-cosecha-agua/geo-cosecha-agua-conversion-capas.git
$ cd geo-cosecha-agua-conversion-capas

# Ejecución del programa
$ ./geo-cosecha-agua-conversion-capas.sh

# Compresión de los resultados (se asume que son archivos GeoJSON)
# Este comando puede usarse si los archivos son muy grandes para subirse a GitHub
$ zip geojson.zip *.geojson

# Actualización del repositorio y de los archivos GeoJSON generados
$ git add *.zip
$ git commit -m "Convertir capas"
$ git push

# Desactivación del ambiente Conda
$ conda deactivate
```

## Creación y configuración del ambiente Conda
El ambiente Conda solamente debe crearse una vez. Luego puede seguir usándose de la manera que se especifica en la sección anterior.
```shell
# Actualización de Conda
$ conda update -n base -c defaults conda

# Creación del ambiente
$ conda create -n geo-cosecha-agua-conversion-capas

# Activación del ambiente
$ conda activate geo-cosecha-agua-conversion-capas

# Instalación de paquetes
$ conda install -c conda-forge gdal

# Desactivación del ambiente
$ conda deactivate
```
