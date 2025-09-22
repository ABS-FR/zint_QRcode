#!/bin/bash

# Script pour générer des QR codes stylisés
# Usage: ./generate_styled.sh "URL_ou_texte" [style] [nom_base]

if [ $# -lt 1 ]; then
    echo "Usage: $0 \"URL_ou_texte\" [style] [nom_base]"
    echo ""
    echo "Styles disponibles:"
    echo "  red, blue, green, orange, purple, gold"
    echo "  dots, reverse, transparent, corporate"
    echo "  crypto, ethereum, bitcoin"
    echo "  Ou 'all' pour générer tous les styles"
    echo ""
    echo "Exemples:"
    echo "  $0 \"https://example.com\" blue"
    echo "  $0 \"https://example.com\" dots mon-site"
    echo "  $0 \"https://example.com\" all"
    exit 1
fi

DATA="$1"
STYLE="${2:-blue}"
BASE_NAME="${3:-styled-qr}"

echo "🎨 Génération QR stylisé pour: $DATA"
echo "🎯 Style: $STYLE | Base: $BASE_NAME"

generate_style() {
    local style_name="$1"
    local fg_color="$2"
    local bg_color="$3"
    local extra_opts="$4"
    local file_ext="${5:-png}"
    
    echo "🔄 Génération style $style_name..."
    
    docker compose exec zint zint \
        --barcode=58 \
        --scale=6 \
        --quietzones \
        --fg="$fg_color" \
        --bg="$bg_color" \
        $extra_opts \
        -o "/qrcodes/${BASE_NAME}-${style_name}.${file_ext}" \
        -d "$DATA"
}

generate_rmqr_style() {
    local style_name="$1"
    local fg_color="$2" 
    local bg_color="$3"
    local extra_opts="$4"
    
    echo "▬ Génération rMQR style $style_name..."
    
    docker compose exec zint zint \
        --barcode=145 \
        --scale=6 \
        --quietzones \
        --fg="$fg_color" \
        --bg="$bg_color" \
        $extra_opts \
        -o "/qrcodes/${BASE_NAME}-rmqr-${style_name}.png" \
        -d "$DATA"
}

case "$STYLE" in
    "red")
        generate_style "red" "FF0000" "FFFFFF"
        ;;
    "blue")
        generate_style "blue" "2D5AA0" "F0F8FF"
        ;;
    "green")
        generate_style "green" "2E8B57" "F0F8FF"
        ;;
    "orange")
        generate_style "orange" "FF6B35" "FFF8E7" "--filetype=SVG" "svg"
        ;;
    "purple")
        generate_style "purple" "6F42C1" "F8F6FF"
        ;;
    "gold")
        generate_style "gold" "FFD700" "000000"
        ;;
    "dots")
        echo "⚠️  Style dots modifié pour meilleure scannabilité"
        generate_style "dots-solid" "8B0000" "FFE4E1" ""
        generate_rmqr_style "dots-solid" "4B0082" "E6E6FA" ""
        # Version dotty haute densité (à tester)
        generate_style "dots-experimental" "000000" "FFFFFF" "--dotty --dotsize=0.95 --scale=10"
        ;;
    "reverse")
        generate_style "reverse" "FFFFFF" "000000" "--reverse"
        ;;
    "transparent")
        generate_style "transparent" "2E8B57" "FFFFFF" "--nobackground"
        ;;
    "corporate")
        generate_style "corporate" "2D5AA0" "F8F9FA"
        generate_rmqr_style "corporate" "2D5AA0" "F8F9FA"
        ;;
    "crypto"|"bitcoin")
        generate_style "bitcoin" "F7931A" "FFF8E7"
        ;;
    "ethereum")
        generate_style "ethereum" "627EEA" "F0F4FF"
        ;;
    "all")
        echo "🌈 Génération de tous les styles..."
        for style in red blue green orange purple gold dots reverse transparent corporate bitcoin ethereum; do
            $0 "$DATA" "$style" "$BASE_NAME"
        done
        ;;
    *)
        echo "❌ Style '$STYLE' non reconnu"
        echo "Styles disponibles: red, blue, green, orange, purple, gold, dots, reverse, transparent, corporate, bitcoin, ethereum, all"
        exit 1
        ;;
esac

echo "✅ Génération terminée !"
ls -la output/${BASE_NAME}*.* 2>/dev/null | awk '{print "   🎨", $9, "("$5" bytes)"}'
echo ""
echo "🔍 N'oubliez pas de tester la scannabilité !"
echo "📖 Voir STYLE_GUIDE.md pour plus d'options"
