#!/bin/bash

# Script pour créer un package d'export HTML autonome
# Contient la planche d'essai + tous les fichiers QR codes

EXPORT_DIR="qr_codes_export_html"
DATE=$(date +"%Y%m%d_%H%M")

echo "📁 CRÉATION PACKAGE D'EXPORT HTML"
echo "=================================="
echo ""

# Supprimer ancien export s'il existe
if [ -d "$EXPORT_DIR" ]; then
    echo "🗑️ Suppression de l'ancien export..."
    rm -rf "$EXPORT_DIR"
fi

# Créer structure du dossier d'export
echo "📁 Création de la structure..."
mkdir -p "$EXPORT_DIR"/{images,docs,assets}

# Copier les fichiers QR codes PNG (nécessaires pour HTML)
echo "🖼️ Copie des QR codes PNG..."
cp output/*.png "$EXPORT_DIR/images/"

# Copier les fichiers SVG
echo "🎨 Copie des QR codes SVG..."
cp output/*.svg "$EXPORT_DIR/images/"

# Créer une version modifiée du HTML pour les chemins relatifs
echo "📄 Création du fichier HTML d'export..."
sed 's|src="output/|src="images/|g' test_sheet_print.html > "$EXPORT_DIR/index.html"

# Créer un fichier CSS séparé pour une meilleure organisation
echo "🎨 Extraction du CSS..."
cat > "$EXPORT_DIR/assets/print-styles.css" << 'EOF'
/* Configuration pour impression A4 */
@page {
    size: A4;
    margin: 1.5cm;
}

body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background: white;
}

.page {
    width: 21cm;
    height: 29.7cm;
    padding: 1.5cm;
    box-sizing: border-box;
    background: white;
}

.header {
    text-align: center;
    margin-bottom: 1cm;
}

.title {
    font-size: 18pt;
    font-weight: bold;
    margin-bottom: 0.5cm;
}

.url {
    font-size: 12pt;
    color: #0066cc;
    margin-bottom: 0.3cm;
}

.instructions {
    font-size: 9pt;
    color: #666;
    margin-bottom: 1cm;
}

.qr-grid {
    display: flex;
    flex-wrap: wrap;
    gap: 0.5cm;
    justify-content: flex-start;
    align-items: flex-start;
}

.qr-item {
    display: flex;
    flex-direction: column;
    align-items: center;
    text-align: center;
    border: 1px solid #ddd;
    padding: 0.3cm;
    background: #fafafa;
}

.qr-code {
    margin-bottom: 0.2cm;
}

/* Dimensions exactes pour chaque type */
.qr-ultra-mini .qr-code { width: 1.2cm; height: 1.2cm; }
.qr-mini .qr-code { width: 1.9cm; height: 1.9cm; }
.qr-compact .qr-code { width: 3.7cm; height: 3.7cm; }
.qr-standard .qr-code { width: 5.0cm; height: 5.0cm; }
.qr-resistant .qr-code { width: 6.9cm; height: 6.9cm; }

.qr-label {
    font-size: 10pt;
    font-weight: bold;
    margin-bottom: 0.1cm;
}

.qr-description {
    font-size: 8pt;
    color: #666;
    margin-bottom: 0.1cm;
}

.qr-dimensions {
    font-size: 7pt;
    color: #999;
}

.footer {
    position: absolute;
    bottom: 1cm;
    left: 50%;
    transform: translateX(-50%);
    font-size: 8pt;
    color: #666;
    text-align: center;
}

/* Styles pour impression */
@media print {
    body { -webkit-print-color-adjust: exact; }
    .page { page-break-after: always; }
    .no-print { display: none; }
}

/* Instructions écran */
.screen-instructions {
    background: #e3f2fd;
    padding: 1cm;
    margin-bottom: 1cm;
    border-radius: 0.5cm;
    border: 2px solid #2196f3;
}

@media print {
    .screen-instructions { display: none; }
}
EOF

# Créer une galerie de tous les QR codes
echo "🖼️ Création de la galerie complète..."
cat > "$EXPORT_DIR/gallery.html" << 'EOF'
<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Galerie QR Codes - Apéro Blockchain Samui</title>
    <style>
        body { font-family: Arial, sans-serif; margin: 20px; background: #f5f5f5; }
        .header { text-align: center; margin-bottom: 30px; background: white; padding: 20px; border-radius: 10px; }
        .gallery { display: grid; grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); gap: 20px; }
        .qr-card { 
            background: white; 
            border-radius: 10px; 
            padding: 20px; 
            text-align: center; 
            box-shadow: 0 2px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s;
        }
        .qr-card:hover { transform: translateY(-5px); }
        .qr-image { max-width: 200px; margin: 10px auto; display: block; }
        .qr-title { font-weight: bold; color: #333; margin: 10px 0 5px 0; }
        .qr-info { color: #666; font-size: 0.9em; margin: 5px 0; }
        .qr-size { color: #999; font-size: 0.8em; }
        .format-toggle { margin: 20px 0; text-align: center; }
        .format-toggle button { 
            background: #2196f3; 
            color: white; 
            border: none; 
            padding: 10px 20px; 
            margin: 0 10px; 
            border-radius: 5px; 
            cursor: pointer;
        }
        .format-toggle button.active { background: #1976d2; }
        .download-link { 
            display: inline-block; 
            margin-top: 10px; 
            padding: 5px 15px; 
            background: #4caf50; 
            color: white; 
            text-decoration: none; 
            border-radius: 3px; 
            font-size: 0.8em;
        }
        .back-link {
            display: inline-block;
            margin: 20px;
            padding: 10px 20px;
            background: #ff9800;
            color: white;
            text-decoration: none;
            border-radius: 5px;
        }
    </style>
</head>
<body>
    <a href="index.html" class="back-link">← Retour à la planche d'essai</a>
    
    <div class="header">
        <h1>Galerie Complète QR Codes</h1>
        <p><strong>Apéro Blockchain Samui (FR)</strong></p>
        <p>URL: <a href="https://abs-fr.github.io/littlelink/" target="_blank">https://abs-fr.github.io/littlelink/</a></p>
    </div>

    <div class="format-toggle">
        <button onclick="showFormat('png')" id="btn-png" class="active">PNG (Bitmap)</button>
        <button onclick="showFormat('svg')" id="btn-svg">SVG (Vectoriel)</button>
    </div>

    <div class="gallery" id="gallery">
        <!-- Le contenu sera généré par JavaScript -->
    </div>

    <script>
        const qrCodes = [
EOF

# Générer la liste des QR codes pour le JavaScript
echo "🔄 Génération de la liste des QR codes..."
for file in output/*.png; do
    if [ -f "$file" ]; then
        filename=$(basename "$file" .png)
        # Déterminer la taille et description basée sur le nom
        case "$filename" in
            *"6cm-compact"*) size="1.2×1.2cm"; desc="Carte visite ultra-mini" ;;
            *"mini-print"*) size="1.9×1.9cm"; desc="Autocollant mini" ;;
            *"style-blue"*) size="3.7×3.7cm"; desc="Corporate bleu" ;;
            *"style-red"*) size="3.7×3.7cm"; desc="Rouge accent" ;;
            *"qr-mobile"*) size="5.0×5.0cm"; desc="Optimal mobile ⭐" ;;
            *"solid-bordeaux"*) size="5.0×5.0cm"; desc="Style bordeaux" ;;
            *"high-ecc"*) size="6.9×6.9cm"; desc="Haute résistance" ;;
            *"transparent"*) size="5.0×5.0cm"; desc="Fond transparent" ;;
            *"compact"*) size="3.7×3.7cm"; desc="Version compacte" ;;
            *"medium"*) size="3.7×3.7cm"; desc="Version moyenne" ;;
            *) size="Variable"; desc="QR code standard" ;;
        esac
        
        cat >> "$EXPORT_DIR/gallery.html" << EOF
            { 
                name: "$filename", 
                title: "$(echo $filename | sed 's/-/ /g' | sed 's/abs fr//' | sed 's/test/Test/')", 
                size: "$size", 
                desc: "$desc",
                png: "images/$filename.png",
                svg: "images/$filename.svg"
            },
EOF
    fi
done

# Terminer le fichier JavaScript et HTML
cat >> "$EXPORT_DIR/gallery.html" << 'EOF'
        ];

        let currentFormat = 'png';

        function showFormat(format) {
            currentFormat = format;
            document.getElementById('btn-png').classList.remove('active');
            document.getElementById('btn-svg').classList.remove('active');
            document.getElementById('btn-' + format).classList.add('active');
            generateGallery();
        }

        function generateGallery() {
            const gallery = document.getElementById('gallery');
            gallery.innerHTML = '';
            
            qrCodes.forEach(qr => {
                const card = document.createElement('div');
                card.className = 'qr-card';
                
                const ext = currentFormat;
                const imgPath = ext === 'png' ? qr.png : qr.svg;
                
                card.innerHTML = `
                    <img src="${imgPath}" alt="${qr.title}" class="qr-image" onerror="this.style.display='none'">
                    <div class="qr-title">${qr.title}</div>
                    <div class="qr-info">${qr.desc}</div>
                    <div class="qr-size">Taille d'impression: ${qr.size}</div>
                    <a href="${imgPath}" download class="download-link">Télécharger ${ext.toUpperCase()}</a>
                `;
                
                gallery.appendChild(card);
            });
        }

        // Initialiser la galerie
        generateGallery();
    </script>
</body>
</html>
EOF

# Copier la documentation
echo "📚 Copie de la documentation..."
cp TEST_SHEET_GUIDE.md QUICK_REFERENCE.md COMPLETE_FILE_LIST.md PRINT_RECOMMENDATIONS.md "$EXPORT_DIR/docs/" 2>/dev/null || true

# Créer un README pour l'export
echo "📖 Création du README d'export..."
cat > "$EXPORT_DIR/README.md" << EOF
# QR Codes Export Package - Apéro Blockchain Samui

## 📦 Contenu du Package

### 🖨️ **Planche d'Essai**
- \`index.html\` - Planche d'essai pour impression A4
- \`assets/print-styles.css\` - Styles d'impression optimisés

### 🖼️ **Galerie Complète**
- \`gallery.html\` - Galerie interactive de tous les QR codes
- Visualisation PNG et SVG
- Téléchargement individuel

### 📁 **Fichiers QR Codes**
- \`images/\` - Tous les QR codes PNG et SVG
- $(ls images/*.png 2>/dev/null | wc -l) fichiers PNG (bitmap)
- $(ls images/*.svg 2>/dev/null | wc -l) fichiers SVG (vectoriel)

### 📚 **Documentation**
- \`docs/\` - Guides d'utilisation et recommandations

## 🎯 URL Encodée
**https://abs-fr.github.io/littlelink/**

## 🚀 Utilisation

### **Planche d'Essai**
1. Ouvrir \`index.html\` dans votre navigateur
2. Imprimer en A4, 100% (pas d'ajustement)
3. Tester chaque QR code

### **Galerie**
1. Ouvrir \`gallery.html\` pour voir tous les QR codes
2. Basculer entre PNG et SVG
3. Télécharger individuellement

## 📏 Dimensions d'Impression

- **1.2cm** : Carte de visite (limite)
- **1.9cm** : Autocollant mini
- **3.7cm** : Document compact
- **5.0cm** : Usage général ⭐
- **6.9cm** : Conditions difficiles

## 📱 Test de Scannabilité
- Distance recommandée : 20-30cm
- Applications : Appareil photo natif, Google Lens
- Éclairage : Normal à bon

---
*Package généré le $(date '+%d/%m/%Y à %H:%M')*
*Générateur : Zint via Docker - Réseau tioTools*
EOF

# Compter les fichiers copiés
PNG_COUNT=$(ls "$EXPORT_DIR/images/"*.png 2>/dev/null | wc -l)
SVG_COUNT=$(ls "$EXPORT_DIR/images/"*.svg 2>/dev/null | wc -l)
TOTAL_SIZE=$(du -sh "$EXPORT_DIR" | cut -f1)

echo ""
echo "✅ Package d'export créé avec succès !"
echo ""
echo "📊 Statistiques :"
echo "   📁 Dossier: $EXPORT_DIR"
echo "   🖼️ PNG copiés: $PNG_COUNT"
echo "   🎨 SVG copiés: $SVG_COUNT"
echo "   💾 Taille totale: $TOTAL_SIZE"
echo ""
echo "📋 Structure :"
find "$EXPORT_DIR" -type f | sort | sed 's/^/   📄 /'
echo ""
echo "🌐 Pour utiliser :"
echo "   1. Ouvrir $EXPORT_DIR/index.html (planche d'essai)"
echo "   2. Ouvrir $EXPORT_DIR/gallery.html (galerie complète)"
echo "   3. Transférer le dossier $EXPORT_DIR où vous voulez"
echo ""
echo "📦 Package autonome prêt à l'emploi !"





