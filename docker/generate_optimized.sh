#!/bin/bash

# Script pour générer des QR codes optimisés pour le scan mobile
# Usage: ./generate_optimized.sh "URL_ou_texte" [nom_de_base]

if [ $# -lt 1 ]; then
    echo "Usage: $0 \"URL_ou_texte\" [nom_de_base]"
    echo "Exemple: $0 \"https://example.com\" \"mon-site\""
    exit 1
fi

DATA="$1"
BASE_NAME="${2:-qrcode}"

echo "🔄 Génération des QR codes optimisés pour: $DATA"
echo "📁 Nom de base: $BASE_NAME"

# QR Code mobile optimisé (recommandé)
echo "🎯 Génération version mobile (592×592)..."
docker compose exec zint zint \
    --barcode=58 \
    --scale=8 \
    --quietzones \
    --border=32 \
    -o "/qrcodes/${BASE_NAME}-mobile.png" \
    -d "$DATA"

# QR Code haute résistance aux erreurs
echo "🛡️ Génération version haute résistance (820×820)..."
docker compose exec zint zint \
    --barcode=58 \
    --scale=10 \
    --quietzones \
    --secure=3 \
    --border=30 \
    -o "/qrcodes/${BASE_NAME}-high-ecc.png" \
    -d "$DATA"

# QR Code compact
echo "📱 Génération version compacte (444×444)..."
docker compose exec zint zint \
    --barcode=58 \
    --scale=6 \
    --quietzones \
    --secure=1 \
    --border=24 \
    -o "/qrcodes/${BASE_NAME}-compact.png" \
    -d "$DATA"

# rMQR Code rectangulaire
echo "▬ Génération rMQR rectangulaire..."
docker compose exec zint zint \
    --barcode=145 \
    --scale=8 \
    --quietzones \
    --border=20 \
    -o "/qrcodes/${BASE_NAME}-rmqr.png" \
    -d "$DATA"

echo "✅ Génération terminée ! Fichiers créés :"
ls -la output/${BASE_NAME}*.png 2>/dev/null | awk '{print "   📄", $9, "("$5" bytes)"}'

echo ""
echo "🔍 Test recommandé :"
echo "   1. Commencez par ${BASE_NAME}-mobile.png"
echo "   2. Si problème → testez ${BASE_NAME}-high-ecc.png"
echo "   3. Pour format rectangulaire → ${BASE_NAME}-rmqr.png"
echo ""
echo "📖 Voir SCAN_TEST_GUIDE.md pour plus de détails"
