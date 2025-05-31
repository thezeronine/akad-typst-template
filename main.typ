#import "@preview/glossarium:0.5.6": gls, glspl
#import "@preview/acrostiche:0.5.2": acr, acrpl

#import "template/template.typ": template

#show: template.with(
  title: "Laborbericht 123 - ASD123",
  author: (
    name: "Max Mustermann",
    street: "Straße 123",
    city: "Ort",
    studentId: "123456",
    email: "student@akad.de",
    signupDate: "12.12.2025",
    today: "22.05.2024",
    prof: "Prof. Dr. ABC",
  ),
)

= Einleitung

#lorem(100)

#lorem(80)

#lorem(120)

= Hauptteil

#lorem(30)

== Glossar & Abkürzungen

#gls("ai") ist abgekürzt! :) #glspl("kuleuven") und #gls("ml") auch. Beim zweiten mal #gls("ai") vorallem.

Acrostiche is a #acr("WTP")! This #acr("WTP") enables easy acronyms manipulation. Or #acr("ai") and #acr("ai") or even #acrpl("ai").

== Abbildungen und Tabellen

Abbildungen und Tabellen (mit entsprechenden Beschriftungen) werden wie folgt erstellt.

=== Abbildungen

#figure(caption: "Das AKAD Logo", image(width: 4cm, "template/assets/Akad_University_Logo.png"))

=== Tabellen

#figure(
  caption: "Eine Tabelle",
  table(
    columns: (1fr, 50%, auto),
    inset: 10pt,
    align: horizon,
    table.header(
      [],
      [*Area*],
      [*Parameters*],
    ),

    text("cylinder.svg"),
    $ pi h (D^2 - d^2) / 4 $,
    [
      $h$: height \
      $D$: outer radius \
      $d$: inner radius
    ],

    text("tetrahedron.svg"), $ sqrt(2) / 12 a^3 $, [$a$: edge length],
  ),
)<linkedtable>

== Code

This has ``` `backticks` ``` in it
(but the spaces are trimmed). And
``` here``` the leading space is
also trimmed.

#figure(
  caption: "Ein Stück Quellcode",
  ```ts
  const ReactComponent = () => {
    return (
      <div>
        <h1>Hello World</h1>
      </div>
    );
  };

  export default ReactComponent;
  ```,
)


== Verweise

Hier ein Zitat das @alankayEarlyHistorySmalltalk1993[S. 123f] das gestern...

Tabellen, Abbildungen und andere Elemente können mit einem Label in spitzen Klammern gekennzeichnet werden (die Tabelle oben hat z.B. das Label `<linkedtable>`). Sie kann dann mit `@linkedtable` referenziert werden. Das ergibt im konkreten Fall: @linkedtable

= Schluss

#lorem(50)

#lorem(120)

#lorem(80)
