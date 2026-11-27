# Lab 05: Despliegue de contenedores en OpenStack-DI y en Google Cloud

**Asignatura:** Cloud Computing — Máster en Ingeniería Informática
**Alumno:** Roberto Castillo — rct419@inlumine.ual.es
**Enunciado:** https://ualmtorres.github.io/AsignaturaCloudComputing/Labs/Lab05/index.html

Una imagen Docker propia (web estática servida por Apache `httpd`) subida a Docker Hub y desplegada en tres sitios: una VM de OpenStack con Docker, una VM de Compute Engine y Cloud Run.

Informe: [`Lab05-Roberto-Castillo.pdf`](Lab05-Roberto-Castillo.pdf) (también en [Word](Lab05-Roberto-Castillo.docx)).
Vídeo con los tres despliegues funcionando: [`Lab05-funcionando.mp4`](Lab05-funcionando.mp4)
Fork de la web: https://github.com/Defused15/webEstaticaBasica · Imagen: https://hub.docker.com/r/defused/web-estatica-basica

## Estructura

```
lab 05/
├── Lab05-Roberto-Castillo.pdf / .docx
├── Lab05-funcionando.mp4
├── codigo/
│   ├── Dockerfile               # FROM httpd:2.4, copia index.html a /usr/local/apache2/htdocs/
│   └── index.html               # web con nombre y usuario UAL
├── scripts/
│   ├── docker.sh                # script de personalización de OpenStack (Docker + Docker Compose)
│   └── gce-startup.sh           # script de inicio de la VM de Compute Engine (docker run)
└── docs/img/                    # capturas y salidas de los comandos
```

## Recursos

| Despliegue | Recurso | Dirección | Estado |
|---|---|---|---|
| OpenStack | VM `rct419-docker` (m1.small, Ubuntu 24.04) | `http://192.168.70.42` | En marcha |
| Compute Engine | VM `web-estatica-basica` (g1-small, Container-Optimized OS, `europe-west1-b`) | `http://34.76.223.195` | Detenida tras grabar el vídeo |
| Cloud Run | Servicio `web-estatica-basica` (`europe-west1`, puerto 80, 0–3 instancias) | https://web-estatica-basica-411000775826.europe-west1.run.app | Escala a 0 sin tráfico |

## Cómo reproducirlo

```bash
# Imagen para amd64 y arm64 (el equipo de desarrollo es ARM y las VMs x86)
docker buildx build --platform linux/amd64,linux/arm64 -t defused/web-estatica-basica:v0 --push codigo/

# OpenStack: en la VM creada con scripts/docker.sh
docker run -d --name web-estatica-basica -p 80:80 defused/web-estatica-basica:v0

# Compute Engine (la opción "desplegar contenedor" está retirada; se usa COS + script de inicio)
gcloud compute instances create web-estatica-basica --zone europe-west1-b --machine-type g1-small \
    --image-family cos-stable --image-project cos-cloud --tags http-server \
    --metadata-from-file startup-script=scripts/gce-startup.sh

# Cloud Run (gcr.io servido por Artifact Registry)
gcloud artifacts repositories create gcr.io --repository-format=docker --location=us
docker tag defused/web-estatica-basica:v0 gcr.io/cc2026-rct419/web-estatica-basica:v0
docker push gcr.io/cc2026-rct419/web-estatica-basica:v0
gcloud run deploy web-estatica-basica --image gcr.io/cc2026-rct419/web-estatica-basica:v0 \
    --region europe-west1 --port 80 --allow-unauthenticated --min-instances 0 --max-instances 3
```
