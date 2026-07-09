# cg-lightcalc-landing — briefing per Claude Code

## Cos'è questo progetto

Landing page statica per **C/G LightCalc**, app Streamlit per verifiche illuminotecniche (EN 12464-1 interni, EN 13201 stradale). L'app è nel repo separato `ascito68/Lux`.

Sito live: **https://ascito68.github.io/cg-lightcalc-landing/**

## Deploy

GitHub Pages — si attiva su push a `main`.
Procedura standard per ogni modifica:
```
git add <file>
git commit -m "descrizione"
git push origin HEAD:main
git push origin claude/lightcalc-landing-page-ej70k1
```
Il secondo push mantiene allineato il branch di sviluppo (evita warning del stop hook).

## Branch

- Sviluppo: `claude/lightcalc-landing-page-ej70k1`
- Deploy: `main`

## File

- `index.html` — unico file, contiene tutto (CSS inline, HTML, JS inline)
- `screenshots/` — 11 immagini dell'app (1.png … 11.png)
- `assets/icon.png` — icona app (griglia di punti luce, sfondo scuro)

## Design system

Derivato da `ascito68/cgblog`. Variabili CSS chiave:

```css
--cg-tortora:       #e8dece;   /* beige chiaro */
--cg-tortora-mid:   #b8967e;   /* sabbia dorata */
--cg-tortora-deep:  #8c6a5a;   /* marrone rosato */
--cg-nero:          #3d3530;   /* quasi-nero warm */
--cg-nero-deep:     #28221e;   /* nero profondo */
--cg-soft:          #fdfbf8;   /* bianco caldo */
--cg-green:         #6aaa7a;   /* verde conformità */
```

Regole stilistiche:
- Testo **tutto lowercase**
- Font: Helvetica Neue / Inter, weight 200 display / 700 bold
- Border-radius: **0** (nessun arrotondamento)
- Leitmotiv: slash `/` in tortora-mid
- Slash animata nello hero ruota sullo scroll (`opacity: .18`)

## Contenuto — note di accuratezza

Correzioni già applicate, da non invertire:

- **IRM Spencer** = calcola la **componente riflessa della luce artificiale** (interriflessioni su pareti/soffitto/pavimento). NON è luce solare/naturale. Solo interni, metodo punto-per-punto.
- **Ra** non è calcolata dall'app: viene riportata in relazione dal datasheet del costruttore.
- L'app **non calcola luce naturale/solare**.
- Verifiche: EN 12464-1 (interni) + EN 13201 / UNI 11248 (stradale) + EN 1838 (emergenza) + IRM Spencer (componente riflessa, solo interni) + 15 leggi regionali anti-inquinamento luminoso.

## Pricing

- Prezzo pieno: **€119/anno** (sbarrato)
- Piano: **LightCalc Pro**
- Prezzo lancio / Founding Member: **€79/anno** a vita per chi si iscrive entro il **12 agosto 2026**
- Risparmio evidenziato: **€40/anno** rispetto al prezzo ufficiale
- PayPal SDK plan Founding Member: `P-5U875098UL3621449NJHWXJQ`
- Nota PayPal: per mantenere il prezzo Founding Member bloccato serve un piano PayPal separato a €79/anno, distinto dal piano standard a €119/anno.

## Struttura sezioni index.html

1. **Nav** — logo c/g lightcalc, link sezioni, CTA "piano annuale"
2. **Hero** — icona app 72px, titolo grande (weight 200), slash animata, stats bar (EN 12464-1 / EN 13201 / EN 1838 / 15 leggi)
3. **Screenshots** — galleria orizzontale scrollabile (11 immagini, drag su desktop, touch su mobile) + lightbox fullscreen con frecce e swipe
4. **Features** — griglia 3 colonne, 6 card (doppio motore, normative, EN 1838, fotometrie, planimetria/progetto JSON, report)
5. **Disclaimer** — box su limiti dell'app (non sostituisce software professionali per alta complessità)
6. **Pricing** — card unica, prezzo €119 sbarrato + €79/anno promo Founding Member, lista funzionalità, PayPal form
7. **CTA** — "verifica. documenta. consegna."
8. **Footer** — crediti studio cibelli/guadagno, Stefano Cibelli, tech stack

## Todo / aperto

- [ ] Cambiare titolo hero (attuale: "calcolo / illuminotecnico / preciso · veloce") — proposta in sospeso
- [ ] Integrare Lemon Squeezy per gestione abbonamenti automatica (sostituire PayPal manuale)
- [ ] Aggiungere favicon personalizzata all'app Streamlit in `ascito68/Lux` (già presente su landing)
- [ ] Migliorare immagini galleria con browser-frame (Screely.com) — attualmente screenshot diretti

## Git — note operative

Il stop hook richiede `commit.gpgsign=true` con chiave SSH. I commit vengono firmati automaticamente. Se compare il warning "Unverified", verificare che entrambi i branch (main e claude/...) siano aggiornati con `git push origin claude/lightcalc-landing-page-ej70k1 --force` se necessario.
