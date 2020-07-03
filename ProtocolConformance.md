# 1 Protocol Conformance

>***Protocol Witness*** - Given a type `t` [declared to conform to
>protocol](#11-declaration-of-protocol-conformance) `p` and a protocol
>requirement `m` of `p`, the [protocol witness](#12-protocol-witness) for `m` is
>the implementation that is the [most
>specialized](#14-most-specialized-implementation) of the [unconditionally
>accessible implementations](#13-unconditionally-accessible-implementations) of
>`m` on `t`, as determined in the scope in which the declaration `t: p` is
>stated.

When a type is declared to conform to a protocol, a set of
implementations--*protocol witnesses*--is determined, one for each protocol
requirement of the protocol.  This document specifies how Swift determines the
set of protocol witnesses for a protocol conformance.

## 1.1 Declaration of Protocol Conformance
For a type `t` to conform to a protocol `p`, `t` must be declared to conform to
`p`, and `t` must have at least one unconditionally accessible implementation
for each protocol requirement of `p`.  A distinct set of protocol witnesses is
established for the conformance `t: p`.

A declaration that `t` conforms to `p` further constitutes, with respect to each
protocol `o`*<sub>i</sub>* from which `p` directly or indirectly inherits, a
declaration that `t` conforms to `o`*<sub>i</sub>* so long as `t` has not
already been declared to conform to `o`*<sub>i</sub>*.  Thus, for the
declaration of `t: p` to be valid, the declarations of each `t: o`*<sub>i</sub>*
must satisfy the requirement that `t` have at least one unconditionally
accessible implementation for each protocol requirement of
`o`*<sub>i</sub>*. For each conformance `t: o`*<sub>i</sub>*, a distinct set of
protocol witnesses is established.

In a given scope, a type can conform to a protocol in only one way.  A type `t`
cannot be declared to conform to a protocol `p` if, within the visible scope,
another declaration exists of `t: p`.  This rule holds true even where competing
declarations are conditional with disjoint conditions.

## 1.2 Protocol Witness

Given the declaration of conformance `t: p`, a *protocol requirement* `m` is a
statement in the declaration of `p` that `t` (or any other type seeking to
conform to `p`) must have a member satisfying the requirements of `m`.  A member
of `t` that satisfies the requirements of `m` is referred to as an
*implementation* of `m`.

Given `t: p` and a protocol requirement `m` of `p`, one and only one of `t`'s
implementations of `m` will actually be used as the implementation of `m`.  Such
implementation of `m` is referred to as the *protocol witness* for the `m`
requirement of the conformance `t: p`.

The protocol witness for `m` is the implementation that is the *most
specialized* of the *unconditionally accessible* implementations of `m` on `t`,
as determined in the scope in which the declaration `t: p` is stated.  If `t`
has only one unconditionally accessible implementation of `m`, that
implementation will be the protocol witness.  If `t` has more than one
unconditionally accessible implementation of `m`, the most specialized of those
implementations will be the protocol witness.

An implementation is not *declared* to be a protocol witness.  The identity of
the protocol witness for a protocol requirement is inferred from the entirety of
the scope, including all declarations made within the scope and those imported
into the scope.  Careful engineering is required in order to achieve the
intended witness for a given requirement.

## 1.3 Unconditionally Accessible Implementations

A type's possible implementation of a protocol requirement is available to serve
as the protocol witness for the requirement only if the implementation is an
*unconditionally accessible* member of the type in the scope in which the
protocol conformance is declared.  Given a declaration of `t: p` and an
implementation of a protocol requirement `m` of `p`, the implementation is
*unconditionally accessible* if and only if (i) `t` satisfies the conditions, if
any, to which the declaration of the implementation is subject, and (ii) per the
rules of access control, the implementation is visible in the scope in which `t:
p` is declared.

With respect to generic types, clause (i) of this rule is not fully implemented.
A generic type instantiated with its generic arguments specified as concrete
types may be referred to as a *concretization* of the generic type.  A
concretization is a type separate and apart from its generic type.  Swift's
existing implementation of protocols does not include the ability for a
concretization to develop its own, specialized conformance relationship with a
protocol.  Instead, a concretization uses the protocol conformances of its
generic type, without specialization for implementations available via the
concretization.  Thus, although a concretization may satisfy the conditions of a
generic where clause that would make an implementation unconditionally
accessible, the implementation subject to such where clause nevertheless is
unavailable to serve as a protocol witness for the shared conformance.
  * Although specialized implementations available to a concretization are not
    available to serve as protocol witnesses and cannot be accessed via the
    interface of a protocol, they remain members of the concretization.
    Accordingly, as members, they may be accessed directly on the concretization
    following the rules applicable to resolution of overloads.
  * Notwithstanding the general inability of concretizations to take advantage
    of specialized implementations, the `Collection` family of protocols in the
    Standard Library uses a private attribute to gain some access to specialized
    implementations for concretizations of generic types conforming to
    `BidirectionalCollection` and `RandomAccessCollection`.


## 1.4 Most Specialized Implementation
Among a type's unconditionally accessible implementations of a protocol
requirement, the most specialized implementation will serve as the protocol
witness for the requirement.  The relative specialization between two
implementations, `i`*<sub>1</sub>* and `i`*<sub>2</sub>*, is determined as
follows:

If `i`*<sub>1</sub>* is declared in an extension of a protocol and
`i`*<sub>2</sub>* is declared on t (whether in the declaration and/or an
extension), then `i`*<sub>2</sub>* is more specialized.

If `i`*<sub>1</sub>* is declared in an extension of protocol p1 and
`i`*<sub>2</sub>* is declared in an extension of protocol p2, then (i) if p2
inherits from p1, `i`*<sub>2</sub>* is more specialized, (ii) if p1 inherits
from p2, `i`*<sub>1</sub>* is more specialized, and (iii) otherwise,
`i`*<sub>1</sub>* and `i`*<sub>2</sub>* present an ambiguity (if there is no
other implementation that is more specialized than both `i`*<sub>1</sub>* and
`i`*<sub>2</sub>*, an error will be raised at compile time).

If `i`*<sub>1</sub>* and `i`*<sub>2</sub>* are both declared on t (whether in
the declaration and/or an extension) or are both declared in extensions of the
same protocol, then (i) if the declaration of `i`*<sub>1</sub>* is more
constrained than the declaration of `i`*<sub>2</sub>*, `i`*<sub>1</sub>* is more
specialized, (ii) if the declaration of `i`*<sub>2</sub>* is more constrained
than the declaration of `i`*<sub>1</sub>*, `i`*<sub>2</sub>* is more
specialized, and (iii) otherwise, `i`*<sub>1</sub>* and `i`*<sub>2</sub>*
present an ambiguity (if there is no other implementation that is more
specialized than both `i`*<sub>1</sub>* and `i`*<sub>2</sub>*, an error will be
raised at compile time).[^1]

[^1]: Given the way conditional declarations work or don’t work, I’m not sure
    these declared-on-same-type situations could arise in a meaningful
    way. Thoughts?

## 1.5 Set of Protocol Witnesses

Given a declaration that a type conforms to a protocol, the protocol witness for
the conformance is the set consisting of the protocol witness for each declared
requirement of the protocol.  Inherited requirements of a protocol are
irrelevant to determination of a protocol witness set.

There is only one protocol witness set for a protocol conformance declaration.
Such set is immutable, and is not subject to replacement.

If a protocol has no declared requirements, the protocol witness set for
conformances to the protocol is empty.
