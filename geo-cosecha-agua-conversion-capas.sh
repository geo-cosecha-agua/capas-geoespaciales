#!/bin/bash

# Límite internacional de Nicaragua
echo "Conversión de capas geoespaciales"
echo "================================="

echo “Límite internacional de Nicaragua”
ogr2ogr \
  ni-limite_int-ineter-2016-wgs84.geojson \
  /vsizip/datos-originales/2016_INETER_Internacional_Lin.zip/2016_INETER_Internacional_Lin.shp \
  -f "GeoJSON" \
  -progress \
  -nln ni-limite_int-ineter-2016-wgs84 \
  -s_srs EPSG:32616 -t_srs EPSG:4326 \
  -makevalid
echo “Municipios de Nicaragua que participan en el Proyecto Cosecha de Agua”
ogr2ogr \
  ni-municipios-ineter-2016-wgs84.geojson \
  /vsizip/datos-originales/2016_INETER_DPA_Municipios.zip/2016_INETER_DPA_Municipios.shp \
  -where "muni='Ciudad Antigua' OR muni='Mosonte' OR muni='Totogalpa' OR muni='Telpaneca' OR muni='Palacagüina' OR muni='Yalagüina' OR muni='Somoto' OR muni='San Lucas' OR muni='Pueblo Nuevo' OR muni='Condega'" \
  -f "GeoJSON" \
  -progress \
  -nln ni-municipios-ineter-2016-wgs84 \
  -s_srs EPSG:32616 -t_srs EPSG:4326 \
  -makevalid
echo “Comunidades de Nicaragua que participan en el Proyecto Cosecha de Agua”
ogr2ogr \
  ni-comunidades-ineter-2016-wgs84.geojson \
  /vsizip/datos-originales/LIM_COM_INETER_2016_Code.zip/LIM_COM_INETER_2016_Code.shp \
  -where "municipio='Ciudad Antigua' OR municipio='Mozonte' OR municipio='Totogalpa' OR municipio='Telpaneca' OR municipio='Palacaguina' OR municipio='Yalaguina' OR municipio='Somoto' OR municipio='San Lucas' OR municipio='Pueblo Nuevo' OR municipio='Condega'" \
  -f "GeoJSON" \
  -progress \
  -nln ni-comunidades-ineter-2016-wgs84 \
  -s_srs EPSG:32616 -t_srs EPSG:4326 \
  -makevalid
