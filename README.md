# Tesi di laurea

Questa tesi tratta alcuni dei principali approcci recenti alla computer vision, al deep learning e al recupero strutturato delle informazioni. Dopo un'introduzione ai concetti fondamentali — reti neurali, dataset, training, transfer learning e fine-tuning — vengono analizzati diversi modelli e strumenti:

- PyTorch;
- YOLO26, con le metriche di valutazione (precision, recall, F1 score, IoU e mAP), le procedure di training e inferenza e una riflessione sul determinismo dei risultati;
- SAM3, con generazione del dataset, risultati sperimentali e ottimizzazioni dell'inferenza;
- SegFormer;
- Vision-Language Models (Qwen3-VL e Gemma 4), con il fine-tuning tramite LoRA, cross-entropy e GRPO;
- Grounding DINO;
- valutazione comparativa dei modelli su una ground truth annotata manualmente, con un protocollo comune e il confronto con un modello di riferimento esterno;
- Graph RAG, con l'integrazione tra il database vettoriale Qdrant e il database a grafo Neo4j.

La parte conclusiva descrive una pipeline applicata a un catalogo di abbigliamento: SAM3 segmenta i capi presenti nelle fotografie, una ricerca ibrida li riconduce agli articoli del catalogo e Neo4j rappresenta prodotti, outfit e abbinamenti attraverso un grafo a proprietà. Il capitolo illustra anche il modello dei dati, le strategie di ricerca, le ottimizzazioni adottate e i limiti noti dell'approccio.

Il documento finale è prodotto a partire da [`main.tex`](main.tex), che importa i capitoli dalla cartella [`chapters/`](chapters/) e utilizza le immagini presenti in [`images/`](images/). La bibliografia è contenuta in [`bibliography.bib`](bibliography.bib).

## Struttura del progetto

```text
.
├── main.tex             # File principale della tesi
├── bibliography.bib     # Bibliografia BibLaTeX
├── chapters/            # Capitoli, inclusa la pipeline Graph RAG
├── images/              # Figure, risultati e visualizzazioni del grafo
├── .gitignore           # File macOS e artefatti LaTeX ignorati da Git
└── main.pdf             # PDF generato
```

## Configurazione di sviluppo

Il progetto è stato scritto in **Visual Studio Code** su macOS, utilizzando:

- l'estensione **LaTeX Workshop** per l'editing e la compilazione dal pannello di VS Code;
- **Tectonic** come motore di compilazione LaTeX;
- **BibLaTeX** con backend **BibTeX** per la bibliografia;
- font moderni gestiti tramite `fontspec`;
- lingua italiana e inglese tramite `babel`.

Il documento usa la classe `report` e include, tra gli altri, i pacchetti `graphicx`, `subcaption`, `amsmath`, `amssymb`, `booktabs`, `microtype`, `listings`, `imakeidx`, `fancyhdr`, `hyperref` e `tikz`. Quest'ultimo viene utilizzato per le figure vettoriali, come la struttura del modello dati Graph RAG.

## Installazione

Installare Tectonic tramite Homebrew:

```bash
brew install tectonic
```

La configurazione attuale usa BibTeX, gestito direttamente durante la compilazione da Tectonic, quindi non richiede un'installazione separata di Biber.

Per verificare l'installazione:

```bash
tectonic --version
```

## Compilazione

Per compilare manualmente il documento:

```bash
tectonic -X compile main.tex
```

## Note storiche

### Compatibilità con Biber

Una versione precedente del progetto utilizzava Biber. Poiché la sua versione deve essere compatibile con quella di BibLaTeX distribuita da Tectonic, su macOS Intel era stata installata manualmente la versione **2.17**:

```bash
mkdir -p ~/.local/bin
curl -L -o /tmp/biber.tar.gz "https://sourceforge.net/projects/biblatex-biber/files/biblatex-biber/2.17/binaries/MacOS/biber-darwin_x86_64.tar.gz/download"
tar -xzf /tmp/biber.tar.gz -C /tmp
mv /tmp/biber ~/.local/bin/biber
chmod +x ~/.local/bin/biber
xattr -d com.apple.quarantine ~/.local/bin/biber
rm -f /tmp/biber.tar.gz
```

In tale configurazione, `~/.local/bin` deve essere incluso nel `PATH`:

```bash
export PATH="$HOME/.local/bin:$PATH"
```

La versione può essere verificata con:

```bash
biber --version
```

> Questa procedura è conservata come riferimento ed è necessaria soltanto impostando nuovamente `backend=biber` in `main.tex`. Il binario indicato è specifico per macOS Intel (`x86_64`); su Apple Silicon occorre usare una versione adatta all'architettura in uso.
