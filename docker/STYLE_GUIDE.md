# Guide de Stylisation QR Codes - Zint

## 🎨 Options de stylisation disponibles

### 🌈 **Couleurs personnalisées**
```bash
# Couleurs au format hexadécimal (RGB)
--fg=FF0000          # Rouge
--bg=FFFFFF          # Fond blanc
--fg=2E8B57 --bg=F0F8FF  # Vert sur bleu clair
```

### 🔄 **Effets de style**
```bash
--reverse            # Couleurs inversées (blanc sur noir)
--nobackground       # Fond transparent (PNG/SVG)
--dotty              # Points au lieu de carrés
--dotsize=0.8        # Taille des points (0.1 à 1.0)
```

### 📐 **Formats et tailles**
```bash
--scale=6            # Taille du symbole
--border=10          # Bordure en pixels
--filetype=SVG       # Format vectoriel pour édition avancée
```

## 🎯 Exemples créés pour Apéro Blockchain Samui

### **Style Classique**
- `abs-fr-style-red.png` - Rouge vif (#FF0000)
- `abs-fr-style-blue.png` - Bleu marine (#000080)
- `abs-fr-style-reverse.png` - Blanc sur noir

### **Style Moderne** 
- `abs-fr-style-dots.png` - Points bordeaux (#8B0000)
- `abs-fr-style-transparent.png` - Vert transparent (#2E8B57)
- `abs-fr-rmqr-style-dots.png` - rMQR violet avec points (#4B0082)

### **Style Corporate**
- `abs-fr-rmqr-corporate.png` - Bleu professionnel (#2D5AA0)
- `abs-fr-style-orange.svg` - Orange vectoriel (#FF6B35)

## 🎨 Palettes de couleurs suggérées

### **Blockchain/Crypto Theme** 🔗
```bash
# Bitcoin Orange
--fg=F7931A --bg=FFF8E7

# Ethereum Blue
--fg=627EEA --bg=F0F4FF

# Gold/Black Luxury
--fg=FFD700 --bg=000000
```

### **Corporate/Professional** 💼
```bash
# Bleu corporate
--fg=2D5AA0 --bg=F8F9FA

# Gris moderne
--fg=343A40 --bg=F8F9FA

# Vert finance
--fg=28A745 --bg=F8FFF8
```

### **Creative/Artistic** 🎭
```bash
# Violet créatif
--fg=6F42C1 --bg=F8F6FF

# Rose moderne
--fg=E91E63 --bg=FFF0F5

# Teal design
--fg=20C997 --bg=F0FFFC
```

## ⚠️ Bonnes pratiques

### ✅ **À FAIRE**
- Maintenir un **contraste élevé** (ratio 4.5:1 minimum)
- Tester la **scannabilité** après stylisation
- Utiliser des **couleurs sombres** pour le premier plan
- Garder un **fond clair** pour la lisibilité

### ❌ **À ÉVITER**
- Couleurs trop similaires (faible contraste)
- Couleurs jaune/cyan sur fond blanc
- Effets qui masquent les patterns de position
- Logos ou texte superposés sur les données

## 🔧 Commandes pratiques

### QR Code coloré basique
```bash
docker compose exec zint zint \
    --barcode=58 --scale=6 --quietzones \
    --fg=2E8B57 --bg=F0F8FF \
    -o /qrcodes/mon-qr-vert.png \
    -d "https://mon-url.com"
```

### rMQR avec style dotty
```bash
docker compose exec zint zint \
    --barcode=145 --scale=6 --quietzones \
    --dotty --dotsize=0.8 \
    --fg=4B0082 --bg=E6E6FA \
    -o /qrcodes/mon-rmqr-dots.png \
    -d "https://mon-url.com"
```

### Format vectoriel SVG
```bash
docker compose exec zint zint \
    --barcode=58 --scale=6 --quietzones \
    --fg=FF6B35 --bg=F7F7F7 \
    --filetype=SVG \
    -o /qrcodes/mon-qr.svg \
    -d "https://mon-url.com"
```

## 📱 Test de compatibilité

1. **Imprimez** le QR stylisé
2. **Testez** avec différentes applications :
   - Appareil photo natif (iOS/Android)
   - Google Lens
   - Applications QR dédiées
3. **Vérifiez** la lisibilité à différentes distances
4. **Ajustez** les couleurs si nécessaire

## 🎨 Stylisation avancée

Pour des styles très personnalisés :
1. Générez en **format SVG**
2. Éditez avec **Inkscape** ou **Adobe Illustrator**
3. Ajoutez logos, dégradés, effets
4. **Testez toujours** la scannabilité après modification

---
*QR codes pour https://abs-fr.github.io/littlelink/ - Réseau tioTools*





