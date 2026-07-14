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
- Verifiche: EN 12464-1 (interni) + EN 13201 / UNI 11248 (stradale) + EN 1838 (emergenza) + IRM Spencer (componente riflessa, solo interni) + 19 leggi regionali anti-inquinamento luminoso.

## Pricing

- Prezzo pieno: **€119/anno** (sbarrato)
- Piano: **LightCalc Pro**
- Prezzo lancio / Founding Member: **€79/anno** a vita per chi si iscrive entro il **12 agosto 2026**
- Risparmio evidenziato: **€40/anno** rispetto al prezzo ufficiale
- PayPal SDK plan Founding Member: `P-5U875098UL3621449NJHWXJQ`
- Nota PayPal: per mantenere il prezzo Founding Member bloccato serve un piano PayPal separato a €79/anno, distinto dal piano standard a €119/anno.

## Struttura sezioni index.html

1. **Nav** — logo c/g lightcalc, link workflow / funzionalità / screenshot / prezzi, CTA "attiva lightcalc pro"
2. **Hero** — promessa principale "Dalla planimetria PDF alla relazione illuminotecnica pronta da consegnare", proof browser/dispositivi/output
3. **Workflow** — tre passaggi: planimetria PDF → verifica illuminotecnica → relazione tecnica
4. **Screenshots** — galleria orizzontale scrollabile (11 immagini) con caption orientate al beneficio + lightbox
5. **Benefits** — 3 card: meno tempo, meno errori, relazione pronta
6. **Output relazione** — cosa contiene la relazione PDF/DOCX e richiamo al controllo professionale
7. **Features** — griglia 3 colonne, 6 card tecniche tradotte in beneficio
8. **Casi d'uso** — interni, esterni/stradale, emergenza
9. **Lavora ovunque** — web app browser, Windows, macOS, Linux, iPad
10. **Fiducia** — sviluppato da architetto, oltre 100 controlli, normativa integrata, flusso di lavoro reale
11. **Confronto** — tabella DIALux / Relux vs LightCalc
12. **Per chi è / non è** — due colonne di posizionamento
13. **Storia** — perché è nato LightCalc
14. **Pricing** — card unica, prezzo €119 sbarrato + €79/anno promo Founding Member, PayPal SDK
15. **FAQ** — DIALux, browser, installazione, iPad, PDF/DOCX, normative, rinnovo, prezzo bloccato, dati, supporto, attivazione
16. **CTA finale** — ritorno al valore "verifica → relazione"
17. **Footer** — crediti studio cibelli/guadagno, Stefano Cibelli, tech stack

## Todo / aperto

- [ ] Integrare Lemon Squeezy per gestione abbonamenti automatica (sostituire PayPal manuale)
- [ ] Aggiungere favicon personalizzata all'app Streamlit in `ascito68/Lux` (già presente su landing)
- [ ] Migliorare immagini galleria con browser-frame (Screely.com) — attualmente screenshot diretti

## Git — note operative

Il stop hook richiede `commit.gpgsign=true` con chiave SSH. I commit vengono firmati automaticamente. Se compare il warning "Unverified", verificare che entrambi i branch (main e claude/...) siano aggiornati con `git push origin claude/lightcalc-landing-page-ej70k1 --force` se necessario.
