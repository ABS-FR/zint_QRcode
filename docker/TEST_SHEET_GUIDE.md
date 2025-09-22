# Guide des Planches d'Essai QR Codes

## 🖨️ Planches d'Essai Créées

### **`test_sheet_print.html`** - Version HTML (RECOMMANDÉE)
- **Format** : A4 (21×29.7cm)
- **Avantages** : Facile à imprimer, compatible tous navigateurs
- **QR codes** : 8 exemplaires aux dimensions réelles
- **Instructions** : Intégrées dans la page

### **`test_sheet_print.svg`** - Version SVG (Avancée)
- **Format** : A4 vectoriel
- **Avantages** : Qualité parfaite, éditable
- **Usage** : Impression professionnelle, personnalisation

---

## 📏 QR Codes Testés sur la Planche

| **Type** | **Fichier** | **Dimension** | **Usage Test** |
|----------|-------------|---------------|----------------|
| **ULTRA-MINI ⭐** | `abs-fr-6cm-compact.png` | 1.2×1.2cm | Limite de scannabilité |
| **MINI** | `abs-fr-mini-print.png` | 1.9×1.9cm | Autocollants, badges |
| **COMPACT CORPORATE** | `abs-fr-style-blue.png` | 3.7×3.7cm | Documents pros |
| **COMPACT COLORÉ** | `abs-fr-style-red.png` | 3.7×3.7cm | Communication visuelle |
| **STANDARD OPTIMAL ⭐** | `abs-fr-qr-mobile.png` | 5.0×5.0cm | Usage général |
| **STANDARD BORDEAUX** | `abs-fr-solid-bordeaux.png` | 5.0×5.0cm | Événements premium |
| **HAUTE RÉSISTANCE** | `abs-fr-qr-high-ecc.png` | 6.9×6.9cm | Conditions difficiles |
| **FOND TRANSPARENT** | `abs-fr-style-transparent.png` | 5.0×5.0cm | Design overlay |

---

## 🖨️ Instructions d'Impression

### **Option 1 : HTML (Plus Facile)**
1. **Ouvrir** `test_sheet_print.html` dans votre navigateur
2. **Imprimer** avec `Ctrl+P` ou Fichier → Imprimer
3. **Paramètres** :
   - Format : A4
   - Orientation : Portrait
   - Mise à l'échelle : **100%** (critique !)
   - Marges : Normales
   - Couleur : Activée

### **Option 2 : SVG (Professionnel)**
1. **Ouvrir** `test_sheet_print.svg` dans :
   - Navigateur web (Chrome, Firefox)
   - Inkscape (édition)
   - Adobe Illustrator (pro)
2. **Imprimer** en taille réelle (21×29.7cm)

---

## 🔍 Protocole de Test

### **Préparation**
1. ✅ **Vérifiez** que l'impression fait bien 21×29.7cm
2. ✅ **Préparez** votre smartphone
3. ✅ **Testez** dans un bon éclairage

### **Test de Scannabilité**
Pour chaque QR code :

1. **Distance 20cm** 
   - ✅ Doit scanner instantanément
   - ❌ Si échec → QR trop petit pour cette distance

2. **Distance 30cm**
   - ✅ Doit scanner en 2-3 secondes
   - ❌ Si échec → Problème de contraste ou taille

3. **Distance 50cm**
   - ✅ Doit être détectable (QR 5cm+)
   - ❌ Normal si échec pour QR < 3cm

4. **Angle 30°**
   - ✅ Doit rester scannable
   - ❌ Si échec → Problème de zones de silence

### **Applications de Test Recommandées**
- **iOS** : Appareil photo natif, QR Scanner
- **Android** : Google Lens, Barcode Scanner
- **Multi** : Scanner Pro, QR Code Reader

---

## 📊 Analyse des Résultats

### **Résultats Attendus**
| **Taille** | **20cm** | **30cm** | **50cm** | **Notes** |
|------------|----------|----------|----------|-----------|
| **1.2cm** | ⚠️ Difficile | ❌ Non | ❌ Non | Limite absolue |
| **1.9cm** | ✅ OK | ⚠️ Possible | ❌ Non | Minimum pratique |
| **3.7cm** | ✅ Parfait | ✅ OK | ⚠️ Possible | Standard compact |
| **5.0cm** | ✅ Parfait | ✅ Parfait | ✅ OK | **OPTIMAL** |
| **6.9cm** | ✅ Parfait | ✅ Parfait | ✅ Parfait | Conditions difficiles |

### **Si Problèmes de Scan**

#### **Aucun QR code ne fonctionne**
- ❌ **Impression** mal dimensionnée
- ❌ **Application** défaillante  
- ❌ **Éclairage** insuffisant

#### **Seuls les gros QR codes fonctionnent**
- ✅ **Normal** - les petits ont leurs limites
- ⚠️ **Smartphone** peut-être ancien

#### **QR codes colorés ne fonctionnent pas**
- ❌ **Contraste** insuffisant
- ❌ **Impression** couleur défaillante

---

## 🎯 Recommandations Finales

### **Basées sur vos tests :**

#### **Pour Cartes de Visite**
- ✅ Si 1.2cm fonctionne → Utilisez `abs-fr-6cm-compact.png`
- ⚠️ Si 1.2cm difficile → Utilisez `abs-fr-mini-print.png` (1.9cm)

#### **Pour Documents**
- ✅ `abs-fr-qr-mobile.png` (5.0cm) - **Valeur sûre**
- ✅ `abs-fr-style-blue.png` (3.7cm) si espace limité

#### **Pour Affiches**
- ✅ `abs-fr-qr-high-ecc.png` (6.9cm) - **Résistance maximale**

#### **Pour Web/Digital**
- ✅ **Toute version .svg** - Adaptable automatiquement

---

## 🔧 Régénération des Planches

```bash
# Régénérer la planche d'essai
python3 create_test_sheet.py

# Voir les planches créées  
ls -la test_sheet_print.*

# Ouvrir la planche HTML
firefox test_sheet_print.html
```

---

## 📚 URL Testée

**Tous les QR codes encodent** : https://abs-fr.github.io/littlelink/

**Événement** : Apéro Blockchain Samui (FR) - Chaque 1er mercredi du mois

---

*Guide créé pour validation complète des QR codes - Réseau tioTools*
