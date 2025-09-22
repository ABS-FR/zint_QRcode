# Guide d'Impression - QR Codes Apéro Blockchain Samui

## 📏 Recommandations de Dimensions d'Impression

**URL encodée** : https://abs-fr.github.io/littlelink/

### 🎯 **ULTRA-COMPACT (< 2cm)** - Cartes, badges, autocollants

| Fichier | Pixels | Taille à 300 DPI | Usage recommandé |
|---------|--------|------------------|------------------|
| `abs-fr-6cm-compact.png` | 148×148 | **1.2×1.2cm** | Carte de visite, badge mini |
| `abs-fr-mini-print.png` | 222×222 | **1.9×1.9cm** | Autocollant, étiquette |

**⚠️ Attention** : Test de scannabilité obligatoire à cette taille !

### 📱 **COMPACT (3-4cm)** - Documents, flyers, brochures

| Fichier | Pixels | Taille à 300 DPI | Usage recommandé |
|---------|--------|------------------|------------------|
| `abs-fr-fixed-dots-solid.png` | 444×444 | **3.7×3.7cm** | Flyer A5, brochure |
| `abs-fr-qr-medium.png` | 444×444 | **3.7×3.7cm** | Document standard |
| `abs-fr-style-blue.png` | 444×444 | **3.7×3.7cm** | Version colorée corporate |
| `abs-fr-style-red.png` | 444×444 | **3.7×3.7cm** | Version colorée accent |
| `abs-fr-style-reverse.png` | 444×444 | **3.7×3.7cm** | Version blanc sur noir |
| `test-abs-fr-compact.png` | 444×444 | **3.7×3.7cm** | Version de test compacte |

### 🎯 **STANDARD (5cm)** - Affiches, présentations, écrans

| Fichier | Pixels | Taille à 300 DPI | Usage recommandé |
|---------|--------|------------------|------------------|
| `abs-fr-qr-mobile.png` | 592×592 | **5.0×5.0cm** | ⭐ **RECOMMANDÉ GÉNÉRAL** |
| `abs-fr-qr-optimized.png` | 592×592 | **5.0×5.0cm** | Version optimisée mobile |
| `abs-fr-solid-bordeaux.png` | 592×592 | **5.0×5.0cm** | Version colorée bordeaux |
| `abs-fr-style-transparent.png` | 592×592 | **5.0×5.0cm** | Fond transparent |
| `test-abs-fr-mobile.png` | 592×592 | **5.0×5.0cm** | Version de test mobile |

### 🔍 **DÉTAILLÉ (7cm)** - Conditions difficiles, longue distance

| Fichier | Pixels | Taille à 300 DPI | Usage recommandé |
|---------|--------|------------------|------------------|
| `abs-fr-dots-dense.png` | 445×445 | **3.7×3.7cm** | Version dense (test) |
| `abs-fr-dots-compact.png` | 593×593 | **5.0×5.0cm** | Version compacte (test) |

### 🛡️ **HAUTE RÉSISTANCE (7cm)** - Conditions extrêmes

| Fichier | Pixels | Taille à 300 DPI | Usage recommandé |
|---------|--------|------------------|------------------|
| `abs-fr-qr-high-ecc.png` | 820×820 | **6.9×6.9cm** | Environnement difficile |
| `test-abs-fr-high-ecc.png` | 820×820 | **6.9×6.9cm** | Version test résistante |

### 🖨️ **TRÈS HAUTE RÉSOLUTION (23cm)** - Impression professionnelle

| Fichier | Pixels | Taille à 300 DPI | Usage recommandé |
|---------|--------|------------------|------------------|
| `abs-fr-print-6cm.png` | 2775×2775 | **23.4×23.4cm** | ⚠️ Trop grand - Réduire |

### 🎨 **FORMAT VECTORIEL** - Taille personnalisable

| Fichier | Format | Taille recommandée | Usage recommandé |
|---------|--------|-------------------|------------------|
| `abs-fr-style-orange.svg` | SVG | **Adaptable** | Édition graphique, logos |

## 📐 Calcul des Tailles Personnalisées

### **À 300 DPI (standard)** :
- **1 cm = 118 pixels**
- **Formule** : `Taille_cm = Pixels × 2.54 ÷ 300`

### **À 600 DPI (haute qualité)** :
- **1 cm = 236 pixels**
- **Formule** : `Taille_cm = Pixels × 2.54 ÷ 600`

## 🎯 Recommandations par Usage

### 📇 **Cartes de Visite** (espace limité)
```
✅ abs-fr-6cm-compact.png       (1.2×1.2cm)
✅ abs-fr-mini-print.png        (1.9×1.9cm)
```

### 📄 **Flyers / Brochures**
```
⭐ abs-fr-qr-mobile.png         (5.0×5.0cm) - OPTIMAL
✅ abs-fr-style-blue.png        (3.7×3.7cm) - Corporate
✅ abs-fr-fixed-dots-solid.png  (3.7×3.7cm) - Coloré
```

### 🪧 **Affiches / Panneaux**
```
⭐ abs-fr-qr-high-ecc.png       (6.9×6.9cm) - Résistant
✅ abs-fr-solid-bordeaux.png    (5.0×5.0cm) - Coloré
✅ abs-fr-style-transparent.png (5.0×5.0cm) - Overlay
```

### 💻 **Présentations Digitales**
```
🎨 abs-fr-style-orange.svg      (Vectoriel - adaptable)
⭐ abs-fr-qr-mobile.png         (5.0×5.0cm)
✅ abs-fr-style-reverse.png     (3.7×3.7cm) - Contraste
```

## ⚙️ Paramètres d'Impression Recommandés

### **Pour impression physique** :
- **Résolution** : 300 DPI minimum, 600 DPI pour petites tailles
- **Format** : Noir & blanc ou couleurs selon le style
- **Papier** : Mat ou brillant (éviter texturé)
- **Marges** : 5mm minimum autour du QR code

### **Test obligatoire** :
1. Imprimez à la taille prévue
2. Testez avec smartphone à 20-30cm
3. Si échec → utilisez taille supérieure
4. Vérifiez lisibilité dans conditions réelles

## 🔍 Diagnostic Rapide

| Problème | Solution |
|----------|----------|
| **Trop petit pour scanner** | → Utilisez version 5.0×5.0cm |
| **Espace limité** | → `abs-fr-6cm-compact.png` (1.2cm) |
| **Conditions difficiles** | → `abs-fr-qr-high-ecc.png` (6.9cm) |
| **Besoin de couleur** | → `abs-fr-style-*.png` |
| **Impression pro** | → `abs-fr-style-orange.svg` |

---
*Guide créé pour https://abs-fr.github.io/littlelink/ - Réseau tioTools*
