# Zint QR Code Generator - Docker

Ce setup Docker permet d'utiliser zint pour générer des QR codes et codes-barres.

## Structure

```
docker/
├── Dockerfile              # Image Docker avec zint installé
├── docker-compose.yaml     # Configuration des services
├── output/                 # Répertoire pour récupérer les QR codes générés
├── input/                  # Répertoire pour les fichiers d'entrée (optionnel)
└── README.md              # Ce fichier
```

## Utilisation

### 1. Construire et démarrer le conteneur

```bash
cd docker/
docker compose up -d --build
```

### 2. Générer des codes-barres et QR codes

```bash
# QR Code classique
docker compose exec zint zint --barcode=58 -o /qrcodes/hello.png -d "Hello World"

# rMQR Code rectangulaire (idéal pour URLs longues)
docker compose exec zint zint --barcode=145 --height=100 --border=10 -o /qrcodes/rmqr.png -d "https://example.com"

# Avec plus d'options (échelle, bordure)
docker compose exec zint zint \
    --barcode=58 \
    --height=200 \
    --scale=2 \
    --border=10 \
    -o /qrcodes/custom.png \
    -d "https://example.com"
```

### 3. Exemple réel - Site Apéro Blockchain Samui

```bash
# rMQR Code pour https://abs-fr.github.io/littlelink/
docker compose exec zint zint --barcode=145 --height=150 --scale=2 \
    -o /qrcodes/abs-fr-rmqr.png -d "https://abs-fr.github.io/littlelink/"

# QR Code classique pour comparaison
docker compose exec zint zint --barcode=58 --height=200 --scale=2 \
    -o /qrcodes/abs-fr-qr.png -d "https://abs-fr.github.io/littlelink/"
```

### 4. Récupérer les codes générés

Les codes générés sont automatiquement disponibles dans le répertoire `output/` de votre machine hôte.

### 5. Batch processing

Placez vos fichiers de données dans le répertoire `input/` et utilisez des scripts :

```bash
# Exemple avec un fichier de données
docker compose exec zint zint -o /qrcodes/data.png --input=/input/data.txt
```

## Commandes utiles

```bash
# Voir l'aide de zint
docker compose exec zint zint --help

# Lister les types de codes-barres supportés
docker compose exec zint zint --types

# Voir les détails d'un type spécifique (ex: rMQR)
docker compose exec zint zint --types | grep -i rmqr

# Arrêter le service
docker compose down

# Reconstruire l'image
docker compose build --no-cache
```

## Types de codes-barres populaires

- `58` : QR Code carré (par défaut)
- `145` : rMQR Code rectangulaire (Rectangular Micro QR)
- `97` : Micro QR Code
- `20` : Code 128
- `8` : EAN-8
- `13` : EAN-13
- `25` : Data Matrix
- `28` : Aztec Code

## Variables d'environnement

- `ZINT_OUTPUT_DIR` : Répertoire de sortie par défaut (`/qrcodes`)
