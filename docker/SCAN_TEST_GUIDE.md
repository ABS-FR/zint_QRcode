# Guide de Test des QR Codes - Apéro Blockchain Samui

## 🔍 Problème initial
Les QR codes générés initialement étaient trop petits et sans zones de silence, ce qui les rendait difficiles à scanner.

## ✅ Versions optimisées créées

### 1. **abs-fr-qr-mobile.png** (592×592) - RECOMMANDÉ ⭐
- **Usage** : Scan mobile général
- **Caractéristiques** : Équilibre optimal taille/qualité
- **Test avec** : Toutes applications de scan mobiles

### 2. **abs-fr-qr-high-ecc.png** (820×820) - HAUTE RÉSISTANCE 🛡️
- **Usage** : Conditions difficiles (flou, distance, luminosité)
- **Caractéristiques** : Correction d'erreur maximale (niveau H)
- **Test avec** : Conditions de scan difficiles

### 3. **abs-fr-qr-medium.png** (444×444) - COMPACT 📱
- **Usage** : Écrans plus petits, impression réduite
- **Caractéristiques** : Plus petit mais toujours scannable
- **Test avec** : Applications mobiles basiques

### 4. **abs-fr-qr-optimized.png** (592×592) - ÉQUILIBRÉ
- **Usage** : Usage général avec zones de silence
- **Caractéristiques** : Version de base optimisée
- **Test avec** : Applications standard

### 5. **abs-fr-rmqr-optimized.png** (752×336) - RECTANGULAIRE
- **Usage** : Format rectangulaire pour layouts spéciaux
- **Caractéristiques** : Micro QR rectangulaire optimisé
- **Test avec** : Applications supportant rMQR

## 📱 Applications de test recommandées

- **iOS** : Appareil photo natif, QR Scanner
- **Android** : Google Lens, Barcode Scanner
- **Multi-plateforme** : QR Code Reader, Scanner Pro

## 🔧 Améliorations appliquées

1. **Échelle augmentée** : `--scale=6` à `--scale=10`
2. **Zones de silence** : `--quietzones` (requis par standard ISO)
3. **Bordures élargies** : `--border=20` à `--border=32`
4. **Correction d'erreur variable** : `--secure=1` (L) à `--secure=3` (H)

## 📊 Tailles des images

```
444×444   - Compact (medium)
592×592   - Standard (mobile/optimized)
820×820   - Haute résolution (high-ecc)
752×336   - Rectangulaire (rmqr-optimized)
```

## 🎯 URL cible
Toutes les versions encodent : **https://abs-fr.github.io/littlelink/**

## ⚡ Test rapide
1. Commencez par **abs-fr-qr-mobile.png**
2. Si problème → essayez **abs-fr-qr-high-ecc.png**
3. Pour format spécial → testez **abs-fr-rmqr-optimized.png**

---
*Générés avec Zint via Docker - Réseau tioTools*





