# Lab 03: Despliegue mixto en modo PaaS y en modo IaaS

**Asignatura:** Cloud Computing — Máster en Ingeniería Informática
**Alumno:** Roberto Castillo — rct419@inlumine.ual.es
**Enunciado:** https://ualmtorres.github.io/AsignaturaCloudComputing/Labs/Lab03/index.html

Base de datos MySQL gestionada en Cloud SQL (IaaS) y la aplicación SG (catálogo de clientes en PHP) desplegada en dos plataformas PaaS: Vercel y Google App Engine. La conexión a la base de datos se configura con variables de entorno, sin credenciales en el código.

Informe: [`Lab03-Roberto-Castillo.pdf`](Lab03-Roberto-Castillo.pdf) (también en [Word](Lab03-Roberto-Castillo.docx)).
Fork de la aplicación: https://github.com/Defused15/SGApp

## Estructura

```
lab 03/
├── Lab03-Roberto-Castillo.pdf / .docx
├── codigo/
│   ├── vercel.json              # runtime vercel-php y ruta única hacia api/index.php
│   └── api/index.php            # punto de entrada para Vercel; incluye el index.php original
└── docs/img/                    # capturas y salidas (Cloud SQL, Vercel, App Engine)
```

`docs/img/app.yaml.txt` es el descriptor usado en App Engine, con la contraseña enmascarada. El `app.yaml` real solo existió en Cloud Shell y no está en ningún repositorio.

## Recursos

| Componente | Modelo | Servicio | Dirección | Estado |
|---|---|---|---|---|
| Base de datos SG | IaaS | Cloud SQL `sg` (MySQL 8.0, `db-custom-1-3840`, HDD 10 GB, `europe-west1`) | `34.140.133.198` | Detenida |
| Aplicación SG | PaaS | Vercel (`sgapp-rct419`) | https://sgapp-rct419.vercel.app | Publicada |
| Aplicación SG | PaaS | App Engine (`europe-west`, `php82`) | https://cc2026-rct419.ew.r.appspot.com | Desactivada |

## Cómo reproducirlo

1. Crear la instancia de Cloud SQL, autorizar la red `0.0.0.0/0` y cargar `init.sql` con el cliente MySQL de Cloud Shell.
2. **Vercel:** importar el fork, definir `MYSQL_HOST`, `MYSQL_USER` y `MYSQL_PASSWORD` en Production y desplegar con `vercel deploy --prod`.
3. **App Engine:** clonar el fork en Cloud Shell, añadir el bloque `env_variables` al `app.yaml` y ejecutar `gcloud app deploy`.
4. Al terminar: política de activación `NEVER` en Cloud SQL y **Desactivar aplicación** en App Engine.
