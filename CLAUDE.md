# CLAUDE.md

## Commands

```bash
# Build PDF (requires latexmk)
latexmk -r conf/latexmkrc main.tex

# Clean build artifacts
latexmk -r conf/latexmkrc -C main.tex
```

Output PDF is written to `out/main.pdf`.

## Requirements

- **Compiler**: XeLaTeX (pdflatex will fail — fontspec is required for Thai support)
- **Font**: TH Sarabun New must be installed on the system

## Architecture

```
main.tex              # Entry point; includes all sections
easreport.cls         # Custom LaTeX class (Thai fonts, headers, layout)
conf/latexmkrc        # Build config: XeLaTeX engine, out/ output dir
sections/             # One .tex file per section, named [letter]_[topic].tex
figures/              # Images referenced in sections
assets/               # Watermark and other assets
```

## Gotchas

- `\microtypecontext{spacing=nonadjacent}` must appear in `main.tex` preamble when using microtype with Thai fonts
- Use `\sloppy` / `\fussy` in sections to control Thai text line-breaking
- Build artifacts (`.aux`, `.log`, `.toc`, etc.) are gitignored; `out/` dir is not committed
