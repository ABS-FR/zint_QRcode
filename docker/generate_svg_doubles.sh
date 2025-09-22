#!/bin/bash

# Script pour générer les versions SVG de tous les QR codes PNG
# Génère des équivalents vectoriels avec les mêmes caractéristiques

URL="https://abs-fr.github.io/littlelink/"

echo "🔄 Génération des versions SVG pour tous les QR codes PNG"
echo "======================================================="
echo ""

# Fonction générique pour créer un SVG
generate_svg() {
    local png_name="$1"
    local svg_name="$2"
    local scale="$3"
    local extra_opts="$4"
    
    echo "📄 $png_name → $svg_name"
    
    docker compose exec zint zint \
        --barcode=58 \
        --scale="$scale" \
        --quietzones \
        --filetype=SVG \
        $extra_opts \
        -o "/qrcodes/$svg_name" \
        -d "$URL"
}

# Versions mini/compactes (échelle 2-3)
echo "🏷️ VERSIONS MINI/COMPACTES:"
generate_svg "abs-fr-6cm-compact.png" "abs-fr-6cm-compact.svg" "2" "--border=4"
generate_svg "abs-fr-mini-print.png" "abs-fr-mini-print.svg" "3" "--border=6"

# Versions standard compactes 444px (échelle 6) 
echo ""
echo "📑 VERSIONS COMPACTES 3.7cm:"
generate_svg "abs-fr-fixed-dots-solid.png" "abs-fr-fixed-dots-solid.svg" "6" "--fg=8B0000 --bg=FFE4E1"
generate_svg "abs-fr-qr-medium.png" "abs-fr-qr-medium.svg" "6" "--secure=1 --border=24"
generate_svg "abs-fr-style-blue.png" "abs-fr-style-blue.svg" "6" "--fg=2D5AA0 --bg=F0F8FF"
generate_svg "abs-fr-style-red.png" "abs-fr-style-red.svg" "6" "--fg=FF0000 --bg=FFFFFF"
generate_svg "abs-fr-style-reverse.png" "abs-fr-style-reverse.svg" "6" "--reverse --border=10"
generate_svg "test-abs-fr-compact.png" "test-abs-fr-compact.svg" "6" "--secure=1 --border=24"

# Versions standard 592px (échelle 8)
echo ""
echo "⭐ VERSIONS STANDARD 5.0cm:"
generate_svg "abs-fr-qr-mobile.png" "abs-fr-qr-mobile.svg" "8" "--border=32"
generate_svg "abs-fr-qr-optimized.png" "abs-fr-qr-optimized.svg" "8" "--border=20"
generate_svg "abs-fr-solid-bordeaux.png" "abs-fr-solid-bordeaux.svg" "8" "--fg=8B0000 --bg=FFE4E1 --border=12"
generate_svg "abs-fr-style-transparent.png" "abs-fr-style-transparent.svg" "8" "--fg=2E8B57 --nobackground"
generate_svg "test-abs-fr-mobile.png" "test-abs-fr-mobile.svg" "8" "--border=32"

# Versions résistantes 820px (échelle 10)
echo ""
echo "🛡️ VERSIONS HAUTE RÉSISTANCE 6.9cm:"
generate_svg "abs-fr-qr-high-ecc.png" "abs-fr-qr-high-ecc.svg" "10" "--secure=3 --border=30"
generate_svg "test-abs-fr-high-ecc.png" "test-abs-fr-high-ecc.svg" "10" "--secure=3 --border=30"

# Versions expérimentales/spéciales
echo ""
echo "🧪 VERSIONS EXPÉRIMENTALES:"
generate_svg "abs-fr-dots-dense.png" "abs-fr-dots-dense.svg" "6" "--fg=8B0000 --bg=FFE4E1 --border=6"
generate_svg "abs-fr-dots-compact.png" "abs-fr-dots-compact.svg" "8" "--fg=2E8B57 --bg=FFFFFF"

# Version très haute résolution (réduction d'échelle pour SVG)
echo ""
echo "📐 VERSION HAUTE RÉSOLUTION (réduite pour SVG):"
generate_svg "abs-fr-print-6cm.png" "abs-fr-print-6cm.svg" "12" "--secure=3 --border=20"

echo ""
echo "✅ Génération terminée !"
echo ""
echo "📊 Fichiers créés:"
ls -la output/*.svg 2>/dev/null | wc -l | xargs echo "   🎨 Fichiers SVG:"
ls -la output/*.png 2>/dev/null | wc -l | xargs echo "   📄 Fichiers PNG:"

echo ""
echo "🔍 Comparaison des tailles:"
echo "PNG total: $(du -sh output/*.png 2>/dev/null | awk '{sum+=$1} END {print sum "K"}')"
echo "SVG total: $(du -sh output/*.svg 2>/dev/null | awk '{sum+=$1} END {print sum "K"}')"
