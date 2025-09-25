# Guide de Résolution - QR Codes Non Scannables

## 🚨 Problème: Style Dotty Ne Fonctionne Pas

### ❌ **Problème identifié**
Le style `--dotty` avec `--dotsize=0.8` ou inférieur crée des **points trop espacés** qui ne sont pas reconnus par les scanners mobiles.

### ✅ **Solutions appliquées**

#### 1. **Version Solide Recommandée** (100% compatible)
```bash
# Remplacement du style dots par version solide
docker compose exec zint zint \
    --barcode=58 --scale=8 --quietzones \
    --fg=8B0000 --bg=FFE4E1 \
    -o /qrcodes/style-bordeaux-solid.png \
    -d "https://votre-url.com"
```

#### 2. **Version Dotty Haute Densité** (expérimentale)
```bash
# Si vous voulez absolument des points
docker compose exec zint zint \
    --barcode=58 --scale=10 --quietzones \
    --dotty --dotsize=0.95 \
    --fg=000000 --bg=FFFFFF \
    -o /qrcodes/dots-haute-densite.png \
    -d "https://votre-url.com"
```

#### 3. **Format Rectangulaire Solide** (compact + compatible)
```bash
# rMQR sans dotty - plus compact et scannable
docker compose exec zint zint \
    --barcode=145 --scale=8 --quietzones \
    --fg=4B0082 --bg=E6E6FA \
    -o /qrcodes/rmqr-solid.png \
    -d "https://votre-url.com"
```

## 🔧 Autres Problèmes de Scannabilité

### 📱 QR Code trop petit
**Symptôme**: Scanner n'arrive pas à détecter le QR
```bash
# Solution: Augmenter l'échelle
--scale=8   # Au lieu de --scale=3 ou moins
```

### 🎨 Contraste insuffisant  
**Symptôme**: Scanner détecte mais ne lit pas
```bash
# Solution: Utiliser des couleurs contrastées
--fg=000000 --bg=FFFFFF   # Noir sur blanc (optimal)
--fg=2D5AA0 --bg=F8F9FA   # Bleu foncé sur blanc cassé
```

### 📏 Zones de silence manquantes
**Symptôme**: Scan intermittent ou difficile
```bash
# Solution: Ajouter zones de silence et bordures
--quietzones --border=12   # Zones obligatoires + bordure
```

### 🔄 URL trop longue pour Micro QR
**Symptôme**: "Input length too long"
```bash
# Solution: Utiliser QR standard au lieu de Micro QR
--barcode=58    # QR standard (au lieu de 97 Micro QR)
--barcode=145   # rMQR rectangulaire (capacité élevée)
```

## 📊 Versions Corrigées Disponibles

| Fichier Original (Problématique) | Version Corrigée | Amélioration |
|----------------------------------|------------------|--------------|
| `*-dots.png` (dotty 0.8) | `*-solid-bordeaux.png` | Carrés solides scannables |
| `*-rmqr-dots.png` | `*-rmqr-solid-purple.png` | Format rectangulaire solide |
| QR trop petits | `*-dots-max-density.png` | Échelle 10x avec dotty 0.95 |

## ✅ Script Mis à Jour

Le script `generate_styled.sh` a été corrigé :
```bash
# Ancien (problématique)
./generate_styled.sh "url" dots   # Générait dotty 0.8

# Nouveau (corrigé) 
./generate_styled.sh "url" dots   # Génère version solide + expérimentale
```

## 🧪 Test de Validation

### 1. **Test Rapide**
- Imprimez le QR sur papier
- Testez avec 3 applications différentes :
  - Appareil photo natif
  - Google Lens  
  - Scanner QR dédié

### 2. **Test de Distance**
- **20cm** : Doit scanner instantanément
- **50cm** : Doit scanner en 2-3 secondes
- **1m** : Doit être détectable

### 3. **Test de Conditions**
- ✅ **Lumière normale** : OK
- ✅ **Lumière faible** : Doit fonctionner
- ✅ **Angle léger** : Tolérance 30°

## 🔍 Debug Visuel

```bash
# Générer version de test noir/blanc optimale
docker compose exec zint zint \
    --barcode=58 --scale=8 --quietzones --border=16 \
    --fg=000000 --bg=FFFFFF \
    -o /qrcodes/debug-optimal.png \
    -d "https://abs-fr.github.io/littlelink/"

# Si cette version ne fonctionne pas, problème hardware/app
```

## 📞 Support

Si les solutions ne fonctionnent pas :
1. Vérifiez que l'URL est accessible
2. Testez avec QR code basique noir/blanc
3. Vérifiez les paramètres de l'application scanner
4. Consultez `STYLE_GUIDE.md` pour les bonnes pratiques

---
*Corrections appliquées le $(date) - Réseau tioTools*





