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
- `screenshots/` — 3 immagini dell'app (main UI, isolux, PDF report)

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
- Verifiche: EN 12464-1 (interni) + EN 13201 (stradale) + IRM Spencer (componente riflessa, solo interni).

## Pricing

- Prezzo pieno: **€9,99/mese** (sbarrato)
- Prezzo lancio: **€4,99/mese** (periodo limitato)
- Prova gratuita: 3 giorni, nessun addebito immediato
- Pagamento: PayPal subscription (`P-35Y18042VS367305GNIXRRQA`)

## Struttura sezioni index.html

1. **Nav** — logo c/g lightcalc, link sezioni, CTA "prova gratis"
2. **Hero** — titolo grande (weight 200), slash animata, badge normative, stats bar
3. **Screenshots** — immagine principale full-width + duo 3/4 aspect-ratio
4. **Features** — griglia 3 colonne, 6 card (EN 12464-1, EN 13201, IRM Spencer, Libreria fotometrica, Posizionamento, Report)
5. **Disclaimer** — box su limiti dell'app (non sostituisce software professionali per alta complessità)
6. **Pricing** — card unica, lista funzionalità, PayPal form
7. **CTA** — "verifica. documenta. consegna."
8. **Footer** — crediti studio cibelli/guadagno, Stefano Cibelli, tech stack

## Todo / aperto

- [ ] Sostituire gli screenshot grezzi con immagini in browser-frame (Screely.com)
- [ ] Valutare integrazione Lemon Squeezy per gestione abbonamenti automatica (sostituire PayPal manuale)
- [ ] Aggiungere favicon personalizzata (logo c/g, 32×32px) all'app Streamlit in `ascito68/Lux`
- [ ] Titolo hero attuale: "calcolo / illuminotecnico / preciso · veloce" — l'utente vuole cambiarlo, proposta preferita: struttura a 3 righe con slash

## Git — note operative

Il stop hook richiede `commit.gpgsign=true` con chiave SSH. I commit vengono firmati automaticamente. Se compare il warning "Unverified", verificare che entrambi i branch (main e claude/...) siano aggiornati.
