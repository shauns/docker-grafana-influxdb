Docker image with Grafana and InfluxDB on Ubuntu 14.04
=======================

This Docker image is based on Ubuntu 14.04 with latest [InfluxDB](http://influxdb.com/) `0.9.0` and [Grafana](http://grafana.org/) `2.0.2`.

## InfluxDB databases

Two InfluxDB databases `app` and `grafana` are created automatically. `app` is used to store application data, `grafana` is used by Grafana.

## Exposed ports

Port | Description
-----| -----------
80   | Grafana UI
8083 | InfluxDB Admin UI
8086 | InfluxDB API

## How to run

Pull the image using `docker pull lcarsos/docker-grafana-influxdb`, then run it using `docker run -d -p 80:80 -p 8083:8083 -p 8086:8086 lcarsos/docker-grafana-influxdb`.
