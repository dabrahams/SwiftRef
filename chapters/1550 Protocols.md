---
---

## Protocols 

<p class="draft item"> </p>
A protocol is a set of [requirements](#requirements) enabling a uniform means of 
accessing functionality on adopting types. A class, structure or 
enumeration satisfying the requirements of a protocol may [adopt](#adoption) the 
protocol, in which case, the type can be accessed through its 
[conformance](#conformance) to the protocol.  A type's conformance to a protocol
consists of one [witness](#witness) for each requirement.  A type adopting a 
protocol may gain default and other functionality via [extensions](#extension) 
of the protocol. Protocols may be declared in a hierarchy, with one protocol 
being a [refinement](#refinement) of another protocol.

### Declaration

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-declaration">protocol-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <a href="#access-level-modifier">
      access-level-modifier</a><sub class="loosen">opt</sub>
      <code>protocol</code>
      <a href="#protocol-name">protocol-name</a>
      <a href="#type-inheritance-clause">
      type-inheritance-clause</a><sub class="loosen">opt</sub>
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
      <a href="#protocol-body">protocol-body</a>
    </p>
    <p class="syntax-def">
      <span class="name" id="protocol-name">protocol-name</span>
      <span class="arrow"> → </span> 
      <a href="#identifier">identifier</a>
    </p>
    <p class="syntax-def">
      <span class="name" id="protocol-body">protocol-body</span>
      <span class="arrow"> → </span> 
      <code>{</code>
      <a href="#protocol-members">
      protocol-members</a><sub class="loosen">opt</sub>
      <code>}</code>
    </p>
    <p class="syntax-def">
      <span class="name" id="protocol-members">protocol-members</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-member">protocol-member</a>
      <a href="#protocol-members">
      protocol-members</a><sub class="loosen">opt</sub>
    </p>
    <p class="syntax-def">
      <span class="name" id="protocol-member">protocol-member</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-member-declaration">protocol-member-declaration</a>
      |
      <a href="#compiler-control-statement">compiler-control-statement</a>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-member-declaration">
      protocol-member-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-associated-type-declaration">
      protocol-associated-type-declaration</a>
    </p>
    <p class="syntax-def">
      <span class="name">protocol-member-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-property-declaration">
      protocol-property-declaration</a>
    </p>
    <p class="syntax-def">
      <span class="name">protocol-member-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-method-declaration">
      protocol-method-declaration</a>
    </p>
    <p class="syntax-def">
      <span class="name">protocol-member-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-subscript-declaration">
      protocol-subscript-declaration</a>
    </p>
    <p class="syntax-def">
      <span class="name">protocol-member-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-initializer-declaration">
      protocol-initializer-declaration</a>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[applicbale attributes]

<p class="draft item"> </p>
[access level modifiers]

<p class="draft item"> </p>
[type inheritance clause]

<p class="draft item"> </p>
[generic where clause versus typealias declaration]


### Requirements

<p class="draft item"> </p>
There are five types of protocol requirements:
* `associatedtype`
* `var`
* `func` 
* `subscript`
* `init`

<p class="draft item"> </p>
[what a requirement is]

<p class="draft item"> </p>
[applicbale attributes]

<p class="draft item"> </p>
[permitted use of access level modifiers]


#### Associated Type

<div class="admonition grammar">
  <p class="admonition-title">
  Grammar of a protocol associated type declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-associated-type-declaration">
      protocol-associated-type-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <a href="#access-level-modifier">
      access-level-modifier</a><sub class="loosen">opt</sub>
      <code>associatedtype</code>
      <a href="#typealias-name">typealias-name</a>
      <a href="#type-inheritance-clause">
      type-inheritance-clause</a><sub class="loosen">opt</sub>
      <a href="#typealias-assignment">
      typealias-assignment</a><sub class="loosen">opt</sub>
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="typealias-assignment">typealias-assignment</span>
      <span class="arrow"> → </span> 
      <code>=</code>
      <a href="#type">type</a>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[what it is]

<p class="draft item"> </p>
[type inheritance]

<p class="draft item"> </p>
[typealias assignment]

<p class="draft item"> </p>
[generic where clause]


#### Property

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol property declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-property-declaration">
      protocol-property-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#variable-declaration-head">variable-declaration-head</a>
      <a href="#variable-name">variable-name</a>
      <a href="#type-annotation">type-annotation</a>
      <a href="#getter-setter-keyword-block">getter-setter-keyword-block</a>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="variable-declaration-head">
      variable-declaration-head</span>
      <span class="arrow"> → </span> 
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <a href="#declaration-modifiers">
      declaration-modifiers</a><sub class="loosen">opt</sub>
      <code>var</code>
    </p>
    <p class="syntax-def">
      <span class="name" id="variable-name">variable-name</span>
      <span class="arrow"> → </span> 
      <a href="#identifier">identifier</a>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="type-annotation">type-annotation</span>
      <span class="arrow"> → </span> 
      <code>:</code>
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <code>inout</code><sub>opt</sub>
      <a href="#type">type</a>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="getter-setter-keyword-block">
      getter-setter-keyword-block</span>
      <span class="arrow"> → </span> 
      <code>{</code>
      <a href="#getter-keyword-clause">getter-keyword-clause</a>
      <a href="#setter-keyword-clause">
      setter-keyword-clause</a><sub class="loosen">opt</sub>
      <code>}</code>
    </p>
    <p class="syntax-def">
      <span class="name" id="getter-setter-keyword-block">
      getter-setter-keyword-block</span>
      <span class="arrow"> → </span> 
      <code>{</code>
      <a href="#setter-keyword-clause">setter-keyword-clause</a>
      <a href="#getter-keyword-clause">getter-keyword-clause</a>
      <code>}</code>
    </p>
    <p class="syntax-def">
      <span class="name" id="getter-keyword-clause">getter-keyword-clause</span>
      <span class="arrow"> → </span> 
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <a href="#mutation-modifier">
      mutation-modifier</a><sub class="loosen">opt</sub>
      <code>get</code>
    </p>
    <p class="syntax-def">
      <span class="name" id="setter-keyword-clause">setter-keyword-clause</span>
      <span class="arrow"> → </span> 
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <a href="#mutation-modifier">
      mutation-modifier</a><sub class="loosen">opt</sub>
      <code>set</code>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="mutation-modifier">mutation-modifier</span>
      <span class="arrow"> → </span> 
      <code>mutating</code>
      |
      <code>nonmutating</code>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[what it is]

<p class="draft item"> </p>
[how is it declared]


#### Method or Operator Function

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol method declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-method-declaration">
      protocol-method-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#function-head">function-head</a>
      <a href="#function-name">function-name</a>
      <a href="#generic-parameter-clause">
      generic-parameter-clause</a><sub class="loosen">opt</sub>
      <a href="#function-signature">function-signature</a>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[what it is]

<p class="draft item"> </p>
[how is it declared]

<p class="draft item"> </p>
[operator free function]

#### Subscript

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol subscript declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-subscript-declaration">
      protocol-subscript-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#function-head">subscript-head</a>
      <a href="#subscript-result">subscript-result</a>
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
      <a href="#getter-setter-keyword-block">getter-setter-keyword-block</a>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[what it is]

<p class="draft item"> </p>
[how is it declared]

#### Initializer

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol initializer declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-initializer-declaration">
      protocol-initializer-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#initializer-head">initializer-head</a>
      <a href="#generic-parameter-clause">
      generic-parameter-clause</a><sub class="loosen">opt</sub>
      <a href="#getter-setter-keyword-block">parameter-clause</a>
      <code>throws</code><sub>opt</sub>
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
    </p>
    <p class="syntax-def">
      <span class="name" id="protocol-initializer-declaration">
      protocol-initializer-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#initializer-head">initializer-head</a>
      <a href="#generic-parameter-clause">
      generic-parameter-clause</a><sub class="loosen">opt</sub>
      <a href="#getter-setter-keyword-block">parameter-clause</a>
      <code>rethrows</code>
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[what it is]

<p class="draft item"> </p>
[how is it declared]

### Extension

#### Default Implementations

<p class="draft item"> </p>
[static keyword is used whether the extension will be applied to a reference or value type]



### Refinement

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a type inheritance list</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="type-inheritance-clause">
      type-inheritance-clause</span>
      <span class="arrow"> → </span> 
      <code>:</code>
      <a href="#type-inheritance-list">type-inheritance-list</a>
    </p>
    <p class="syntax-def">
      <span class="name" id="type-inheritance-list">
      type-inheritance-list</span>
      <span class="arrow"> → </span> 
      <a href="#type-identifier">type-identifier</a>
      |
      <a href="#type-identifier">type-identifier</a>
      <code>,</code>
      <a href="#type-inheritance-list">type-inheritance-list</a>
    </p>
  </div>
</div>

<p class="draft item"> </p>
A protocol may be declared to refine another protocol.  The declaration of
refinement may be made only in the declaration of the protocol, not in an
extension of the protocol.

<p class="draft item"> </p>



### Adoption
#### Explicit Adoption
#### Implicit Adoption
##### Lesser-Refined Protocols
##### Tuples















### Conformance

<p class="draft item"> </p>
In a given scope, a concrete type `T` **conforms** to a protocol `P` if and only if:
- `T` is a nominal type and the conformance is implied [<-- link to section on how this implication is
  determined] by a
  *[type-inheritance-clause](https://docs.swift.org/swift-book/ReferenceManual/Types.html#grammar_type-inheritance-clause)* 
  visible in that scope.
- `T` is is a non-nominal type that implicitly conforms to `P` as described in [section dealing
  with tuples].

A protocol **conformance** of `T` to `P` is a triple (`T`, `P`, *M*), where *M* is a mapping from
each requirement *r* of `P` onto a corresponding **witness** that satisfies [<--link to requirement satisfaction] *r* for `T`.   

| Requirement | Witness |
|-|-|
| associated type | concrete type nested in `T` |
| non-`static` method | non-`static`, non-`class` method of `T` |
| non-operator `static` method | `static` or `class` method of `T`, or an `enum` case as described in [section describing that horrible new feature] |
| static operator | `static` or `class` operator of `T`, or a concrete module-scope operator |

This chapter describes how a conformance's mapping from requirements to witnesses is determined.

#### Creation of a Conformance
A **protocol conformance** is the set of witnesses used by a concrete type to satisfy the requirements of a 
protocol.  The syntactic declaration, `T: P`, that type `T` conforms to protocol `P` is separate and distinct 
from the determination of the set of witnesses that is a conformance.  The substance of a conformance is not 
declared.  It is created in response to a type being declared to conform to a protocol.  The set of witnesses 
that is a conformance is inferred from the context.

For a type `T` to conform to a protocol `P`, `T` must be declared to conform to `P`, and `T` must have at 
least one implementation for each protocol requirement of `P`.  A named concrete type is declared to conform to 
a protocol in one of two ways.  A non-generic concrete type is expressly declared to conform to a protocol.  A 
concretization of a generic type is implicitly declared to conform to a protocol based on the pattern established 
by the generic type's declaration and extensions.

><sub>***Conretization of a Generic Type**
>A concretization of a generic type is a specialized version of the generic type formed by replacing the generic 
 type's type parameters with concrete type arguments.  A generic type may specify that its concretizations will 
 conform, or conditionally may conform, to one or more protocols, which establishes a pattern for protocol 
 conformance.  When a concretization is formed, its protocol conformances are determined by that pattern.*</sub>

A declaration that `T` conforms to `P` further constitutes, with respect to each protocol `O`*<sub>i</sub>* which 
`P` refines, a declaration that `T` conforms to `O`*<sub>i</sub>*.  Thus, for the declaration of `T: P` to be 
valid, the implicit declarations of each `T: O`*<sub>i</sub>* must be valid.  For each conformance `T: O`*<sub>i</sub>*, 
a distinct set of protocol witnesses is established. 

A type `T` cannot be declared to conform to a protocol `P` if, within the visible scope, another declaration 
exists of `T: P`.  This rule holds true even where competing declarations are conditional with disjoint conditions.  
In a given scope, a type can conform to a protocol in only one way.


#### Requirements

A **protocol requirement** *m* is a statement in the declaration of a protocol that a type declared to conform 
to the protocol must have a member satisfying *m*.

If one protocol refines another protocol, the requirements of the latter are not part of the requirements of 
the former.  The requirements of a protocol are not overridden by a protocol that refines the protocol.  Thus, 
the conformances formed by a refining protocol do not include witnesses for requirements of the refined protocol.

#### Implementations

Given `T: P` and a protocol requirement *m* of `P`, an **implementation** of *m* is any member of `T` that satisfies 
*m*.  A type may have more than one implementation of a requirement.

#### Witness

Given `T: P` and a protocol requirement *m* of `P`, the **witness** for *m* is the implementation used to perform 
*m*.  One and only one of `T`'s implementations of *m* will be the witness for *m*.

An implementation is not *declared* to be a witness.  The identity of the witness for a requirement is inferred 
from the entirety of the scope, including all declarations made within the scope and those imported into the scope.  

Given `T: P` and a protocol requirement *m* of `P`, the witness for *m*  is the **most specialized** implementations 
of *m* on `T`, as determined in the scope in which the declaration `T: P` is stated.  If `T` has only one implementation 
of *m*, that implementation will be the protocol witness.  If `T` has more than one implementation of *m*, the most 
specialized of those implementations will be the protocol witness.

#### Most Specialized Implementation
Among a type's implementations of a protocol requirement, the most specialized implementation will serve as the 
witness for the requirement.  If only one implementation of a requirement is present, that implementation is the 
most specialized.

If two implementations of a requirement are visible, the rules stated in this Section 1.5 determine which is the 
most specialized.  If more than two implementations of a requirement are visible, the implementations are paired 
and compared iteratively using these rules until the most specialized implementation is determined.

The relative specialization between two implementations of a requirement is determined as follows:

##### Implementations on Protocol and Conforming Type
*Subject to the limitation stated in Section 1.5.4*, if one implementation is declared in an extension of a protocol 
and another implementation is declared on a conforming type (whether in its declaration and/or an extension), the latter 
implementation is more specialized.

---

Example 1.5.1 demonstrates this case.  For the requirement *m1* of conformance of `S: P`, `S` has two implementations: 
*i1* declared in an extension of `P`, and *i2* declared in the declaration of `S`.  Accordingly, *i2* is the more 
specialized, and is the witness for *m1* of `S: P`.  

```swift
// EXAMPLE 1.5.1
protocol P { 
  var id: String { get } // (m1)
}
extension P { 
  var id: String { "P" } // (i1)
} 

struct S {
  var id: String { "S" } // (i2)
}
extension S: P {}
```

##### Implementations on Two Different Protocols 
*Subject to the limitation stated in Section 1.5.4*, if one implementation is declared in an extension of one protocol 
and another implementation is declared in an extension of another protocol, then:

(i) if one protocol refines the other protocol, the implementation declared in an extension of the more refined 
protocol is the more specialized; and  

(ii) otherwise, it is ambiguous which implementation is the more specialized.

---

Example 1.5.2 demonstrates that an implementation on a protocol is considered more specialized than an implementation 
on a protocol that is refined by the first protocol and that the same holds true even if the implementation on the 
less-refined protocol is more constrained than the implementation on the more-refined protocol.

The conformance of `S: P` has two implementations of the requirement *m1* of protocol `P`:  implementation *i1* declared 
in an extension of `P`, and implementation *i2* declared in an extension of protocol `Q`.  Since `Q` refines `P`, *i2* 
is more specialized than *i1*.  Thus, *i2* is the witness for *m1* of `S: P`.  When *m1* of `S: P` is accessed at *a1* 
(or anywhere else), *i2* is the witness, and serves as the implementation of *m1*.     

```swift
// Example 1.5.2
protocol P {
  var id: String { get } // (m1)
  associatedtype V // (m2)
}
extension P where V: Numeric { // (c1)
  var id: String { "P" } // (i1)
}

protocol Q: P {} //
extension Q {  // unconstrained
  var id: String { "Q_Numeric" } // (i2)
}

func getId<T: P>(of t: T) -> String {
  t.id // (a1)
}

struct S {
  typealias V = Int
}
extension S: P {}
extension S: Q {}

let s = S()
print(s.id) // (a2) // "Q_Numeric"
print(getId(of: s)) // "Q_Numeric"
```

##### Implementations on Same Type 
*Subject to the limitation stated in Section 1.5.4*, if two implementations are both declared on the same protocol 
or the same concrete type, then:

(i) if one implementation is more constrained than the other implementation, the more constrained implementation is 
the more specialized implementation; and

(ii) otherwise, it is ambiguous which implementation is the more specialized.

---

Example 1.5.3 demonstrates the determination of the most specialized implementation among multiple implementations 
declared on the same type.  

The conformance of `S: P` has two implementations of the requirement *m1* of protocol `P`, implementations *i1* and 
*i2*.  While the property labelled *i3* also would satisfy *m1*, it is not present on `S`, because the `P` extension 
on which it is declared is an extension only of types that conform to `P` with an implemention of *m2* that conforms 
to protocol `StringProtocol`; since `S`'s implementation of *m2* is `Int`, which does not conform to  `StringProtocol`, 
the extension containing *i3* does not extend `S`.  

As between the only two implementations available on `S`, *i1* and *i2*, both are declared on `P`.  Since *i1* is 
unconstrained and *i2* is constrained, *i2* is more specialized.  Thus, *i2* is the witness for *m1* of `S: P`.  
When *m1* of `S: P` is accessed at *a1* (or anywhere else), *i2* is the witness, and serves as the implementation of *m1*.      
 
```swift
// Example 1.5.3
protocol P {
  var id: String { get } // (m1)
  associatedtype V // (m2)
}
extension P { 
  var id: String { "O" } // (i1)
}
extension P where V: Numeric {
 var id: String { "O_Numeric" } // (i2)
}
extension P where V: StringProtocol {
  var id: String { "O_StringProtocol" } // (i3)
}

func getId<T: P>(of t: T) -> String {
  t.id // (a1) 
}

struct S: P {
  typealias V = Int
}

let s = S()
print(s.id) // (a2) // "O_Numeric"
print(getId(of: s)) // "O_Numeric"
```           

##### Implementations on Generics via Constrained Extensions
If a concretization is declared to conform to a protocol and an implementation of a requirement of the protocol is 
more constrained than the declaration of conformance, the implementation is unavailable to serve as a witness of the 
conformance of the concretization to the protocol.  Given concretization `T`, the conformance `T: P`, requirement *m* 
of `P`, and a constrained implementation *i* of *m*, if the constraint on *i* is not a superset of the constraint on 
`T: P`, then *i* is unavailable for purposes of the conformance of `T: P`.  This unavailability persists regardless of 
whether `T` satisfies the constraints on *i*.  Thus, even though *i* may be available on `T`, it is not available for 
purposes of the conformance `T: P`.  

---

Example 1.5.4.1 demonstrates that a constrained implementation can be unavailable to a protocol conformance on a 
concretization even though the concretization satisfies the constraints on the implementation.  

The conformance of `X<Int>: P` has two implementations of the requirement *m1* of protocol `P`, *i1* and *i2*.  The 
constraint *c2* on *i2* limits the availability of *i2* to cases in which requirement *m2* is performed by a witness 
that conforms to protocol `Numeric`.  Constraint *c2* is satisfied by `X<Int>`, because `Int`, which is `X<Int>`'s 
implementation of *m2*, conforms to `Numeric`.  Thus, *i2* is available on `X<Int>`, and when the `id` property is 
accessed directly on `X<Int>` as *a2*, *i2* is used; the value "P_Numeric" is returned.

However, constraint *c3* on conformance `X<Int>: P` is the universal set (i.e., the conformance is unconstrained).  
Constraint *c2* is not a superset of the universal set, *c3*.  Consequently, per the rule stated at the outset of this 
Section 1.5.4,  *i2* is disregarded for purposes of the conformance `X<Int>: P`, and so *i1*, as the only implementation 
of *m1* available for purposes of `X<Int>: P`, is the witness for *m1*.  When *m1* of `X<Int>: P` is accessed at *a1* 
(or anywhere else), *i1* is the witness, and serves as the implementation of *m1*.  

```swift
/// Example 1.5.4.1
protocol P {
  var id: String { get } // (m1)
  associatedtype V // (m2)
}
extension P { // (c1)
  var id: String { "P" } // (i1)
}
extension P where V: Numeric { // (c2)
  var id: String { "P_Numeric" } // (i2)
}

func getId<T: P>(of t: T) -> String {
  t.id // (a1)
}

struct X<T> {
  typealias V = T
}
extension X: P {} // (c3)

let x = X<Int>()
print(x.id) // (a2) "P_Numeric"
print(getId(of: x)) // "P"
```
---
Example 1.5.4.2 demonstrates that a specialized implementation of a protocol's requirement provided by a refinement 
of the protocol can be unavailable to a conformance of a concretization to the protocol even though the concretization 
conforms to the refinement.[^2] 
[^2]: Notwithstanding the general inability of concretizations to take advantage of specialized implementations, the 
`Collection` family of protocols in the Standard Library uses a private attribute to gain some access to specialized 
implementations for concretizations of generic types conforming to `BidirectionalCollection` and `RandomAccessCollection`.

Since constraint *c1* on *i2* is not a superset of constraint *c2* on `X<Int>: P`, *i2* is unavailable for purposes of 
the conformance of `X<Int>: P`. 

```swift
/// Example 1.5.4.2
protocol P {
  var id: String { get } // (m1)
  associatedtype V // (m2)
}
extension P {
  var id: String { "P" } // (i1)
}

protocol Q: P {}
extension Q where V: Numeric { // (c1)
  var id: String { "Q_Numeric" } // (i2)
}

func getId<T: Q>(of t: T) -> String {
  t.id // (a1)
}

struct X<T> {
  typealias V = T
}
extension X: P {} // (c2)
extension X: Q {}

let x = X<Int>()
print(x.id) // (a2) "Q_Numeric"
print(getId(of: x)) // "P"
```


### References

1. Suyash Srijan, *[Protocol Witness Matching Mini-Manifesto]*(https://forums.swift.org/t/protocol-witness-matching-mini-manifesto/32752)


### Temporary Link Targets

To grammar in other chapters:
<ul>
  <li id="identifier">identifier</li>
  <li id="#type">type</li> 
  <li id="attributes">attributes</li>  
  <li id="access-level-modifier">access-level-modifier</li>
  <li id="type-identifier">type-identifier</li>
  <li id="#generic-where-clause">generic-where-clause</li>
  <li id="#compiler-control-statement">compiler-control-statement</li>
  <li id="#typealias-name">typealias-name</li>
  <li id="#declaration-modifiers">declaration-modifiers</li>
  <li href="#generic-parameter-clause">generic-parameter-clause</li>
  <li href="#subscript-head">subscript-head</li>
  <li href="#subscript-result">subscript-result</li>
  <li href="#function-head">function-head</li>
  <li href="#initializer-head">initializer-head</li>
  <li href="#getter-setter-keyword-block">parameter-clause</li>
</ul>


<head>
  <!--
  This local style sheet is being used to experiment with refinements to the 
  css for the site. Successful styles will be moved to appropriate files, and 
  this style sheet will be discarded. 
  -->
  <style type="text/css">
    p {
      margin-block-start: 1em;
      margin-block-end: auto;
    }
    ul {
      margin-block-start: 0em;
      margin-block-end: 0em;
    }
    li {
      margin-top: 0.5em;
    }
    .item {
      height: 0.3em;
    }
    .wrapper {
      width: 1060px;
    }
    section {
      width: 700px;
    }
    h2 {
      font-size: 2.0em;
    }
    h3 {
      font-size: 1.5em;
    }
    h4 {
      font-size: 1.33em;
    }
    h5 {
      font-size: 1.17em;
    }
    h6 {
      font-size: 1.0em;
    }h3, h4, h5, h6 {
      margin-top: 1em;
    }
    .draft.item {
      color: red;
      text-indent: -50px;
    }
    .draft.item:before {
      content: "DRAFT: " counter(item);
      counter-increment: item;
    }
  </style>
</head>

