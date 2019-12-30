# scripts
A collection of useful shell scripts

## Installation

Copy scripts into a directory in your `PATH`. I use `~/.local/bin`.

## cpdirs

Create a copy of a directory skeleton. 

```
cpdirs SRCDIR DSTDIR
```
All directories in SRCDIR (but none of the regular files) are copied to DSTDIR. DSTDIR must exist, must not be a subdiretory of SRCDIR and must be an empty directory.

## kebabcase

Rename fíles to kebabcase, i.e. lowercase words separated by dashes.

```
kebabcase FILES...
```

German umlauts are replaced by a two character representation, e.g. `ß` becomes `ss` and `ä` becomes `ae`.

## pdfsplit and pdfmerge

```
$ pdfsplit file.pdf
$ ls
file.pdf
file-001.pdf
file-002.pdf
...
file-043.pdf
$ pdfmerge file-merged.pdf file-0*.pdf
```

The `pdfsplit` script splits a PDF file `file.pdf` into single-page files called `file-XXX.pdf`. Here, XXX is the page number, padded with zeros such that even the highest page number is preceded with a zero. This way the files are in the correct order when being merged together again using `pdfmerge file-*.pdf`. I use these two scripts when redacting parts of a multi-page pdf with an image editor such as `gimp` or `inkscape`.
