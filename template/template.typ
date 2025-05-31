#import "@preview/glossarium:0.5.6": make-glossary, register-glossary, print-glossary
#import "@preview/acrostiche:0.5.2": *

#import "../glossary.typ": glossary-entries
#import "../acronym.typ": acronym-entries
#import "titlepage.typ": titlepage

#let template(
  title: none,
  author: (),
  doc,
) = {
  // general setting
  set page(
    paper: "a4",
    margin: (
      top: 30mm,
      right: 20mm,
      bottom: 30mm,
      left: 25mm,
    ),
    number-align: right,
  )

  set text(
    size: 12pt,
    ligatures: true,
    lang: "de",
  )

  set par(
    justify: true,
    leading: 1.5em, // one-half spacing
  )

  // state to save page counter for backmatter
  let frontmatter-pagecount = state("frontmatter-pagecount")

  // Frontmatter
  // titlepage
  set page(numbering: none)
  titlepage(author: author)
  pagebreak(weak: true)

  // Table of Contents
  set page(numbering: "I")
  outline()
  pagebreak(weak: true)

  // Table of Figures
  heading(level: 1, numbering: none)[Abbildungsverzeichnis]
  outline(
    title: none,
    target: figure.where(kind: image),
  )
  pagebreak(weak: true)

  // Glossaries
  show: make-glossary
  register-glossary(glossary-entries)
  heading(level: 1, numbering: none)[Glossar]
  print-glossary(glossary-entries)
  pagebreak(weak: true)

  // Acronyms
  init-acronyms(acronym-entries)
  heading(level: 1, numbering: none)[Abkürzungsverzeichnis]
  print-index(title: none)
  pagebreak(weak: true)

  // Mainmatter
  context frontmatter-pagecount.update(counter(page).get())
  counter(page).update(1)

  // content settings
  set page(
    header: grid(
      columns: (1fr, 1fr),
      align: (left, right),
      row-gutter: 0.5em,
      text(title, fill: luma(50%)),
    ),
    numbering: "1",
  )
  set heading(numbering: "1.1")

  // format headings
  show heading: it => { v(1em) + text(it) + v(0.5em) }

  // Main content
  doc
  pagebreak(weak: true)

  // Backmatter
  context counter(page).update(frontmatter-pagecount.get())
  set page(numbering: "I")

  set heading(numbering: "A.1")
  counter(heading).update(0)

  // bibliography
  bibliography("../literature.bib", style: "ieee", title: "Literaturverzeichnis")
  pagebreak(weak: true)

  include "../appendix.typ"
}
