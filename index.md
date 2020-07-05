---
---
## Welcome

This manual describes the syntax and semantics of Swift unambiguously and in technical
detail.

**Caveat:** This document is incomplete and under heavy development.

This manual is intended to provide:
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
Language](https://docs.swift.org/swift-book) is a great book, but it was never
intended as a reference manual.  Too often, a full understanding of language
semantics involves diving into details of its implementation that should never
be part of most users' programming models.  A proper language reference manual
prioritizes precision and completeness over friendly narrative, but also
describes the language at a level far above that of the language's
implementation.

### Resources

The source for this document is developed in the
[SwiftRef](https://github.com/dabrahams/swiftref) project.
