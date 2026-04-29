# i2a — Mémoire du projet

## Résumé
Script bash qui convertit une image avec fond en ASCII art coloré, prêt pour fastfetch ou affichage terminal.

**Pipeline :** `image → magick (suppression fond) → jp2a (ASCII coloré) → stdout ou fichier .txt`

---

## Spec validée

### Options
| Option | Défaut | Description |
|---|---|---|
| `--output=path/file.txt` | stdout | Sauvegarde dans un fichier |
| `--width=N` | jp2a défaut | Largeur en colonnes |
| `--height=N` | jp2a défaut | Hauteur en lignes |
| `--color-mode=24bit\|8bit\|bw` | 24bit | Mode couleur |
| `--bg-color=auto\|#rrggbb\|white\|black` | auto (pixel 0,0) | Couleur du fond à supprimer |
| `--fuzz=N` | 5 | Tolérance suppression fond (%) |

### Comportement
- Sans `--output` → affichage terminal direct
- Avec `--output` → sauvegarde fichier uniquement
- `--fuzz=5` par défaut (fonds unis, pas besoin de plus)
- Détection fond auto via pixel (0,0) avec `magick identify`

### Dépendances
- `imagemagick` — suppression fond + conversion format
- `jp2a` — conversion ASCII coloré

---

## Structure projet
```
~/projets/i2a/
├── i2a            # script principal (bash)
├── i2aMemory.md   # ce fichier
├── README.md
├── Makefile       # make install → /usr/local/bin/i2a
└── PKGBUILD       # publication AUR (dernière étape)
```

---

## Avancement

- [x] Idée et pipeline définie
- [x] Spec complète validée
- [ ] Script bash minimal fonctionnel
- [ ] Toutes les options + gestion erreurs
- [ ] Makefile
- [ ] README
- [ ] PKGBUILD + publication AUR

---

## Notes utilisateur
<!-- Tes notes personnelles ici -->

---

## Décisions techniques
- Fuzz par défaut à 5% (assez pour fonds unis, évite les débordements)
- Pas de `--preview` en v1 (si `--output` → fichier uniquement, pas d'affichage simultané)
- Options `--width` et `--height` passées directement à jp2a sans transformation
- `--bg-color=auto` utilise `magick identify -format "%[pixel:u.p{0,0}]"` pour lire le pixel (0,0)
