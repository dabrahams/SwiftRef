---
---
## Welcome

This manual describes the syntax and semantics of Swift unambiguously
and in technical detail.

**Caveat: it is incomplet, incorrekt, and under heavy development.**

It is intended to provide:
- A central home for captured knowledge.
- A complete programming model that programmers can use to reason about the
  meaning of programs, without reference to details of Swift's implementation.
- A platform of shared understanding that the Swift evolution community
  can use to discuss language changes and their implications.
- A means of objectively evaluating the cost of any proposed change in terms
  complexity of the programming model.
- A basis for deciding whether a behavior constitutes a bug in the
  reference implementation.

### Motivation

The Swift community needs a single document to which it can turn to for a
detailed technical understanding of how the language is supposed to work.  That
information has not always been available, and when available has historically
been
[scattered](https://forums.swift.org/t/an-implementation-model-for-rational-protocol-conformance-behavior/37171/74)
across a great many resources.  [The Swift Programming
Language](https://docs.swift.org/swift-book) is a great book, but as a formal
reference manual it fails to describe many of the details needed to use the
language effectively.  As a consequence, a full understanding of language
semantics often involves a dive into implementation details that should never be
part of a user's programming model.  A proper language reference manual
prioritizes precision and completeness over friendly narrative, but also
describes the language at a level that can be understood without reading the
language's source code.

### Scope

This effort is focused on the Swift's core language.  The documentation of the
Swift standard library is generally complete enough that its intent and details
of its behavior can be understood without an additional reference manual.
Therefore, this reference will only discuss standard library components to the
degree needed to describe the core language.  So for example, while
`Swift.UnsafePointer` will surely be mentioned, types such as `Swift.Set` may
not be.

### Resources

The source for this document is developed in the
[SwiftRef](https://github.com/dabrahams/swiftref) project.
