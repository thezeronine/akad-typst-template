#import "@preview/glossarium:0.5.6": make-glossary, register-glossary, print-glossary
#import "@preview/acrostiche:0.5.2": *

#import "../glossary.typ": glossary-entries
#import "../acronym.typ": acronym-entries
#import "titlepage.typ": titlepage

#let config = toml("../config.toml")

#let template(
  paper: (
    title: config.paper.title,
    shortTitle: config.paper.shortTitle,
    signupDate: config.paper.signupDate,
    today: datetime.today().display("[day].[month].[year]"),
    tutor: config.paper.tutor,
    courseOfStudy: config.paper.courseOfStudies,
    type: config.paper.type,
    module: config.paper.module,
    lang: config.paper.lang,
  ),
  author: (
    name: config.author.name,
    street: config.author.street,
    city: config.author.city,
    studentId: config.author.studentId,
    email: config.author.email,
  ),

  doc,
) = {
  // general setting
  set document(
    title: paper.title,
    author: author.name,
  )

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
    lang: paper.lang,
    font: "DejaVu Serif"
  )

  set par(
    justify: true,
    first-line-indent: 2em,
    leading: 1.5em, // one-half spacing
    spacing: 1.5em,
  )

  set figure(gap: 1em)

  show figure: it => {
    show raw.where(block: true): set par(leading: 0.8em)
  it
  }
  show figure: set block(above: 2em, below: 2em)

  // state to save page counter for backmatter
  let frontmatter-pagecount = state("frontmatter-pagecount")

  // Frontmatter
  // titlepage
  set page(numbering: none)
  titlepage(paper: paper, author: author)
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

  // Acronyms
  // init-acronyms(acronym-entries)
  // heading(level: 1, numbering: none)[Abkürzungsverzeichnis]
  // print-index(
  //   title: none,
  //   sorted: "down",
  //   used-only: false,
  //   row-gutter: 1.5em,
  // )
  // pagebreak(weak: true)

  // setup glossary
  show: make-glossary
  register-glossary(glossary-entries)

  // Mainmatter
  context frontmatter-pagecount.update(counter(page).get())
  counter(page).update(1)

  // content settings
  set page(
    header: grid(
      columns: (1fr, 1fr),
      align: (left, right),
      row-gutter: 0.5em,
      text(paper.module + " - " + paper.shortTitle, fill: luma(50%)),
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

  // Glossaries
  heading(level: 1, numbering: none)[Glossar]
  print-glossary(
    glossary-entries,
    disable-back-references: true,
    entry-sortkey: x => x.short
  )
  pagebreak(weak: true)

  set heading(numbering: "A.1")
  counter(heading).update(0)

  include "../appendix.typ"
  pagebreak(weak: true)

  // bibliography
  bibliography("../literature.bib", style: "chicago-author-date", title: "Literaturverzeichnis")
  pagebreak(weak: true)
}
