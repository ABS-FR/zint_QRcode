#!/bin/bash

# Script pour générer rapidement les planches d'essai
# Usage: ./generate_test_sheet.sh [custom_url]

URL="${1:-https://abs-fr.github.io/littlelink/}"

echo "🖨️ GÉNÉRATION PLANCHE D'ESSAI"
echo "============================="
echo ""
echo "🎯 URL: $URL"
echo ""

# Vérifier que les QR codes existent
if [ ! -f "output/abs-fr-qr-mobile.png" ]; then
    echo "⚠️ Les QR codes ne semblent pas exister."
    echo "Exécutez d'abord : ./generate_optimized.sh \"$URL\""
    exit 1
fi

# Générer les planches
echo "🔄 Génération des planches d'essai..."

# Planche SVG avancée
python3 create_test_sheet.py

# Vérifier les résultats
if [ -f "test_sheet_print.html" ] && [ -f "test_sheet_print.svg" ]; then
    echo ""
    echo "✅ Planches d'essai créées avec succès !"
    echo ""
    echo "📋 Fichiers générés:"
    ls -la test_sheet_print.* | while read line; do 
        echo "   $(echo "$line" | awk '{print "📄", $9, "("$5" bytes)"}')"
    done
    
    echo ""
    echo "🖨️ INSTRUCTIONS D'IMPRESSION:"
    echo "   1. Ouvrir test_sheet_print.html dans votre navigateur"
    echo "   2. Imprimer en format A4, 100% (pas d'ajustement)"
    echo "   3. Vérifier dimensions : 21×29.7cm"
    echo "   4. Tester chaque QR à 20-30cm de distance"
    echo ""
    echo "📖 Guide détaillé : TEST_SHEET_GUIDE.md"
    echo ""
    echo "🌐 Ouvrir la planche maintenant ? (o/n)"
    read -r response
    if [ "$response" = "o" ] || [ "$response" = "O" ]; then
        if command -v firefox >/dev/null 2>&1; then
            firefox test_sheet_print.html &
        elif command -v chrome >/dev/null 2>&1; then
            chrome test_sheet_print.html &
        elif command -v chromium >/dev/null 2>&1; then
            chromium test_sheet_print.html &
        else
            echo "Ouvrez manuellement test_sheet_print.html dans votre navigateur"
        fi
    fi
    
else
    echo "❌ Erreur lors de la génération des planches"
    exit 1
fi





