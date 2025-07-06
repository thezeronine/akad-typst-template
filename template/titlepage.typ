#import "i18n.typ": *

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
      table.cell(colspan: 2, [#TITLEPAGE_SUBMITTED_BY.at(paper.lang)]),
      [#TITLEPAGE_NAME.at(paper.lang)], [#author.name],
      [#TITLEPAGE_ADDRESS.at(paper.lang)], [#author.street, #author.city],
      [#TITLEPAGE_STUDENT_NO.at(paper.lang)], [#author.studentId],
      [#TITLEPAGE_EMAIL.at(paper.lang)], [#link("mailto:" + author.email)],
      [#TITLEPAGE_SIGNUP_DATE.at(paper.lang)], [#paper.signupDate],
      [#TITLEPAGE_SUBMISSION_DATE.at(paper.lang)], [#paper.today],
      [#TITLEPAGE_TUTOR.at(paper.lang)], [#paper.tutor],
    )
  ]
}
