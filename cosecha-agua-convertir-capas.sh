#!/bin/bash

# Límite internacional de Nicaragua
echo "Conversión de capas geoespaciales"
echo "================================="

echo “Límite internacional de Nicaragua”
ogr2ogr \
  ni-limite_int-ineter-2016-wgs84.geojson \
  datos-originales/2016_INETER_Internacional_Lin.shp \
  -f "GeoJSON" \
  -progress \
  -nln ni-limite_int-ineter-2016-wgs84 \
  -s_srs EPSG:32616 -t_srs EPSG:4326 \
  -makevalid
echo “Municipios de Nicaragua”
ogr2ogr \
  ni-municipios-ineter-2016-wgs84.geojson \
  datos-originales/2016_INETER_DPA_Municipios.shp \
  -f "GeoJSON" \
  -progress \
  -nln ni-municipios-ineter-2016-wgs84 \
  -s_srs EPSG:32616 -t_srs EPSG:4326 \
  -makevalid
echo “Comunidades de Nicaragua”
ogr2ogr \
  ni-comunidades-ineter-2016-wgs84.geojson \
  datos-originales/LIM_COM_INETER_2016_Code.shp \
  -f "GeoJSON" \
  -progress \
  -nln ni-comunidades-ineter-2016-wgs84 \
  -s_srs EPSG:32616 -t_srs EPSG:4326 \
  -makevalid
