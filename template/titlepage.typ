#let titlepage(author: ()) = {
  align(center)[
    #text(2.5em)[AKAD Bildungsgesellschaft mbH] \
    #text(1.5em)[Software Engineering - Bachelor of Engineering (B. Eng.)]
    #v(4em)
    #image("assets/Akad_University_Logo.png", width: 40%)
    #v(5em)
    #text(1.5em)[
      *Laborbericht* \
      WEB42S - Webprojekt I \
      #v(1em)
      *Webprojekt I* \
      WEB42S-LB
    ]
  ]

  align(bottom + left)[
    #table(
      columns: 2,
      stroke: none,
      column-gutter: 2em,
      table.cell(colspan: 2, [Vorgelegt von:]),
      [Name:], [#author.name],
      [Adresse:], [#author.street, #author.city],
      [Imma. Nr.:], [#author.studentId],
      [Email:], [#link("mailto:" + author.email)],
      [Anmeldedatum:], [#author.signupDate],
      [Abgabedatum:], [#author.today],
      [Betreuer:], [#author.prof],
    )
  ]
}
