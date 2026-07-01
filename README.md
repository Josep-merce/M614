
# AEA1 — Servidors web

**Alumne:** Nom i cognoms
**Branca:** aea1

Estructura de la branca:

- `arxius/aX/` — codi de cada activitat
- `evidencies/aX/` — captures de pantalla de cada activitat

---

## A1 · Servidor Apache (localhost)

### Passos realitzats
1. Actualització de paquets: `sudo apt update`
2. Instal·lació: `sudo apt install apache2 -y`
3. Comprovació del servei: `sudo systemctl status apache2`
4. Publicació de la meva pàgina a `/var/www/html/index.html`

### Fitxers de configuració d'Apache identificats
- `/etc/apache2/apache2.conf` — configuració principal
- `/etc/apache2/ports.conf` — ports d'escolta
- `/var/www/html/` — arrel del document

### Verificació
- `curl -I http://localhost` retorna `200 OK`
- Pàgina visible al navegador a http://localhost

### Captures
![Pàgina a localhost](evidencies/a1/pagina-localhost.png)
![Estat del servei Apache](evidencies/a1/apache-status.png)

---

## A2 · Servidor web en contenidor Docker

### Decisió: imatge triada
He fet servir `httpd` (o `nginx`) perquè... [justificació breu]

### Passos realitzats
1. Descàrrega de la imatge: `docker pull httpd:latest`
2. Contenidor amb volum i mapatge de ports:
   `docker run -d --name web-aea1 -p 8080:80 -v "$(pwd)/web":/usr/local/apache2/htdocs/ httpd:latest`
3. Comprovació: `docker ps`

### Verificació
- `curl -I http://localhost:8080` retorna `200 OK`
- Pàgina visible al navegador a http://localhost:8080

### Captures
![Contenidor en execució](evidencies/a2/docker-ps.png)
![Pàgina al port 8080](evidencies/a2/pagina-8080.png)

---

## A3 · Desplegament al núvol (S3 i EC2)

### Decisions preses
- S3 per a la web estàtica (servei gestionat, sense administrar servidor).
- EC2 + Apache per tenir un servidor propi i configurable.

### Passos realitzats
1. Bucket S3 a us-east-1 amb hosting web activat.
2. Bucket policy pública amb `s3:GetObject`.
3. Instància EC2 (Amazon Linux 2023) amb Apache i ports 22 i 80 oberts.

### URL públiques
- S3: http://EL-TEU-BUCKET.s3-website-us-east-1.amazonaws.com
- EC2: http://<IP-PUBLICA>

### Comparativa S3 vs EC2
| | S3 | EC2 |
|---|---|---|
| Administres el servidor? | No | Sí |
| Cost/manteniment | Baix | Més alt |

### Captures
![Web des d'S3](evidencies/a3/s3-web.png)
![EC2 en Running](evidencies/a3/ec2-running.png)