# Prácticas de Cloud Computing

**Asignatura:** Cloud Computing — Máster en Ingeniería Informática (Universidad de Almería)
**Alumno:** Roberto Castillo — rct419@inlumine.ual.es
**Profesores:** Manuel Torres Gil y Francisco José García

| Lab | Tema | Carpeta |
|---|---|---|
| 01 | Creación de máquinas virtuales en OpenStack, Google Cloud y Azure | [`lab 01`](lab%2001/) |
| 03 | Despliegue mixto en modo PaaS y en modo IaaS (Cloud SQL, Vercel, App Engine) | [`lab 03`](lab%2003/) |
| 05 | Despliegue de contenedores en OpenStack y en Google Cloud (Docker Hub, Compute Engine, Cloud Run) | [`lab 05`](lab%2005/) |

Cada carpeta tiene el informe en PDF y Word (`LabNN-Roberto-Castillo.pdf/.docx`). En `docs/img/` están las capturas y las salidas de los comandos que aparecen en el informe, y en `scripts/` y `codigo/` los ficheros usados en el despliegue.

## Cuentas y proyectos

| Plataforma | Proyecto / cuenta | Notas |
|---|---|---|
| OpenStack (UAL) | `rct419-MII2027` | Horizon en `http://192.168.64.50`, solo accesible con la VPN de la UAL |
| Google Cloud | `cc2026-rct419` | Cuenta de prueba gratuita; presupuesto `cc2026-mes` con alertas al 50, 90 y 100 % |
| Microsoft Azure | Azure for Students | Solo permite algunas regiones (la cuenta se creó desde México), por eso se usa `westus2` |
| Vercel | `sgapp-rct419` | Plan Hobby, despliegue continuo desde GitHub |
| Docker Hub | `defused` | Imagen `defused/web-estatica-basica:v0` |

## Recursos creados

| Lab | Recurso | Plataforma | Dirección | Estado |
|---|---|---|---|---|
| 01 | VM `rct419-vm` (m1.medium, Ubuntu 24.04) | OpenStack | `192.168.70.250` (IP flotante) | En marcha |
| 01 | Volumen `rct419-volume` (1 GB) + transferencia `rct419-transfer` | OpenStack | — | Disponible |
| 01 | VM `lab01-web` (e2-small, Apache) | Google Cloud | `http://34.175.116.27` | En marcha hasta la corrección |
| 01 | VM `lab01-web` (Standard_B2pts_v2, cloud-init) | Azure | `http://40.125.87.41` | En marcha hasta la corrección |
| 03 | Instancia MySQL `sg` (Cloud SQL) | Google Cloud | `34.140.133.198` | Detenida |
| 03 | Aplicación SG | Vercel | https://sgapp-rct419.vercel.app | Publicada (sin datos mientras la BD está detenida) |
| 03 | Aplicación SG | App Engine | https://cc2026-rct419.ew.r.appspot.com | Desactivada |
| 05 | VM `rct419-docker` (m1.small, Docker) | OpenStack | `http://192.168.70.42` | En marcha |
| 05 | VM `web-estatica-basica` (g1-small, Container-Optimized OS) | Google Cloud | `http://34.76.223.195` | Detenida (ver vídeo) |
| 05 | Servicio `web-estatica-basica` | Cloud Run | https://web-estatica-basica-411000775826.europe-west1.run.app | Escala a 0 sin tráfico |

## Repositorios relacionados

| Repositorio | Uso |
|---|---|
| [Defused15/SGApp](https://github.com/Defused15/SGApp) | Fork de la aplicación SG con la configuración para Vercel (Lab 03) |
| [Defused15/webEstaticaBasica](https://github.com/Defused15/webEstaticaBasica) | Fork de la web estática con el `Dockerfile` basado en `httpd` (Lab 05) |
