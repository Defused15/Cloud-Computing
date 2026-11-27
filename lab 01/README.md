# Lab 01: Creación de máquinas virtuales en OpenStack, Google Cloud y Azure

**Asignatura:** Cloud Computing — Máster en Ingeniería Informática
**Alumno:** Roberto Castillo — rct419@inlumine.ual.es
**Enunciado:** https://ualmtorres.github.io/AsignaturaCloudComputing/Labs/Lab01/index.html

Creación de una máquina virtual en cada una de las tres nubes de la asignatura: OpenStack (nube privada de la UAL), Google Cloud y Microsoft Azure. En OpenStack se trabaja además con un volumen de almacenamiento de bloques y su transferencia al profesor.

Informe: [`Lab01-Roberto-Castillo.pdf`](Lab01-Roberto-Castillo.pdf) (también en [Word](Lab01-Roberto-Castillo.docx)).

> En esta copia del informe la clave de autorización de la transferencia del volumen aparece tapada. La clave solo se entregó por el Aula Virtual.

## Estructura

```
lab 01/
├── Lab01-Roberto-Castillo.pdf / .docx
├── scripts/
│   └── cloud-init.sh            # script de inicio de la VM de Azure (Apache + web de ejemplo)
└── docs/img/                    # capturas de Horizon, GCP y Azure y salidas de los comandos
```

## Recursos

| Nube | Recurso | Características | Dirección |
|---|---|---|---|
| OpenStack | VM `rct419-vm` | m1.medium, Ubuntu Noble 24.04, par de claves `rct419-key` | `192.168.70.250` (IP flotante) |
| OpenStack | Volumen `rct419-volume` | 1 GB, ext4, contiene `rct419.txt`; transferencia `rct419-transfer` | — |
| Google Cloud | VM `lab01-web` | e2-small, `europe-southwest1-a`, Apache con web estática | `http://34.175.116.27` |
| Azure | VM `lab01-web` | Standard_B2pts_v2 (ARM64), `westus2`, Apache con cloud-init | `http://40.125.87.41` |

## Resumen

1. **OpenStack:** red, subred y router del proyecto; importación del par de claves; regla SSH en el grupo `default`; lanzamiento de la instancia sin volumen nuevo; IP flotante; acceso por SSH y claves públicas de los profesores en `authorized_keys`.
2. **Volumen:** creación, conexión a la instancia, formato ext4 y montaje, fichero `rct419.txt`, desconexión y creación de la transferencia.
3. **Google Cloud:** VM con tráfico HTTP permitido (regla `default-allow-http`) y Apache sirviendo una web estática.
4. **Azure:** la suscripción de estudiante solo permite algunas regiones (cuenta creada desde México), así que se usó `westus2` con un tamaño ARM64 disponible. Apache se instala con un script de cloud-init y se abre el puerto 80 en el NSG.
