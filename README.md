# Tesi di laurea

Questa tesi tratta alcuni dei principali approcci recenti alla computer vision e al deep learning, con particolare attenzione a rilevamento e segmentazione delle immagini. Dopo un'introduzione ai concetti fondamentali — reti neurali, dataset, training, transfer learning e metriche di valutazione — vengono analizzati e messi a confronto diversi modelli e strumenti:

- PyTorch;
- YOLO26 e le relative metriche, procedure di training e inferenza;
- Segment Anything (SAM e SAM3), inclusa la generazione del dataset;
- SegFormer;
- Vision-Language Models (Qwen 3 e Gemma 4);
- Grounding DINO.

Il documento finale è prodotto a partire da [`main.tex`](main.tex), che importa i capitoli dalla cartella [`chapters/`](chapters/) e utilizza le immagini presenti in [`images/`](images/). La bibliografia è contenuta in [`bibliography.bib`](bibliography.bib).

## Struttura del progetto

```text
.
├── main.tex             # File principale della tesi
├── bibliography.bib     # Bibliografia BibLaTeX
├── chapters/            # Capitoli e sezioni della tesi
├── images/              # Figure e risultati sperimentali
└── main.pdf             # PDF generato
```

## Configurazione di sviluppo

Il progetto è stato scritto in **Visual Studio Code** su macOS, utilizzando:

- l'estensione **LaTeX Workshop** per l'editing e la compilazione dal pannello di VS Code;
- **Tectonic** come motore di compilazione LaTeX;
- **BibLaTeX** con backend **Biber** per la bibliografia;
- font moderni gestiti tramite `fontspec`;
- lingua italiana e inglese tramite `babel`.

Il documento usa la classe `report` e include, tra gli altri, i pacchetti `graphicx`, `subcaption`, `amsmath`, `booktabs`, `microtype`, `listings`, `imakeidx`, `fancyhdr` e `hyperref`.

## Installazione

Installare Tectonic e il prerequisito usato dallo script di sorveglianza, `entr`:

```bash
brew install tectonic entr
```

La versione di Biber deve essere compatibile con la versione di BibLaTeX utilizzata da Tectonic. In questo progetto è stata utilizzata Biber **2.17** per macOS Intel:

```bash
mkdir -p ~/.local/bin
curl -L -o /tmp/biber.tar.gz "https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/2.17/binaries/MacOS/biber-darwin_x86_64.tar.gz/download"
tar -xzf /tmp/biber.tar.gz -C /tmp
mv /tmp/biber ~/.local/bin/biber
chmod +x ~/.local/bin/biber
xattr -d com.apple.quarantine ~/.local/bin/biber
rm -f /tmp/biber.tar.gz
```

Assicurarsi inoltre che `~/.local/bin` sia incluso nel `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

Per verificare le installazioni:

```bash
tectonic --version
biber --version
```

> Il comando per Biber riportato sopra è specifico per macOS Intel (`x86_64`). Su macOS Apple Silicon potrebbe essere necessario utilizzare il binario appropriato per l'architettura in uso.

## Compilazione

Per compilare manualmente il documento:

```bash
tectonic -X compile main.tex
```

## Licenza

Non è stata ancora definita una licenza per questo repository.
