#!/usr/bin/env bash
# ============================================================================
# aggiorna_conteggio_leggi.sh — cg-lightcalc-landing
#
# La landing page cita ovunque "15 leggi regionali anti-inquinamento
# luminoso". Nel repo dell'app (Lux) sono state aggiunte Marche, Molise e
# Bolzano (P.A.): il conteggio corretto oggi e' 19 (16 gia' presenti + 3
# nuove). Questo script aggiorna il numero nei 4 punti di index.html e in
# CLAUDE.md, senza toccare nient'altro (nessuna menzione di edizione/anno
# per EN 1838 in questa pagina: resta generica "en 1838", corretto cosi').
#
# Non fa commit e non fa push: modifica solo il working tree.
#
# Uso:
#   ./aggiorna_conteggio_leggi.sh [percorso_repo]
#   (default percorso_repo = /Users/stefanocibelli/GitHub/cg-lightcalc-landing)
# ============================================================================
set -euo pipefail

REPO_ROOT="${1:-/Users/stefanocibelli/GitHub/cg-lightcalc-landing}"

if [ ! -f "$REPO_ROOT/index.html" ]; then
    echo "ERRORE: non trovo index.html dentro $REPO_ROOT" >&2
    exit 1
fi

echo "== Repo: $REPO_ROOT"
cd "$REPO_ROOT"

echo
echo "== git status prima delle modifiche =="
git status -sb || true

echo
echo "== Applico le modifiche (Python) =="
python3 - "$REPO_ROOT" <<'PYEOF'
import pathlib
import sys

ROOT = pathlib.Path(sys.argv[1]).resolve()
INDEX_HTML = ROOT / 'index.html'
CLAUDE_MD = ROOT / 'CLAUDE.md'


def apply_replacement(path: pathlib.Path, old: str, new: str, label: str) -> None:
    text = path.read_text(encoding='utf-8')
    count = text.count(old)
    if count != 1:
        print(f'ERRORE [{label}]: trovate {count} occorrenze (attese 1) in {path}.')
        print('Nessuna modifica scritta per questo passaggio: il file resta invariato.')
        sys.exit(1)
    path.write_text(text.replace(old, new, 1), encoding='utf-8')
    print(f'OK  {label}  ->  {path.relative_to(ROOT)}')


# ─────────────────────────────────────────────────────────────────────────
# index.html — 4 occorrenze di "15 leggi..." -> "19 leggi..."
# ─────────────────────────────────────────────────────────────────────────
apply_replacement(
    INDEX_HTML,
    '      <div class="stat"><span class="stat-value">15 leggi</span><span class="stat-label">anti-inquinamento luminoso</span></div>',
    '      <div class="stat"><span class="stat-value">19 leggi</span><span class="stat-label">anti-inquinamento luminoso</span></div>',
    'hero stat: 15 -> 19 leggi',
)

apply_replacement(
    INDEX_HTML,
    '        <p class="feature-desc">Norme UNI/EN e 15 leggi regionali aiutano a non ricostruire ogni volta requisiti, riferimenti e dati da riportare in relazione.</p>',
    '        <p class="feature-desc">Norme UNI/EN e 19 leggi regionali aiutano a non ricostruire ogni volta requisiti, riferimenti e dati da riportare in relazione.</p>',
    'feature card: 15 -> 19 leggi',
)

apply_replacement(
    INDEX_HTML,
    '</span>15 leggi regionali anti-inquinamento luminoso con riferimenti citabili</li>',
    '</span>19 leggi regionali anti-inquinamento luminoso con riferimenti citabili</li>',
    'tabella confronto: 15 -> 19 leggi',
)

apply_replacement(
    INDEX_HTML,
    '        <p class="faq-answer">LightCalc supporta verifiche legate a UNI EN 12464-1, UNI EN 13201, UNI 11248, UNI EN 1838 e include riferimenti a 15 leggi regionali anti-inquinamento luminoso utili alla relazione.</p>',
    '        <p class="faq-answer">LightCalc supporta verifiche legate a UNI EN 12464-1, UNI EN 13201, UNI 11248, UNI EN 1838 e include riferimenti a 19 leggi regionali anti-inquinamento luminoso utili alla relazione.</p>',
    'FAQ: 15 -> 19 leggi',
)

# ─────────────────────────────────────────────────────────────────────────
# CLAUDE.md — nota di accuratezza
# ─────────────────────────────────────────────────────────────────────────
apply_replacement(
    CLAUDE_MD,
    '- Verifiche: EN 12464-1 (interni) + EN 13201 / UNI 11248 (stradale) + EN 1838 (emergenza) + IRM Spencer (componente riflessa, solo interni) + 15 leggi regionali anti-inquinamento luminoso.',
    '- Verifiche: EN 12464-1 (interni) + EN 13201 / UNI 11248 (stradale) + EN 1838 (emergenza) + IRM Spencer (componente riflessa, solo interni) + 19 leggi regionali anti-inquinamento luminoso.',
    'CLAUDE.md: 15 -> 19 leggi',
)

print()
print('Tutte le modifiche sono state applicate.')
PYEOF

echo
echo "== git diff dopo le modifiche =="
git diff

echo
echo "============================================================================"
echo "Fatto. Nessun commit e nessun push eseguiti (restano manuali)."
echo "Da CLAUDE.md di questo repo, il deploy e':"
echo "  git add index.html CLAUDE.md"
echo "  git commit -m \"landing: aggiorna conteggio leggi regionali 15 -> 19\""
echo "  git push origin HEAD:main"
echo "  git push origin claude/lightcalc-landing-page-ej70k1"
echo "============================================================================"
