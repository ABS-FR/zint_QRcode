#!/usr/bin/env python3
"""
Script pour créer une planche d'essai avec tous les types de QR codes
aux bonnes dimensions d'impression (300 DPI)
"""

import os
import xml.etree.ElementTree as ET
from xml.dom import minidom

# Dimensions en centimètres pour impression à 300 DPI
# 1 cm = 118.11 pixels à 300 DPI (300/2.54)
CM_TO_PX = 118.11

# Configuration des QR codes à inclure dans la planche
QR_CONFIGS = [
    # Format: (nom_fichier, largeur_cm, hauteur_cm, label, description)
    ("abs-fr-6cm-compact.svg", 1.2, 1.2, "ULTRA-MINI", "Carte visite 1.2cm"),
    ("abs-fr-mini-print.svg", 1.9, 1.9, "MINI", "Autocollant 1.9cm"),
    ("abs-fr-style-blue.svg", 3.7, 3.7, "COMPACT", "Corporate 3.7cm"),
    ("abs-fr-qr-mobile.svg", 5.0, 5.0, "STANDARD ⭐", "Optimal 5.0cm"),
    ("abs-fr-qr-high-ecc.svg", 6.9, 6.9, "RÉSISTANT", "Conditions difficiles 6.9cm"),
    ("abs-fr-style-red.svg", 3.7, 3.7, "COLORÉ", "Rouge accent 3.7cm"),
    ("abs-fr-solid-bordeaux.svg", 5.0, 5.0, "BORDEAUX", "Style bordeaux 5.0cm"),
    ("abs-fr-style-transparent.svg", 5.0, 5.0, "TRANSPARENT", "Fond transparent 5.0cm"),
]

def read_svg_content(filepath):
    """Lit le contenu d'un fichier SVG"""
    try:
        with open(filepath, 'r', encoding='utf-8') as f:
            content = f.read()
            # Extraire juste le contenu entre les balises SVG
            start = content.find('<svg')
            end = content.find('</svg>') + 6
            if start != -1 and end != -1:
                return content[start:end]
    except Exception as e:
        print(f"Erreur lecture {filepath}: {e}")
    return None

def create_test_sheet():
    """Crée la planche d'essai SVG"""
    
    # Dimensions de la page A4 en pixels (300 DPI)
    PAGE_WIDTH = 21.0 * CM_TO_PX  # 21 cm
    PAGE_HEIGHT = 29.7 * CM_TO_PX  # 29.7 cm
    MARGIN = 1.5 * CM_TO_PX  # 1.5 cm de marge
    
    # Création du SVG principal
    svg_root = ET.Element('svg')
    svg_root.set('xmlns', 'http://www.w3.org/2000/svg')
    svg_root.set('width', f'{PAGE_WIDTH:.0f}')
    svg_root.set('height', f'{PAGE_HEIGHT:.0f}')
    svg_root.set('viewBox', f'0 0 {PAGE_WIDTH:.0f} {PAGE_HEIGHT:.0f}')
    
    # Titre de la planche
    title = ET.SubElement(svg_root, 'text')
    title.set('x', f'{PAGE_WIDTH/2:.0f}')
    title.set('y', f'{MARGIN/2:.0f}')
    title.set('text-anchor', 'middle')
    title.set('font-family', 'Arial, sans-serif')
    title.set('font-size', '24')
    title.set('font-weight', 'bold')
    title.text = 'PLANCHE D\'ESSAI QR CODES - Apéro Blockchain Samui'
    
    # URL
    url_text = ET.SubElement(svg_root, 'text')
    url_text.set('x', f'{PAGE_WIDTH/2:.0f}')
    url_text.set('y', f'{MARGIN/2 + 30:.0f}')
    url_text.set('text-anchor', 'middle')
    url_text.set('font-family', 'Arial, sans-serif')
    url_text.set('font-size', '12')
    url_text.text = 'https://abs-fr.github.io/littlelink/'
    
    # Instructions
    instr = ET.SubElement(svg_root, 'text')
    instr.set('x', f'{PAGE_WIDTH/2:.0f}')
    instr.set('y', f'{MARGIN/2 + 50:.0f}')
    instr.set('text-anchor', 'middle')
    instr.set('font-family', 'Arial, sans-serif')
    instr.set('font-size', '10')
    instr.text = 'Testez chaque QR code avec votre smartphone - Les dimensions correspondent aux recommandations d\'impression'
    
    # Position de départ
    current_x = MARGIN
    current_y = MARGIN + 80
    row_height = 0
    max_width = PAGE_WIDTH - 2 * MARGIN
    
    print("🔄 Intégration des QR codes dans la planche...")
    
    for i, (filename, width_cm, height_cm, label, description) in enumerate(QR_CONFIGS):
        filepath = f"output/{filename}"
        
        # Convertir dimensions en pixels
        qr_width = width_cm * CM_TO_PX
        qr_height = height_cm * CM_TO_PX
        
        # Espace pour le texte (1 cm)
        text_space = 1.0 * CM_TO_PX
        total_width = max(qr_width, 6 * CM_TO_PX)  # Largeur minimale pour le texte
        total_height = qr_height + text_space
        
        # Vérifier si ça rentre sur la ligne
        if current_x + total_width > PAGE_WIDTH - MARGIN and i > 0:
            current_x = MARGIN
            current_y += row_height + 20
            row_height = 0
        
        # Lire le contenu SVG
        svg_content = read_svg_content(filepath)
        if not svg_content:
            print(f"⚠️ Impossible de lire {filename}")
            continue
            
        # Groupe pour ce QR code
        qr_group = ET.SubElement(svg_root, 'g')
        qr_group.set('transform', f'translate({current_x:.0f},{current_y:.0f})')
        
        # Cadre de délimitation (optionnel, pour le debug)
        # border = ET.SubElement(qr_group, 'rect')
        # border.set('x', '0')
        # border.set('y', '0') 
        # border.set('width', f'{total_width:.0f}')
        # border.set('height', f'{total_height:.0f}')
        # border.set('fill', 'none')
        # border.set('stroke', '#ccc')
        # border.set('stroke-width', '1')
        
        # Parser et intégrer le SVG du QR code
        try:
            qr_svg = ET.fromstring(svg_content)
            
            # Créer un groupe pour le QR code avec la bonne taille
            qr_container = ET.SubElement(qr_group, 'g')
            center_x = (total_width - qr_width) / 2
            qr_container.set('transform', f'translate({center_x:.0f},0) scale({width_cm/10:.3f})')
            
            # Copier tous les éléments du QR code SVG
            for child in qr_svg:
                qr_container.append(child)
                
        except Exception as e:
            print(f"⚠️ Erreur intégration {filename}: {e}")
            # Rectangle de remplacement en cas d'erreur
            placeholder = ET.SubElement(qr_group, 'rect')
            placeholder.set('x', f'{(total_width - qr_width)/2:.0f}')
            placeholder.set('y', '0')
            placeholder.set('width', f'{qr_width:.0f}')
            placeholder.set('height', f'{qr_height:.0f}')
            placeholder.set('fill', '#f0f0f0')
            placeholder.set('stroke', '#999')
        
        # Texte label (gras)
        label_text = ET.SubElement(qr_group, 'text')
        label_text.set('x', f'{total_width/2:.0f}')
        label_text.set('y', f'{qr_height + 15:.0f}')
        label_text.set('text-anchor', 'middle')
        label_text.set('font-family', 'Arial, sans-serif')
        label_text.set('font-size', '11')
        label_text.set('font-weight', 'bold')
        label_text.text = label
        
        # Texte description
        desc_text = ET.SubElement(qr_group, 'text')
        desc_text.set('x', f'{total_width/2:.0f}')
        desc_text.set('y', f'{qr_height + 30:.0f}')
        desc_text.set('text-anchor', 'middle')
        desc_text.set('font-family', 'Arial, sans-serif')
        desc_text.set('font-size', '9')
        desc_text.text = description
        
        # Dimensions physiques
        dim_text = ET.SubElement(qr_group, 'text')
        dim_text.set('x', f'{total_width/2:.0f}')
        dim_text.set('y', f'{qr_height + 45:.0f}')
        dim_text.set('text-anchor', 'middle')
        dim_text.set('font-family', 'Arial, sans-serif')
        dim_text.set('font-size', '8')
        dim_text.set('fill', '#666')
        dim_text.text = f'{width_cm}×{height_cm}cm'
        
        print(f"   ✅ {label}: {description}")
        
        # Mettre à jour position
        current_x += total_width + 20
        row_height = max(row_height, total_height)
    
    # Pied de page
    footer = ET.SubElement(svg_root, 'text')
    footer.set('x', f'{PAGE_WIDTH/2:.0f}')
    footer.set('y', f'{PAGE_HEIGHT - 20:.0f}')
    footer.set('text-anchor', 'middle')
    footer.set('font-family', 'Arial, sans-serif')
    footer.set('font-size', '8')
    footer.set('fill', '#666')
    footer.text = 'Généré par Zint via Docker - Réseau tioTools - Testez à 20-30cm de distance'
    
    return svg_root

def main():
    print("🖨️ CRÉATION DE LA PLANCHE D'ESSAI")
    print("=================================")
    
    # Garder le répertoire courant pour accéder aux fichiers
    
    # Créer la planche
    svg_content = create_test_sheet()
    
    # Convertir en string avec formatage
    rough_string = ET.tostring(svg_content, encoding='unicode')
    reparsed = minidom.parseString(rough_string)
    pretty_xml = reparsed.toprettyxml(indent="  ")
    
    # Supprimer la ligne XML declaration en double
    lines = pretty_xml.split('\n')
    if lines[0].startswith('<?xml'):
        lines = lines[1:]
    pretty_xml = '\n'.join(lines)
    
    # Sauvegarder
    output_file = "test_sheet_print.svg"
    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(pretty_xml)
    
    print(f"✅ Planche d'essai créée: {output_file}")
    print(f"📐 Format: A4 (21×29.7cm) à 300 DPI")
    print(f"📄 {len(QR_CONFIGS)} QR codes aux dimensions réelles")
    print("")
    print("🖨️ INSTRUCTIONS D'IMPRESSION:")
    print("   1. Ouvrir test_sheet_print.svg dans un navigateur")
    print("   2. Imprimer en 'Taille réelle' (pas d'ajustement)")
    print("   3. Vérifier que l'impression fait bien 21×29.7cm")
    print("   4. Tester chaque QR code à 20-30cm de distance")

if __name__ == "__main__":
    main()
