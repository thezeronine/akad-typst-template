#let titlepage(paper: (), author: ()) = {
  align(center)[
    #image("assets/Akad_University_Logo.png", width: 30%)
    #v(2em)
    AKAD Bildungsgesellschaft mbH \
    #paper.courseOfStudy
    #v(5em)
    #text(1.5em)[*#paper.title*]
    #v(2em)
      #paper.type \
      #paper.module
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
      [Anmeldedatum:], [#paper.signupDate],
      [Abgabedatum:], [#paper.today],
      [Betreuer:], [#paper.tutor],
    )
  ]
}
