# Docker — AEA0·A2

## Instal·lació

Passos que he seguit per instal·lar Docker sobre Ubuntu:
1. He afegit la clau i el repositori oficials de Docker.
2. He instal·lat `docker-ce` i el plugin `docker-compose-plugin`.
3. He afegit el meu usuari al grup `docker` per executar-lo sense `sudo`.

Versions instal·lades:
- `docker --version` → Docker version 27.x.x
- `docker compose version` → Docker Compose version v2.x.x

## Prova hello-world

$ docker run hello-world
Hello from Docker! ...

## Prova amb Alpine

$ docker run alpine echo "El meu primer contenidor Alpine"
El meu primer contenidor Alpine

## Imatge vs. contenidor

| Concepte   | Què és                                             |
|------------|----------------------------------------------------|
| Imatge     | Plantilla de només lectura amb l'aplicació.        |
| Contenidor | Instància en execució creada a partir d'una imatge.|

## Imatges descarregades

$ docker images
REPOSITORY    TAG       IMAGE ID       CREATED        SIZE
hello-world   latest    ...            ...            ...
alpine        latest    ...            ...            ...
