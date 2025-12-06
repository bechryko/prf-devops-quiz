<!-- cSpell:disable -->

# prf-devops-quiz

Kötelező program az SZTE Programtervező Informatikus MSc szak Programrendszerek fejlesztése, majd Felhő és DevOps alapok tárgyához.

## Programrendszerek fejlesztése

### Feladatkiírás

Szerepkörök: admin és játékos.

Az admin kvízeket hozhat létre kérdésekkel és válaszokkal. A kvízek játékokhoz vannak rendelve, és a játékosok jelentkezhetnek a játékokra. A helyes válaszok száma alapján a játékosok pontokat szerezhetnek, és felkerülhetnek a ranglistára. Csak a játékosok regisztrálhatnak az alkalmazásba. A játékosok listázhatják az elérhető játékokat és elindíthatják a kvízeket a játékokba való belépéssel. Az admin előre regisztrálva van.

### Részletes követelmények

A szervernek REST API-kat kell biztosítania, amelyek felelősek az alapvető CRUD (Create-Read-Update-Delete) műveletekért. Kommunikálnia kell egy MongoDB példánnyal, feldolgoznia a klienstől érkező kéréseket és lekérdezéseket kell indítania az adatbázis felé. A projektnek a CRUD műveleteknél a hitelesítést (csak autentikált felhasználó hajthatja végre) és session-kezelést támogatnia kell. Új felhasználók kezelése érdekében a regisztráció megvalósítása is szükséges.

A web-alkalmazást az Angular 2+ keretrendszer használatával kell implementálni. Egy egyszerű web-alkalmazásnak kell lennie, amely HTTP kéréseket tud indítani REST-en a szerver felé. A web-alkalmazásnak végre kell hajtania az alapvető CRUD műveleteket. A végrehajtott műveletek alapján a szerver visszaválaszol a kliensnek, ami megjeleníti az eredményeket a böngészőben.

Az adatbázisnak egy MongoDB példánynak kell lennie, amely adatokat tud szolgáltatni a szerveren keresztül a kliensnek. A MongoDB lehet helyben host-olt, konténerizál, de akár MongoDB Atlas használata is megengedett. Az adatmodellnek tartalmaznia kell legalább 4 kollekciót és azok megfelelő kapcsolatkezelését. Az adatbázisnak alapértelmezetten tartalmaznia kell néhány demó adatot, amely megjeleníthető a web-alkalmazásban.

### Projekt elindítása

1. A projekt mappájában add ki az `npm run install` parancsot, ami telepíti a frontend és backend dependency-ket!
2. A projekt mappájában add ki az `npm run start-frontend` parancsot!
3. Hogyha nem létezik a Docker container, akkor a backend mappájában (`server`) add ki az `npm run docker` parancsot!
4. A projekt mappájában add ki az `npm run start-backend` parancsot, vagy a backend mappájában az `npm run start` parancsot!

## Felhő és DevOps alapok

### Követelmények

1 projekt teljeskörű CI/CD implementációja.

-  Code (10 pont)
-  Build & Test (15 pont)
-  Release & Deploy (15 pont)
-  Monitor & Feedback (10 pont)
-  Tool-ok: legalább 5 használata (Git, Docker nem számít)
-  Readme a projekthez (működésről)

#### Felhasznált technológiák

-  Git
-  Docker (és docker-compose)
-  Jenkins
-  Nginx
-  Kubernetes
-  Terraform

### Indítás (docker-compose)

A projektet a root mappából lehet elindítani az `npm run start` paranccsal. Ez létrehozza a szükséges Docker image-eket (frontend, backend, adatbázis, Jenkins), és futtatja őket.

Az alkalmazás ezután elérhető a `localhost` címen.

#### Jenkins

A Jenkins most a `localhost:8080` címen érhető el. Az alapértelmezett plugin-okon kívül a NodeJS plugin-t kell telepíteni. Szükséges konfigurálni egy 22.19.0-s NodeJS verziót "NodeJS 22.19.0" néven, ezután pedig egy új job-ot létrehozni ("Pipeline" típussal) a `jenkins` mappában található `Jenkinsfile` alapján. Ezután a job futtatható.

Az `admin-password.txt` fájlban érdemes eltárolni az első indításkor a konzolra kiírt admin jelszót, hogy később be lehessen vele jelentkezni. Az eredetileg benne lévő jelszó nem használható, csak a fejlesztés megkönnyítése érdekében van ott.

### Indítás (Kubernetes)

Kubernetes és Skaffold használatával az `npm run start-kubernetes` paranccsal lehet elindítani az alkalmazást. Ehhez telepítve kell, hogy legyen minikube és skaffold az eszközre.
