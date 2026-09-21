#set page(
  paper: "presentation-16-9",
  margin: (x: 0.72in, y: 0.52in),
  fill: white,
  footer: context [
    #set text(size: 8pt, fill: rgb("#666666"))
    #h(1fr) Organic Chemistry Quiz Prep · #counter(page).display()
  ],
)
#set text(font: "DejaVu Sans", size: 17pt, fill: black)
#set par(leading: 0.72em, spacing: 0.62em)
#set list(indent: 1.25em, body-indent: 0.55em, spacing: 0.42em)
#set enum(indent: 1.25em, body-indent: 0.6em, spacing: 0.42em)
#set math.equation(numbering: none)

#let navy = black
#let teal = rgb("#222222")
#let coral = rgb("#444444")
#let gold = rgb("#777777")
#let pale = rgb("#F2F2F2")
#let ink2 = rgb("#555555")

#let tag(body, color: teal) = box(
  fill: color.lighten(82%),
  stroke: color.lighten(45%),
  radius: 5pt,
  inset: (x: 8pt, y: 4pt),
  text(size: 10pt, weight: "bold", fill: color, body),
)

#let card(body, accent: teal, fill: white) = block(
  width: 100%, fill: fill, stroke: 0.7pt + rgb("#D0D0D0"), radius: 7pt,
  inset: 13pt, body,
)

#let answer(body) = card(accent: teal, fill: pale)[
  #text(weight: "bold", fill: teal)[Answer] #h(0.5em) #body
]

#let slide(title, body, kicker: none) = {
  if kicker != none {
    tag(kicker)
    v(0.16in)
  }
  text(size: 28pt, weight: "bold", fill: navy, title)
  line(length: 100%, stroke: 1.2pt + teal.lighten(50%))
  v(0.22in)
  body
  pagebreak(weak: true)
}

#let choice(letter, body, correct: false) = box(
  width: 100%,
  fill: if correct { teal.lighten(84%) } else { white },
  stroke: if correct { 1.5pt + teal } else { 0.8pt + rgb("#D0D5DD") },
  radius: 6pt, inset: 9pt,
  [#text(weight: "bold", fill: if correct { teal } else { navy })[#letter.] #body],
)

#let molecule(body) = box(
  fill: white, stroke: 1pt + rgb("#D0D5DD"), radius: 8pt,
  inset: (x: 16pt, y: 11pt), text(size: 24pt, weight: "bold", fill: navy, body),
)

// Title
#align(center + horizon)[
  #tag([QUIZ PREPARATION], color: coral)
  #v(0.28in)
  #text(size: 41pt, weight: "bold", fill: navy)[Organic Chemistry]
  #v(0.08in)
  #text(size: 25pt, fill: teal)[Electrons → structure → bonding]
  #v(0.33in)
  #text(size: 15pt, fill: ink2)[Intuition · worked examples · retrieval practice]
]
#pagebreak()

#slide([Prerequisites: the foundation], kicker: [START HERE])[
  Before oxidation state, formal charge, or hybridization, you need four ideas:
  #v(0.2in)
  #grid(columns: (1fr, 1fr), gutter: 14pt,
    card()[*1 · Valence electrons* \
      The outer electrons available for bonding.],
    card()[*2 · Atomic orbitals* \
      Regions where electrons are likely to be found.],
    card()[*3 · Lewis structures* \
      Maps of bonds, lone pairs, and formal charges.],
    card()[*4 · Electron domains* \
      Directions of electron density around an atom.],
  )
  #v(0.2in)
  #align(center)[#text(weight: "bold")[These ideas connect electron counting to molecular shape.]]
]

#slide([Valence electrons: the bonding budget], kicker: [PREREQUISITE 1])[
  Valence electrons occupy the outermost shell and control most chemical bonding.
  #v(0.2in)
  #table(
    columns: (0.9fr, 1fr, 1.4fr), inset: 9pt, stroke: rgb("#D0D0D0"),
    fill: (x, y) => if y == 0 { rgb("#E8E8E8") } else { white },
    [*Atom*], [*Valence e⁻*], [*Typical bonding pattern*],
    [H], [1], [one bond],
    [C], [4], [four total bonds],
    [N], [5], [three bonds + one lone pair],
    [O], [6], [two bonds + two lone pairs],
    [F / Cl], [7], [one bond + three lone pairs],
  )
  #v(0.18in)
  #card(fill: rgb("#F5F5F5"))[
    Main-group shortcut: the periodic-table group tells you the valence-electron count.
  ]
]

#slide([Why atoms form bonds], kicker: [OCTET INTUITION])[
  #grid(columns: (1fr, 1fr), gutter: 18pt,
    card()[
      *Hydrogen seeks 2 electrons.*
      #v(6pt)
      Its first shell contains only one $1s$ orbital, which can hold two electrons.
    ],
    card()[
      *C, N, O, and F often seek 8.*
      #v(6pt)
      Their valence shell contains one $2s$ and three $2p$ orbitals: four orbitals × two electrons.
    ],
  )
  #v(0.22in)
  A covalent bond lets two atoms share an electron pair. The shared pair counts toward the outer shell of *both* atoms.
  #v(0.16in)
  #card(fill: rgb("#F5F5F5"))[
    The octet rule is a useful pattern, not a universal law. Electron-deficient, odd-electron, and expanded-octet exceptions exist.
  ]
]

#slide([Orbitals: think “probability cloud”], kicker: [PREREQUISITE 2])[
  #grid(columns: (1.15fr, 0.85fr), gutter: 22pt,
    [
      An electron is not a tiny planet following a known circular path.
      #v(0.15in)
      An *orbital* is a 3D probability pattern: a region where an electron is likely to be detected.
      #v(0.16in)
      #card(fill: rgb("#F5F5F5"))[
        Analogy: a blurry long-exposure photo of a fast-moving fan shows where the blades are likely to be, not one exact blade position.
      ]
    ],
    align(center + horizon)[
      #box(width: 150pt, height: 150pt)[
        #place(center + horizon)[#circle(radius: 67pt, fill: rgb("#EEEEEE"), stroke: 1pt + rgb("#999999"))]
        #place(center + horizon)[#circle(radius: 45pt, fill: rgb("#DDDDDD"))]
        #place(center + horizon)[#circle(radius: 22pt, fill: rgb("#BBBBBB"))]
        #place(center + horizon)[#circle(radius: 4pt, fill: black)]
      ]
    ],
  )
  #v(0.13in)
  #align(center)[Darker center = greater probability near the nucleus. The cloud has no hard outer wall.]
]

#slide([The shapes you need: s and p], kicker: [VISUAL MAP])[
  #grid(columns: (1.05fr, 0.95fr), gutter: 18pt,
    align(center + horizon)[#image("assets/orbital-s-p-shapes.png", height: 2.35in)],
    [
      #set text(size: 14pt)
      #card()[
        *s orbital: one sphere* \
        Nondirectional; it looks the same from every angle.
      ]
      #v(10pt)
      #card()[
        *p orbital: two lobes* \
        The three $p$ orbitals have the same shape but point along different axes.
      ]
      #v(10pt)
      #card(fill: rgb("#F5F5F5"))[
        The two shades mark opposite mathematical phases—not positive and negative electrical charges.
      ]
    ],
  )
  #v(-2pt)
  #text(size: 7.5pt, fill: rgb("#666666"))[Image adapted from Patricia.fidi, “Electron orbitals,” Wikimedia Commons, public domain.]
]

#slide([Orbital, subshell, and electron: don’t mix them up], kicker: [VOCABULARY])[
  #table(
    columns: (0.9fr, 1.65fr, 1.15fr), inset: 7pt, stroke: rgb("#D0D0D0"),
    fill: (x, y) => if y == 0 { rgb("#E8E8E8") } else { white },
    [*Word*], [*Meaning*], [*Capacity*],
    [orbital], [one probability pattern], [maximum 2 e⁻],
    [$s$ subshell], [contains one $s$ orbital], [maximum 2 e⁻],
    [$p$ subshell], [contains $p_x$, $p_y$, $p_z$], [maximum 6 e⁻],
  )
  #v(0.12in)
  #align(center)[#text(size: 17pt, weight: "bold")[A “p orbital” is one dumbbell; the “p subshell” is the set of three dumbbells.]]
  #v(0.1in)
  #card(fill: rgb("#F5F5F5"))[
    Why two electrons per orbital? They may share an orbital only when they have opposite spins.
  ]
]

#slide([A bond forms where clouds overlap], kicker: [REVEAL 1 OF 2])[
  #align(center)[
    #box(width: 390pt, height: 112pt)[
      #place(center + horizon, dx: -75pt)[#ellipse(width: 150pt, height: 82pt, fill: rgb("#E4E4E4"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: 75pt)[#ellipse(width: 150pt, height: 82pt, fill: rgb("#E4E4E4"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: -75pt)[#circle(radius: 5pt, fill: black)]
      #place(center + horizon, dx: 75pt)[#circle(radius: 5pt, fill: black)]
    ]
  ]
  #v(0.12in)
  Far apart, each nucleus attracts its own electron cloud. As the atoms approach, the clouds begin to overlap.
  #v(0.18in)
  #align(center)[#text(size: 20pt, weight: "bold")[The useful question: where does shared electron density collect?]]
]

#slide([Head-on overlap makes a σ bond], kicker: [REVEAL 2 OF 2])[
  #align(center)[
    #box(width: 390pt, height: 108pt)[
      #place(center + horizon, dx: -48pt)[#ellipse(width: 165pt, height: 78pt, fill: rgb("#E0E0E0"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: 48pt)[#ellipse(width: 165pt, height: 78pt, fill: rgb("#E0E0E0"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon)[#ellipse(width: 75pt, height: 58pt, fill: rgb("#AAAAAA"))]
      #place(center + horizon, dx: -48pt)[#circle(radius: 5pt, fill: black)]
      #place(center + horizon, dx: 48pt)[#circle(radius: 5pt, fill: black)]
      #place(center + horizon, dy: 49pt)[#line(length: 96pt, stroke: 1pt + black)]
    ]
  ]
  #v(0.08in)
  The overlap sits directly *between the nuclei*, along the internuclear axis. Both nuclei attract this shared pair, holding the atoms together.
  #v(0.16in)
  #answer([Head-on overlap along the bond axis is a σ bond. Every single bond is one σ bond.])
]

#slide([Side-by-side overlap makes a π bond], kicker: [VISUAL INTUITION])[
  #align(center)[
    #box(width: 390pt, height: 125pt)[
      #place(center + horizon, dx: -48pt, dy: -30pt)[#ellipse(width: 48pt, height: 60pt, fill: rgb("#D8D8D8"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: 48pt, dy: -30pt)[#ellipse(width: 48pt, height: 60pt, fill: rgb("#D8D8D8"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: -48pt, dy: 30pt)[#ellipse(width: 48pt, height: 60pt, fill: rgb("#EEEEEE"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: 48pt, dy: 30pt)[#ellipse(width: 48pt, height: 60pt, fill: rgb("#EEEEEE"), stroke: 1pt + rgb("#888888"))]
      #place(center + horizon, dx: -48pt)[#circle(radius: 5pt, fill: black)]
      #place(center + horizon, dx: 48pt)[#circle(radius: 5pt, fill: black)]
      #place(center + horizon)[#line(length: 96pt, stroke: 1.2pt + black)]
    ]
  ]
  #v(0.06in)
  Parallel $p$ orbitals touch sideways. Shared density appears *above and below* the bond axis, leaving a nodal plane through the nuclei.
  #v(0.13in)
  #answer([Side-by-side overlap is a π bond. It supplements—not replaces—the σ bond in a double bond.])
]

#slide([Three overlap pictures at a glance], kicker: [VISUAL SUMMARY])[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
    align(center)[#image("assets/overlap-ss.png", height: 1.4in) \
      *s–s σ* \
      head-on spheres],
    align(center)[#image("assets/overlap-pp-sigma.png", height: 1.4in) \
      *p–p σ* \
      head-on p lobes],
    align(center)[#image("assets/overlap-pp-pi.png", height: 1.4in) \
      *p–p π* \
      side-by-side p lobes],
  )
  #v(0.06in)
  #align(center)[#text(size: 13pt)[“σ versus π” describes the *symmetry of the overlap*, not whether the starting orbital was s, p, or hybrid.]]
  #v(1pt)
  #text(size: 7.5pt, fill: rgb("#666666"))[Image adapted from Patricia.fidi, “Electron orbitals,” Wikimedia Commons, public domain.]
]

#slide([Why hybrid orbitals are introduced], kicker: [ORBITAL INTUITION])[
  Hybridization is best understood as a *direction-making model*.
  #v(0.18in)
  #grid(columns: (1fr, 0.18fr, 1fr), gutter: 10pt,
    card()[
      *Raw atomic orbitals* \
      Carbon starts with one spherical $s$ and three perpendicular $p$ orbitals.
    ],
    align(center + horizon)[#text(size: 26pt)[→]],
    card()[
      *Bond-pointing hybrids* \
      Mix them into orbitals aimed toward neighboring atoms for stronger overlap.
    ],
  )
  #v(0.2in)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 10pt,
    card()[*4 directions* \
      $s p^3$, tetrahedral],
    card()[*3 directions* \
      $s p^2$, planar + one p left],
    card()[*2 directions* \
      $s p$, linear + two p left],
  )
  #v(0.13in)
  #align(center)[Hybrid orbitals form the σ framework; leftover $p$ orbitals form π bonds.]
]

#slide([What a Lewis structure shows], kicker: [PREREQUISITE 3])[
  #grid(columns: (1fr, 1fr), gutter: 20pt,
    [
      #text(weight: "bold")[It shows]
      - which atoms are connected
      - single, double, and triple bonds
      - lone pairs
      - formal charges
    ],
    [
      #text(weight: "bold")[It does not directly show]
      - the molecule’s 3D shape
      - exact bond lengths
      - true electron-density distribution
      - electrons moving in fixed paths
    ],
  )
  #v(0.22in)
  #align(center)[#molecule([one line = one shared electron pair = two electrons])]
]

#slide([Lewis vocabulary], kicker: [DOTS AND LINES])[
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    card()[
      *Bonding pair* \
      Two electrons shared between atoms. Drawn as a line: $H-H$.
    ],
    card()[
      *Lone pair* \
      Two nonbonding electrons localized on one atom. Drawn as two dots.
    ],
    card()[
      *Single / double / triple* \
      One, two, or three shared pairs between the same atoms.
    ],
    card()[
      *Formal charge* \
      The charge produced when bonding electrons are divided equally.
    ],
  )
  #v(0.18in)
  #align(center)[Total electrons drawn must equal the available valence-electron total.]
]

#slide([How to draw a Lewis structure], kicker: [REVEAL 1 OF 3])[
  #enum(
    [Count all valence electrons. Add electrons for a negative charge; subtract for a positive charge.],
    [Choose a central atom. It is usually the least electronegative atom, never H.],
    [Connect atoms with single bonds. Each line uses two electrons.],
  )
  #v(0.25in)
  #align(center)[#text(size: 21pt, weight: "bold")[First build the skeleton; then distribute the remaining electrons.]]
]

#slide([How to draw a Lewis structure], kicker: [REVEAL 2 OF 3])[
  #enum(
    [Count all valence electrons.],
    [Choose a central atom and draw single bonds.],
    [Complete the terminal atoms’ octets first.],
    [Place any remaining electrons on the central atom.],
    [If the center lacks an octet, convert neighboring lone pairs into multiple bonds.],
  )
]

#slide([How to draw a Lewis structure], kicker: [REVEAL 3 OF 3])[
  #enum(
    [Count electrons and construct the skeleton.],
    [Complete octets; create multiple bonds if necessary.],
    [Calculate every formal charge.],
    [Verify that formal charges sum to the total molecular charge.],
    [For equivalent arrangements, draw resonance structures.],
  )
  #v(0.18in)
  #card(fill: rgb("#F5F5F5"))[
    Final audit: correct electron total, reasonable octets, and the smallest sensible formal charges.
  ]
]

#slide([Lewis example: carbon dioxide], kicker: [REVEAL 1 OF 3])[
  Total valence electrons:
  #v(0.1in)
  #align(center)[$C: 4 quad + quad 2(O: 6) quad = quad 16 " electrons"$]
  #v(0.2in)
  Place carbon in the center and connect both oxygens:
  #v(0.12in)
  #align(center)[#molecule([$O-C-O$])]
  #v(0.18in)
  Two single bonds use four electrons, leaving twelve to distribute.
]

#slide([Lewis example: carbon dioxide], kicker: [REVEAL 2 OF 3])[
  Completing both oxygen octets uses all twelve remaining electrons.
  #v(0.18in)
  #align(center)[#molecule([$O-C-O$ with three lone pairs on each O])]
  #v(0.2in)
  Each oxygen has an octet, but carbon has only four electrons around it.
  #v(0.18in)
  #align(center)[#text(size: 21pt, weight: "bold")[Carbon still needs two more shared pairs.]]
]

#slide([Lewis example: carbon dioxide], kicker: [REVEAL 3 OF 3])[
  Move one lone pair from each oxygen into a bonding pair:
  #v(0.18in)
  #align(center)[#molecule([$O=C=O$])]
  #v(0.2in)
  Now every atom has an octet, all 16 electrons are accounted for, and every formal charge is zero.
  #v(0.18in)
  #answer([The best Lewis structure contains two C=O double bonds.])
]

#slide([Lewis example: carbon monoxide], kicker: [AN UNUSUAL CASE])[
  CO has $4 + 6 = 10$ valence electrons.
  #v(0.15in)
  A triple bond and one lone pair on each atom use all ten:
  #v(0.15in)
  #align(center)[#molecule([$colon C equiv O colon$])]
  #v(0.18in)
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    card()[Carbon formal charge: $4-2-3=-1$],
    card()[Oxygen formal charge: $6-2-3=+1$],
  )
  #v(0.16in)
  The charges look unusual, but this arrangement gives both atoms complete octets.
]

#slide([Resonance: one structure may not be enough], kicker: [LEWIS LIMITATION])[
  Sometimes two or more valid Lewis structures differ only in electron placement—not atom positions.
  #v(0.2in)
  #align(center)[#molecule([$O=N-O^-$ $arrow.l.r.long$ $O^- - N=O$])]
  #v(0.22in)
  The real molecule is a resonance hybrid: its electron density is delocalized, and the two N–O bonds are equivalent overall.
  #v(0.16in)
  #card(fill: rgb("#F5F5F5"))[
    Resonance structures are not molecules flipping back and forth. They are multiple drawings of one delocalized electronic structure.
  ]
]

#slide([The one story behind this quiz], kicker: [BIG PICTURE])[
  #grid(columns: (1fr, 0.08fr, 1fr, 0.08fr, 1fr), gutter: 8pt,
    card(accent: coral)[
      #text(weight: "bold", fill: coral)[1 · Who gets electrons?]
      #v(5pt)
      Electronegativity explains oxidation state and bond polarity.
    ],
    align(center + horizon)[#text(size: 24pt, fill: gold)[→]],
    card(accent: teal)[
      #text(weight: "bold", fill: teal)[2 · How do we count?]
      #v(5pt)
      Lewis structures explain formal charge and hidden H atoms.
    ],
    align(center + horizon)[#text(size: 24pt, fill: gold)[→]],
    card(accent: navy)[
      #text(weight: "bold", fill: navy)[3 · What shape results?]
      #v(5pt)
      Electron domains explain hybridization and orbital overlap.
    ],
  )
  #v(0.28in)
  #card(accent: gold, fill: gold.lighten(88%))[
    *Goal:* learn a small set of electron-accounting ideas—not five unrelated rules.
  ]
]

#slide([Two bookkeeping systems], kicker: [CORE DISTINCTION])[
  #grid(columns: (1fr, 1fr), gutter: 18pt,
    card(accent: coral)[
      #text(size: 20pt, weight: "bold", fill: coral)[Oxidation state]
      #v(7pt)
      Pretend every bond is *fully ionic*.
      #v(7pt)
      Give both bonding electrons to the more electronegative atom.
      #v(9pt)
      #text(fill: ink2)[Useful for redox bookkeeping.]
    ],
    card(accent: teal)[
      #text(size: 20pt, weight: "bold", fill: teal)[Formal charge]
      #v(7pt)
      Pretend every bond is *perfectly covalent*.
      #v(7pt)
      Split bonding electrons equally between the atoms.
      #v(9pt)
      #text(fill: ink2)[Useful for comparing Lewis structures.]
    ],
  )
  #v(0.25in)
  #align(center)[#text(size: 22pt, weight: "bold", fill: navy)[Same molecule · different questions · different answers]]
]

// Overlay pair: oxidation-state intuition
#slide([Oxidation state: follow the electron tug-of-war], kicker: [REVEAL 1 OF 2])[
  #align(center)[
    #molecule([$C quad equiv quad O$])
    #v(0.25in)
    #text(size: 18pt)[Oxygen is more electronegative than carbon.]
    #v(0.2in)
    #text(size: 30pt, fill: coral)[Which atom “wins” all six bonding electrons?]
  ]
]

#slide([Oxidation state: follow the electron tug-of-war], kicker: [REVEAL 2 OF 2])[
  #align(center)[
    #molecule([$C quad equiv quad O$])
    #v(0.2in)
    #text(size: 27pt, fill: teal)[$C space arrow.r.long space O$]
    #v(0.15in)
    Oxygen gets its usual $-2$; a neutral molecule must total zero:
    #v(0.12in)
    $x + (-2) = 0 quad arrow.r.long quad x = +2$
  ]
  #v(0.18in)
  #answer([Carbon in CO has oxidation state $bold(+2)$.])
]

#slide([Oxidation-state shortcuts—and why they work], kicker: [INTUITION])[
  #grid(columns: (0.9fr, 1.2fr), gutter: 20pt,
    [
      #card(accent: teal)[*O* is usually $-2$]
      #v(8pt)
      #card(accent: gold)[*H* is usually $+1$ with nonmetals]
      #v(8pt)
      #card(accent: coral)[A neutral molecule sums to $0$]
      #v(8pt)
      #card(accent: navy)[An ion sums to its charge]
    ],
    [
      #text(weight: "bold", fill: navy)[Mental model]
      #v(8pt)
      For each bond, ask: “If this bond broke heterolytically, which atom would keep the pair?”
      #v(12pt)
      #card(accent: coral, fill: coral.lighten(90%))[
        These are *assigned* charges, not necessarily real partial charges.
      ]
      #v(12pt)
      Exceptions exist (peroxides, hydrides), but the quiz examples use the usual rules.
    ],
  )
]

#slide([Worked set: carbon oxidation states], kicker: [MORE EXAMPLES])[
  #table(
    columns: (1.05fr, 1.15fr, 1.5fr), inset: 9pt,
    stroke: rgb("#D0D5DD"), fill: (x, y) => if y == 0 { navy } else { white },
    [#text(fill: white, weight: "bold")[Molecule]], [#text(fill: white, weight: "bold")[Equation]], [#text(fill: white, weight: "bold")[Carbon state]],
    [$"CH"_4$], [$x + 4(+1) = 0$], [$-4$ — C wins C–H electrons],
    [$"CO"$], [$x + (-2) = 0$], [$+2$],
    [$"CO"_2$], [$x + 2(-2) = 0$], [$+4$],
    [$"CH"_3 "OH"$], [$x + 4(+1) + (-2)=0$], [$-2$],
  )
  #v(0.2in)
  #card(accent: gold, fill: gold.lighten(90%))[
    Pattern: more C–O bonds make carbon more oxidized; more C–H bonds make it more reduced.
  ]
]

#slide([Formal charge: ownership under equal sharing], kicker: [FORMULA + MEANING])[
  #align(center)[
    #box(fill: navy, radius: 8pt, inset: 15pt)[
      #text(size: 23pt, fill: white)[$"FC" = V - N - B/2$]
    ]
  ]
  #v(0.22in)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 12pt,
    card(accent: coral)[*V*: valence electrons of the isolated neutral atom],
    card(accent: teal)[*N*: nonbonding electrons drawn on that atom],
    card(accent: gold)[*B/2*: half of its bonding electrons],
  )
  #v(0.22in)
  #align(center)[#text(size: 19pt, weight: "bold", fill: navy)[Fast version: valence − dots − bond lines]]
]

// Overlay sequence for FC in CO
#slide([Formal charge of carbon in CO], kicker: [REVEAL 1 OF 3])[
  #align(center)[#molecule([$colon C equiv O colon$])]
  #v(0.28in)
  Count only what belongs to carbon:
  #v(0.12in)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 14pt,
    card(accent: coral)[Valence $V = 4$],
    card(accent: teal)[Dots $N = ?$],
    card(accent: gold)[Bond electrons $B = ?$],
  )
]

#slide([Formal charge of carbon in CO], kicker: [REVEAL 2 OF 3])[
  #align(center)[#molecule([$colon C equiv O colon$])]
  #v(0.23in)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 14pt,
    card(accent: coral)[Valence $V = 4$],
    card(accent: teal)[One lone pair: $N = 2$],
    card(accent: gold)[Triple bond: $B = 6$],
  )
  #v(0.24in)
  #align(center)[$"FC" = 4 - 2 - 6/2$]
]

#slide([Formal charge of carbon in CO], kicker: [REVEAL 3 OF 3])[
  #align(center)[
    #molecule([$colon C equiv O colon$])
    #v(0.23in)
    $"FC"_C = 4 - 2 - 3 = -1$
    #v(0.16in)
    $"FC"_O = 6 - 2 - 3 = +1$
  ]
  #v(0.2in)
  #answer([CO is neutral because $(-1) + (+1) = 0$. Carbon: oxidation state $+2$, formal charge $-1$.])
]

#slide([Sanity checks for formal charge], kicker: [ERROR DETECTOR])[
  #grid(columns: (1fr, 1fr), gutter: 18pt,
    card(accent: teal)[
      #text(weight: "bold", fill: teal)[Check 1 · Sum]
      #v(6pt)
      All formal charges must sum to the molecule’s total charge.
      #v(10pt)
      $"CO": -1 + 1 = 0$
    ],
    card(accent: coral)[
      #text(weight: "bold", fill: coral)[Check 2 · Plausibility]
      #v(6pt)
      Prefer small formal charges and place negative charge on the more electronegative atom—when possible.
    ],
  )
  #v(0.22in)
  #card(accent: gold, fill: gold.lighten(90%))[
    CO is an instructive exception to the preference: satisfying both octets forces $C^-$ and $O^+$.
  ]
]

#slide([Example: oxygen in carbon dioxide], kicker: [WORKED EXAMPLE])[
  #align(center)[#molecule([$O = C = O$])]
  #v(0.22in)
  For either oxygen: 6 valence electrons, 4 nonbonding electrons, 4 bonding electrons.
  #v(0.12in)
  #align(center)[$"FC"_O = 6 - 4 - 4/2 = 0$]
  #v(0.17in)
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    answer([Oxidation state $= -2$]),
    answer([Formal charge $= 0$]),
  )
]

#slide([Check yourself: carbon monoxide], kicker: [QUIZ · THINK FIRST])[
  What are the oxidation state and formal charge on carbon in CO, respectively?
  #v(0.22in)
  #grid(columns: (1fr, 1fr), gutter: 10pt,
    choice([A], [$0; +1$]), choice([B], [$+1; 0$]),
    choice([C], [$+2; -1$]), choice([D], [$+4; 0$]),
  )
  #v(0.28in)
  #align(center)[#text(size: 20pt, fill: ink2)[Say your reason before advancing.]]
]

#slide([Check yourself: carbon monoxide], kicker: [QUIZ · ANSWER])[
  What are the oxidation state and formal charge on carbon in CO, respectively?
  #v(0.22in)
  #grid(columns: (1fr, 1fr), gutter: 10pt,
    choice([A], [$0; +1$]), choice([B], [$+1; 0$]),
    choice([C], [$+2; -1$], correct: true), choice([D], [$+4; 0$]),
  )
  #v(0.2in)
  #answer([Oxygen takes the bonding electrons in oxidation-state bookkeeping; equal sharing gives carbon formal charge $-1$.])
]

#slide([Electronegativity predicts bond polarity], kicker: [ELECTRON DENSITY])[
  #align(center)[
    #text(size: 24pt, weight: "bold", fill: navy)[$F > "Cl" > C > H > "Li"$]
    #v(0.24in)
    #text(size: 19pt)[Electron density shifts toward the more electronegative atom.]
  ]
  #v(0.22in)
  #grid(columns: (1fr, 1fr), gutter: 18pt,
    card(accent: teal)[
      $C^(delta-) - "Li"^(delta+)$
      #v(8pt)
      Carbon pulls harder than lithium.
    ],
    card(accent: coral)[
      $C^(delta+) - F^(delta-)$
      #v(8pt)
      Fluorine pulls harder than carbon.
    ],
  )
]

#slide([Partial charge is not formal charge], kicker: [COMMON TRAP])[
  #table(
    columns: (1fr, 1.35fr, 1.35fr), inset: 10pt, stroke: rgb("#D0D5DD"),
    fill: (x, y) => if y == 0 { navy } else { white },
    [ ], [#text(fill: white, weight: "bold")[Partial charge]], [#text(fill: white, weight: "bold")[Formal charge]],
    [*Meaning*], [Unequal real electron density], [Equal-share Lewis bookkeeping],
    [*Symbol*], [$delta^+, delta^-$], [$+1, 0, -1$],
    [*Can be fractional?*], [Yes], [No; integer in ordinary Lewis structures],
  )
  #v(0.2in)
  #card(accent: coral, fill: coral.lighten(90%))[
    A carbon can be $delta^+$ in a polar bond while having formal charge $0$.
  ]
]

#slide([Polarity mini-set], kicker: [MORE EXAMPLES])[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 12pt,
    card(accent: teal)[
      #align(center)[$C^(delta-) - H^(delta+)$]
      #v(6pt)
      Small polarity; carbon is slightly more electronegative.
    ],
    card(accent: coral)[
      #align(center)[$C^(delta+) - "Cl"^(delta-)$]
      #v(6pt)
      Chlorine pulls electron density.
    ],
    card(accent: gold)[
      #align(center)[$C - C$]
      #v(6pt)
      Same electronegativity; nonpolar bond.
    ],
  )
  #v(0.25in)
  #answer([Among C–Li, C–Cl, C–C, and C–F, carbon is partially negative only in C–Li.])
]

#slide([Skeletal structures are a compression code], kicker: [LINE-ANGLE INTUITION])[
  #grid(columns: (1fr, 1fr), gutter: 20pt,
    [
      #text(weight: "bold", fill: navy)[What is shown]
      - A corner or unlabeled end = carbon
      - A line = a bond
      - Heteroatoms are written explicitly
      - Hydrogens on heteroatoms are usually shown
    ],
    [
      #text(weight: "bold", fill: navy)[What your brain supplies]
      - Carbon seeks total bond order 4
      - Missing carbon bonds are C–H bonds
      - Double lines count 2; triple lines count 3
      - Charge can change the usual count
    ],
  )
  #v(0.18in)
  #align(center)[#box(fill: navy, radius: 7pt, inset: 12pt)[#text(size: 21pt, fill: white)[$H_C = 4 - "bond order already drawn"$]]]
]

// Animated counting sequence
#slide([Count hidden hydrogens locally], kicker: [REVEAL 1 OF 3])[
  #align(center)[#molecule([$C - C = C$])]
  #v(0.25in)
  Treat each carbon as a separate four-slot puzzle.
  #v(0.15in)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 14pt,
    card(accent: coral)[Left carbon: ? H],
    card(accent: teal)[Middle carbon: ? H],
    card(accent: gold)[Right carbon: ? H],
  )
]

#slide([Count hidden hydrogens locally], kicker: [REVEAL 2 OF 3])[
  #align(center)[#molecule([$C - C = C$])]
  #v(0.25in)
  Count drawn bond order around each carbon.
  #v(0.15in)
  #grid(columns: (1fr, 1fr, 1fr), gutter: 14pt,
    card(accent: coral)[Left: $4-1=3$ H],
    card(accent: teal)[Middle: $4-(1+2)=1$ H],
    card(accent: gold)[Right: $4-2=2$ H],
  )
]

#slide([Count hidden hydrogens locally], kicker: [REVEAL 3 OF 3])[
  #align(center)[
    #molecule([$"CH"_3 - "CH" = "CH"_2$])
    #v(0.24in)
    Total hidden hydrogen count: $3 + 1 + 2 = 6$
  ]
  #v(0.2in)
  #answer([The molecule is propene, $C_3 H_6$. The global formula confirms the local count.])
]

#slide([Hydrogen-counting patterns worth recognizing], kicker: [FLUENCY])[
  #table(
    columns: (1.2fr, 0.8fr, 1.5fr), inset: 8pt, stroke: rgb("#D0D5DD"),
    fill: (x, y) => if y == 0 { navy } else { white },
    [#text(fill: white, weight: "bold")[Carbon pattern]], [#text(fill: white, weight: "bold")[H]], [#text(fill: white, weight: "bold")[Reason]],
    [$-"CH"_3$], [3], [one bond order already used],
    [$-"CH"_2-$], [2], [two single bonds used],
    [$-"CH"=$], [1], [single + double = 3],
    [$="CH"_2$], [2], [one double bond = 2],
    [internal alkyne C], [0], [triple + single = 4],
    [substituted aromatic C], [0], [three bond-order units + substituent],
  )
]

#slide([A global cross-check: degree of unsaturation], kicker: [EXTRA TOOL])[
  For a formula containing C, H, N, and halogens $X$:
  #v(0.12in)
  #align(center)[#box(fill: navy, radius: 8pt, inset: 13pt)[#text(size: 22pt, fill: white)[$"DBE" = (2C + 2 + N - H - X)/2$]]]
  #v(0.2in)
  #grid(columns: (1fr, 1fr), gutter: 16pt,
    card(accent: teal)[
      One ring or one double bond contributes 1 DBE.
    ],
    card(accent: coral)[
      One triple bond contributes 2 DBE.
    ],
  )
  #v(0.16in)
  Example: $C_6 H_6$ gives $(12+2-6)/2 = 4$: one ring + three double bonds.
]

#slide([Hybridization: count directions, not bonds], kicker: [INTUITION])[
  #align(center)[#text(size: 21pt)[A multiple bond points in *one* direction, so it counts as one electron domain.]]
  #v(0.22in)
  #table(
    columns: (0.8fr, 0.9fr, 1.25fr, 1fr), inset: 9pt, stroke: rgb("#D0D5DD"),
    fill: (x, y) => if y == 0 { navy } else { white },
    [#text(fill: white, weight: "bold")[Domains]], [#text(fill: white, weight: "bold")[Hybrid]], [#text(fill: white, weight: "bold")[Geometry]], [#text(fill: white, weight: "bold")[Angle]],
    [4], [$s p^3$], [tetrahedral], [$approx 109.5 degree$],
    [3], [$s p^2$], [trigonal planar], [$approx 120 degree$],
    [2], [$s p$], [linear], [$180 degree$],
  )
]

#slide([Why “sp” labels encode orbital mixing], kicker: [DEEPER INTUITION])[
  #grid(columns: (1fr, 1fr, 1fr), gutter: 12pt,
    card(accent: navy)[
      #align(center)[#text(size: 22pt, weight: "bold")[$s p^3$]]
      #v(6pt)
      1 s + 3 p → 4 hybrid orbitals; no unhybridized p remains.
    ],
    card(accent: teal)[
      #align(center)[#text(size: 22pt, weight: "bold")[$s p^2$]]
      #v(6pt)
      1 s + 2 p → 3 hybrids; one p remains for one π bond.
    ],
    card(accent: coral)[
      #align(center)[#text(size: 22pt, weight: "bold")[$s p$]]
      #v(6pt)
      1 s + 1 p → 2 hybrids; two p orbitals remain for two π bonds.
    ],
  )
  #v(0.2in)
  #card(accent: gold, fill: gold.lighten(90%))[
    This is why double bonds usually imply $s p^2$ and triple bonds imply $s p$.
  ]
]

#slide([Hybridization worked examples], kicker: [MORE EXAMPLES])[
  #grid(columns: (1fr, 1fr), gutter: 14pt,
    card(accent: navy)[
      $"CH"_4$: four σ directions → $s p^3$
    ],
    card(accent: teal)[
      $"CH"_2 = "CH"_2$: three directions at each C → $s p^2$
    ],
    card(accent: coral)[
      $"HC" equiv "CH"$: two directions at each C → $s p$
    ],
    card(accent: gold)[
      Benzene: three directions at each C → $s p^2$
    ],
  )
  #v(0.22in)
  #text(weight: "bold", fill: navy)[Lone pairs count too:] in an amine, N has three bonds + one lone pair → four domains → usually $s p^3$.
]

#slide([σ and π bonds: two kinds of overlap], kicker: [BONDING PICTURE])[
  #grid(columns: (1fr, 1fr), gutter: 20pt,
    card(accent: teal)[
      #text(size: 21pt, weight: "bold", fill: teal)[σ bond]
      #v(7pt)
      Head-on overlap along the internuclear axis.
      #v(8pt)
      Every single bond is σ; every multiple bond contains exactly one σ.
    ],
    card(accent: coral)[
      #text(size: 21pt, weight: "bold", fill: coral)[π bond]
      #v(7pt)
      Side-by-side overlap of unhybridized p orbitals.
      #v(8pt)
      Double bond: 1 π. Triple bond: 2 π.
    ],
  )
  #v(0.22in)
  #align(center)[#text(size: 20pt, weight: "bold")[$C = C: 1 sigma + 1 pi quad | quad C equiv C: 1 sigma + 2 pi$]]
]

// Animated overlap logic
#slide([Name the orbital overlap], kicker: [REVEAL 1 OF 3])[
  An indicated σ bond joins a benzene-ring carbon to an alkyne carbon.
  #v(0.28in)
  #align(center)[#molecule([benzene C $-$ C $equiv$ C])]
  #v(0.28in)
  #align(center)[#text(size: 22pt, fill: coral)[First identify each endpoint independently.]]
]

#slide([Name the orbital overlap], kicker: [REVEAL 2 OF 3])[
  #align(center)[#molecule([benzene C $-$ C $equiv$ C])]
  #v(0.25in)
  #grid(columns: (1fr, 1fr), gutter: 20pt,
    card(accent: teal)[Benzene carbon: three domains → $s p^2$],
    card(accent: coral)[Alkyne carbon: two domains → $s p$],
  )
]

#slide([Name the orbital overlap], kicker: [REVEAL 3 OF 3])[
  #align(center)[
    #molecule([benzene C $-$ C $equiv$ C])
    #v(0.27in)
    #box(fill: navy, radius: 8pt, inset: 15pt)[
      #text(size: 25pt, fill: white)[$sigma: space s p^2 "–" s p$ overlap]
    ]
  ]
  #v(0.2in)
  #answer([The order of the labels does not matter: $s p^2$–$s p$ is the same overlap as $s p$–$s p^2$.])
]

#slide([Overlap examples], kicker: [TRANSFER])[
  #table(
    columns: (1.5fr, 0.9fr, 1.25fr), inset: 9pt, stroke: rgb("#D0D5DD"),
    fill: (x, y) => if y == 0 { navy } else { white },
    [#text(fill: white, weight: "bold")[Bond]], [#text(fill: white, weight: "bold")[Endpoints]], [#text(fill: white, weight: "bold")[σ overlap]],
    [C–C in ethane], [$s p^3, s p^3$], [$s p^3$–$s p^3$],
    [C=C in ethene], [$s p^2, s p^2$], [$s p^2$–$s p^2$],
    [C≡C in ethyne], [$s p, s p$], [$s p$–$s p$],
    [C–H in ethene], [$s p^2, 1s$], [$s p^2$–$1s$],
    [O–H in water], [$s p^3, 1s$], [$s p^3$–$1s$],
  )
]

#slide([Mixed practice: explain, don’t guess], kicker: [RETRIEVAL ROUND])[
  #enum(
    [What are carbon’s oxidation state and formal charge in CO?],
    [Which carbon is $delta^-$: C–Li or C–F?],
    [How many H atoms are attached to the middle carbon in $"CH"_3-"CH"="CH"_2$?],
    [What is the hybridization of a carbon in a triple bond?],
    [What orbitals form a σ bond between benzene C and alkyne C?],
  )
  #v(0.2in)
  #card(accent: gold, fill: gold.lighten(90%))[
    For each answer, name the rule that produced it. Retrieval + explanation builds durable memory.
  ]
]

#slide([Mixed practice: answers], kicker: [RETRIEVAL ROUND])[
  #enum(
    [CO carbon: oxidation state $+2$; formal charge $-1$.],
    [C–Li: carbon is $delta^-$ because C is more electronegative.],
    [Middle carbon has 1 H: $4-(1+2)=1$.],
    [Triple-bond carbon is $s p$: two electron-domain directions.],
    [The σ bond is $s p^2$–$s p$ overlap.],
  )
  #v(0.18in)
  #answer([If any answer felt slow, revisit the matching “intuition” slide before memorizing a shortcut.])
]

#slide([A reliable exam workflow], kicker: [PROBLEM-SOLVING])[
  #grid(columns: (1fr, 1fr), gutter: 18pt,
    [
      #card(accent: coral)[*1.* Draw or inspect the Lewis structure.]
      #v(8pt)
      #card(accent: teal)[*2.* Count lone pairs and bond orders.]
      #v(8pt)
      #card(accent: gold)[*3.* Decide which bookkeeping system is asked for.]
    ],
    [
      #card(accent: navy)[*4.* Count local electron domains.]
      #v(8pt)
      #card(accent: teal)[*5.* Label each atom’s hybridization.]
      #v(8pt)
      #card(accent: coral)[*6.* Check charge sums and carbon valence.]
    ],
  )
]

#slide([Final map], kicker: [TAKEAWAY])[
  #align(center)[
    #text(size: 21pt, weight: "bold", fill: navy)[Electronegativity]
    #v(2pt)
    #text(fill: gold)[↓]
    #v(2pt)
    #text(size: 17pt)[oxidation state + bond polarity]
    #v(6pt)
    #text(size: 21pt, weight: "bold", fill: navy)[Lewis electron counting]
    #v(2pt)
    #text(fill: gold)[↓]
    #v(2pt)
    #text(size: 17pt)[formal charge + hidden hydrogens]
    #v(6pt)
    #text(size: 21pt, weight: "bold", fill: navy)[Electron-domain geometry]
    #v(2pt)
    #text(fill: gold)[↓]
    #v(2pt)
    #text(size: 17pt)[hybridization + σ overlap]
  ]
]

#slide([Quiz answer key], kicker: [ORIGINAL QUESTIONS])[
  #table(
    columns: (0.65fr, 0.8fr, 2.4fr), inset: 9pt, stroke: rgb("#D0D5DD"),
    fill: (x, y) => if y == 0 { navy } else { white },
    [#text(fill: white, weight: "bold")[Q]], [#text(fill: white, weight: "bold")[Answer]], [#text(fill: white, weight: "bold")[Key idea]],
    [1], [C], [CO carbon: $+2$ oxidation state, $-1$ formal charge],
    [2], [A], [CO₂ oxygen: $-2$ oxidation state, $0$ formal charge],
    [3], [A], [C is partially negative in C–Li],
    [4], [D], [18 hidden hydrogens],
    [5], [C], [$s p^2$–$s p$ σ overlap],
  )
  #v(0.22in)
  #align(center)[#text(size: 21pt, weight: "bold", fill: teal)[Understand the reason—not only the letter.]]
]
