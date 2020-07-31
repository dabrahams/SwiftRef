---
---

## Protocols 

<p class="draft item"> </p>
A protocol is a set of [requirements](#requirements) enabling a uniform means of 
accessing functionality on adopting types. A class, structure or 
enumeration satisfying the requirements of a protocol may [adopt](#adoption) a 
protocol, in which case, the type may be accessed through its 
[conformance](#conformance) to the protocol.  A type's conformance to a protocol
consists of one [witness](#witness) for each requirement.  A type adopting a 
protocol may gain default and other functionality via [extensions](#extension) 
of the protocol. Protocols may be declared in a hierarchy, with one protocol 
being a [refinement](#refinement) of another protocol.


### Declaration
---
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
  </div>
  <div class="syntax-group">
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
    <p class="syntax-def">
      <span class="name">protocol-member-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#protocol-typealias-declaration">
      protocol-typealias-declaration</a>
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
[typealias member]

<p class="draft item"> </p>
[generic where clause versus typealias declaration]

<p class="draft item"> </p>
meaning of Self and self


### Requirements
---
This section discusses each type of (protocol) requirement, how each is 
declared, and the types of declarations that may satisfy each requirement.

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
[note the concept of a requirement being a customization point]

<p class="draft item"> </p>
[applicbale attributes] [attributes are part of requierment's specification, not a modification of the declaration]

<p class="draft item"> </p>
[access level modifiers]

<p class="draft item"> </p>
[other declaration modifiers]


A **protocol requirement** *m* is a statement in the declaration of a protocol that a type declared to conform 
to the protocol must have a member satisfying *m*.

If one protocol refines another protocol, the requirements of the latter are not part of the requirements of 
the former.  The requirements of a protocol are not overridden by a protocol that refines the protocol.  Thus, 
the conformances formed by a refining protocol do not include witnesses for requirements of the refined protocol.

#### Associated Type Requirement

A [protocol-associated-type-declaration](#protocol-associated-type-declaration) 
is also known as an `associatedtype` requirement or an associated type 
requirement. 

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
While the grammar of a protocol-associated-type-declaration includes an
[access-level-modifier](#access-level-modifier), it appears that the current
implementation of the compiler does not allow an access-level-modifier to be
applied to a protocol-associated-type-declaration. 


<p class="draft item"> </p>
[type inheritance]

<p class="draft item"> </p>
[typealias assignment]

<p class="draft item"> </p>
[generic where clause]


#### Property Requirement

A [protocol-property-declaration](#protocol-property-declaration) is also known
as a `var` requirement or a property requirement. 

<p class="draft item"> </p>
A property requirement _r_ of a protocol `P` is a requirement that a type 
adopting `P` must have a property satisfying _r_, with such property visible 
in the scope of the adoption.

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
**Permitted Declaration Modifiers**.   
In the declaration of a property 
requirement, the permitted [declaration-modifiers](#declaration-modifiers) 
are `static` and `dynamic`. Any other declaration-modifier is not allowed.

<p class="draft item"> </p>
**Permitted Attributes**.   
In the declaration of a property requirement, the 
permitted [attributes](#attributes) are the same attributes permitted in a 
[variable-declaration](#variable-declaration). ***check this statement***

<p class="draft item"> </p>
**Type Annotation**.   
In the declaration of a property requirement, the 
formulation of the [type-annotation](#type-annotation) is the same as 
the formulation of the type-annotation applicable 
in the case of a [variable-declaration](#variable-declaration). 
***check this statement***

<p class="draft item"> </p>
**Satisfaction by Variable Declaration**.   
In the scope in which a type `T` 
[adopts](#adoption) a protocol `P`, a 
[variable-declaration](#variable-declaration) _v_ visible on `T` satisfies 
a `var` requirement _r_ of `P` where _r_ the [attributes](#attributes), 
[declaration-modifiers](#declaration-modifiers), 
[identifier](#identifier) and [type-annotation](#type-annotation) of _v_ 
all match the corresponding attributes, declaration-modifiers, identifier and 
type-annotation of _r_.

<p class="draft item"> </p>
**Satisfaction by Constant Declaration**.   
In the scope in which a type `T` 
[adopts](#adoption) a protocol `P`, a 
[constant-declaration](#constant-declaration) _c_ visible on `T` satisfies 
a `var` requirement _r_ of `P` where the 
[attributes](#attributes), [declaration-modifiers](#declaration-modifiers), 
[identifier](#identifier) and [type-annotation](#type-annotation) of _c_ 
all match the corresponding attributes, declaration-modifiers, identifier and 
type-annotation of _r_ and _r_ does not include a 
[setter-keyword-clause](#setter-keyword-clause).

<p class="draft item"> </p>
**Satisfaction by Enum Case**.  
Beginning with Swift 5.3, 
in the scope in which an enum `E`[adopts](#adoption) a protocol `P`, 
a [union-value-style-enum-case](#union-value-style-enum-case) _u_ visible on `E`
satisfies a `var` requirement _r_ of `P`where: 
* the [identifier](#identifier) of _u_ matches the identifier of _r_;
* _u_ does not include any [associated values](#associated values) (i.e., no 
[tuple-type](#tuple-type));
* _r_ does not include a [setter-keyword-clause](#setter-keyword-clause); and
* _r_ includes: 
    - no [attributes](#attributes), 
    - a single [declaration-modifier](#declaration-modifiers) of `static`, and 
    - a [type-annotation](#type-annotation) with: 
        1. no attributes, 
        2. no `inout` keyword, and
        3. a [type](#type) of `Self`, `E` or a `typealias` for `E`.

<p class="draft item"> </p>
[say this better:]
The attributes 
of a `var` requirement 
match 
the attributes
of a constant-declaration or variable-declaration
where
the sets of attributes are equal.
The ordering of the attributes is irrelevant.
***check this statement***

<p class="draft item"> </p>
[say this better:]
The declaration-modifiers 
of a `var` requirement 
match 
The declaration-modifiers 
of a constant-declaration or variable-declaration
where
the sets of attributes are equal.
The ordering of the declaration-modifiers is irrelevant.
***check this statement***

<p class="draft item"> </p>
The declaration-modifier `static` 
as used in the declaration of a protocol requirement 
can be matched 
by either the `static` or `class` declaration-modifier 
of a constant-declaration or variable-declaration.

<p class="draft item"> </p>
[say this better:]
Two [indentifiers](#identifier) are equal if and only if their respective 
UTF-32 representations are equal.

<p class="draft item"> </p>
[say this better:] A [type-annotation](#type-annotation) declared within _i_ 
matches a type-annontation declared within _r_ if the set of attributes are the 
same, the inout keyword is present in both or omitted from both, and the type 
is equivalent.

<p class="draft item"> </p>
[say this better:] When matching to protocol requirements, types are equivalent 
if ________.  
Where a [type](#type) `T` 
of a [type-annotation](#type-annotation) 
of a `var` requirement 
of a protocol `P`
is 
a [type-identifier](#type-identifier)
that refers 
to the [typealias-name](#typealias-name) 
of an `associatedtype` requirement
declared on `P` or a protocol [refined](#refinement) by `P`,
`T` can be matched 
by `T`, or
a type-alias for `T`, or 
the type that is the witness for the `associatedtype` requirement, or
a type-alias for the type that is the witness for the `associatedtype` 
requirement.


#### Method or Operator Requirement

A [protocol-method-declaration](#protocol-method-declaration) is also known
as a `func` requirement or a method requirement or an operator requirement. 

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

#### Subscript Requirement 

A [protocol-subscript-declaration](#protocol-subscript-declaration) is also 
known as a `subscript` requirement or a subscript requirement.

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol subscript declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="protocol-subscript-declaration">
      protocol-subscript-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#subscript-head">subscript-head</a>
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

#### Initializer Requirement

A [protocol-initializer-declaration](#protocol-initializer-declaration) is also 
known as an `init` requirement or an initializer requirement.

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
      <a href="#parameter-clause">parameter-clause</a>
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
      <a href="#parameter-clause">parameter-clause</a>
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
---
This section concerns the role played by extensions relative to protocols.

<p class="draft item"> </p>
A member of a protocol extension is not a member of the protocol with which the
extension is associated.

#### Default Implementations

<p class="draft item"> </p>
[static keyword is used whether the extension will be applied to a reference or value type]


### Refinement
---
This section concerns the refinement relationship that may exist between 
protocols.

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
A protocol `P` may be declared to refine a protocol `O` by including a `: O` 
type  inheritance clause in the declaration of `P`.

```swift
protocol O { var a: Int { get } }

protocol P: O { var b: String { get } }
```

<p class="draft item"> </p>
A refinement cannnot be declared in an extension of a protocol.

```swift
protocol O { var a: Int { get } }

protocol P { var b: String { get } }

extension P: O {} // error: inheritance clause not permitted in extension
```

<p class="draft item"> </p>
A protocol declared to refine another protocol, also implicitly refines all
protocols refined by the latter protocol.

```swift
protocol O { var a: Int { get } }

protocol P: O { var b: String { get } }

protocol Q: P {} // Q refines both P and O
```

<p class="draft item"> </p>
Where a protocol `P` refines another protocol `O`, the members of `O` are 
accessible in the declaration and extensions of `P`.
<p class="note">A member of a protocol refined by another protcol does 
not become a member of the latter protocol.</p>

```swift
protocol O { 
  associatedtype T
  var a: T { get }
}

protocol P: O {
  var b: T { get } // T refers to an adopting type's witness for O.T
}

extension P {
  var b: T { a } // a refers to an adopting type's witness for O.a
}
```

<p class="draft item"> </p>
Where a protocol `P` refines another protocol `O`, `P` is not able to declare a
member of itself that is the same as a member of `O`.  If `P` attempts to 
override or restate a member of `O`, the behavior is undefined. 

<p class="note">Although such program arguably is ill-formed, an error usually 
is not raised by the current implementation of the compiler.  Rather, both the 
`override` keyword is ignored as well as any restatement of a member.</p>

<p class="note">The standard library utilizes the <code>override</code> keyword 
to ___.</p>

<p class="note">The standard library utilizes the <code>@nonoverride</code> 
attribute to ___.</p>

<p class="draft item"> </p>
... to be continued ...


### Composition
---

This section concerns the composition of protocols.

<p class="draft item"> </p>
... to be continued ...

### Class-Only Protocols
---
This section concerns protocols capable of adoption only by class types.

<p class="draft item"> </p>
... to be continued ...


### Objective-C Protocols
---
This section concerns protocol interoperation with Objective-C.

<p class="draft item"> </p>
... to be continued ...

### Adoption
---
This section concerns the adoption of a protocol by a type.

<p class="draft item"> </p>
Any struct, enum or class [satisfying](#conformance) the requirements of a 
protocol may be declared to adopt the protocol.

<p class="draft item"> </p>
Types other than structs, enums and classes cannot be *declared* to adopt a 
protocol.

<p class="draft item"> </p>
A generic form of a struct, enum or class 
declared to adopt a protocol
does not itself adopt the protocol.
Nevertheless, the generic type
must satisfy all requirements of the protocol 
regardless of whether a concretization of the generic type is formed, 
otherise the program is ill-formed.  

<p class="draft item"> </p>
Where a generic type `X` 
is declared to adopt a protocol `P`, 
a concretization of `X` 
adopts `P`. 

<p class="draft item"> </p>
Where type `T` [satisfies](#conformance) the requirements of protocol `P`, `T` 
may unconditionally adopt `P` by including a `: P` 
[type  inheritance clause](#type-inheritance-clause) in the declaration of `T` 
or in any extension of `T`.

```swift
protocol P { var a: Int { get } } // requirement M

struct S: P { var a: Int { 42 } } // M satisfied; adoption declared

class C { let a: Int } // M satisfied
extension C: P {} // adoption declared

enum E {}
extension E: P { var a: Int { 42 } } // M satisfied; adoption declared
```

<p class="draft item"> </p>
Where type `T` [satisfies](#conformance) the requirements of protocol `P`, 
`T` may conditionally adopt `P` by including a `: P` 
[type  inheritance clause](#type-inheritance-clause) and a 
[generic where clause](#generic-where-clause) in the declaration of `T` or in 
any extension of `T`.

```swift
protocol P {}

struct S<T> {}
extension S: P where T: Numeric {}
```

<p class="draft item"> </p>
Where a protocol `P` refines a protocol `O` and type `T` is declared to adopt 
`P`, for the adoption of `P` to be valid, `T` must [satisfy](#conformance) 
the requirements of both `P` and `O`.

```swift
protocol O { var a: Int { get } } // requirement M

protocol P: O {}

struct S {} // M not satisfied
extension S: P {} // error: struct S does not conform to protocol O
```

<p class="draft item"> </p>
Where a protocol `P` refines a protocol `O`, a type `T` 
[satisfies](#conformance) the requirements of `O` and `P`, and `T` 
unconditionally is declared to adopt `P`, `T` implicilty adopts `O` 
unconditionally.

```swift
protocol O { var a: Int { get } } // requirement M

protocol P: O {}

struct S { var a: Int { 1 } } // M satisfied
extension S: P {} // adoption of P declared; adoption of O implied
```

<p class="draft item"> </p>
Where a protocol `P` refines a protocol `O`, type `T` [satisfies](#conformance) 
the requirements of `O` and `P`, and `T` declares adoption of 
`P` subject to conditions *C*, `T` also must delcare adoption of `O` 
subject to conditions that are a superset of *C*, otherwise the program is
ill-formed.

```swift
protocol O {}

protocol P: O {}

struct S<T> {}
extension S: P where T: SignedNumeric {}
extension S: O where T: Numeric {} // SignedNumeric refines Numeric
// T: SignedNumeric ⊆ T: Numeric

struct X<T> {}
extension S: P, O where T == Int {}
// T == Int ⊆ T == Int

struct Y<T>: O {}
extension Y: P where T: Equatable {}
// T: Equatable ⊆ universal set
```

<p class="draft item"> </p>
Where all members of a tuple type adopt a standard library protocol of 
`Equatable`, `Hashable` or `Comparable`, the tuple type implicitly adopts such 
protocol, and the conformance of the tuple type to the requirements of such
protocol is synthesized. 

In the following example, since `Int: Equatable` and `String: Equatable`, 
`(Int, String)` implicitly adopts `Equatable`, and 
`static func ==(lhs:rhs:)` is synthized for `(Int, String)`.

```swift
let b: (Int, String) = (1, "one")
b == (1, "one") // true
```

In the following example, since both `Int` and `String` conform
to `Comparable`, the tuple type `(Int, String)` implicitly adopts `Comparable`, 
and `static func <(lhs:rhs:)` is synthesized. The standard library's 
`Sequence` protocol conditionally declares a `sorted()` method 
where the `Element` type of a conforming type conforms to `Comparable` (the 
`sorted()` method depends upon the availability of the `<` operator).
Since `(Int, String)` implicitly adopts `Comparable` and is the `Element` type of 
`Array<(Int, String)>`, which conforms to `Sequence`, `Array<(Int, String)>` 
makes the `sorted()`method available.

```swift
var a: [(Int, String)] = [(2, "two"), (1, "one")]
print(a.sorted()) // "(1, "one"), (2, "two")"
```

### Conformance
---

A protocol **conformance** of type `T` to protocol `P` is a triple 
(`T`, `P`, _M_), where _M_ is a mapping from each requirement _r_ of `P` 
onto a corresponding **witness** that satisfies _r_ for `T`.

|-|-|
| Requirement | Witness |
|-|-|
| `associatedtype` | concrete type in the scope of `T` |
| `var` | instance property of `T` |
| `static var` | `static` or `class` property of `T`, or also, where `T` is an `enum`, an `enum` case |
| `func` | instance method of `T` |
| `static func` | `static` or `class` method of `T`, or also, where `T` is an `enum`, an `enum` case, or also, where the function name is an operator, a concrete module-scope operator function |
| `subscript` | instance subscript of `T` |
| `static subscript` | `static` or `class` subscript of `T` |
| `init` | initializer of `T` |

This section describes how a conformance's mapping from requirements to 
witnesses is determined.

#### Witness

<p class="draft item"> </p>
Where _r_ is a requirement of a protocol `P` and a type `T` adopts `P`, 
the **witness** of _r_ for `T: P` is the property, method, function, enum case, 
type, subscript or initializer that serves as `T`'s implementation of _r_.  

<p class="draft item"> </p>
For a given requirement of a conformance, the identity of the witness for such
requirement is immutable.

<p class="draft item"> </p>   
Where _r_ is a requirement of a protocol `P`, a type `T` adopts `P`, and a 
given property, method, enum case, type, subscript or initializer of
`T` **satisfies** _r_, such property, method, enum case, type, 
subscript or initializer is an implementation of _r_, and is eligible to be the
witness for _r_.

<p class="draft item"> </p> 
Where _r_ is a `static func` requirement of a protocol `P`, the 
[function-name](#function-name) of _r_ is an [operator](#operator), a type `T` 
adopts `P`, and in the scope in which `T` adopts `P` there exists a concrete 
module-scope operator function _f_ that **satisfies** _r_, _f_ is an 
implementation of _r_, and is eligible to be the witness for _r_.

```swift
func <(lhs: G1, rhs: G1) -> G1 { G1() }

protocol G { static func <(lhs: Self, rhs: Self) -> Self }

struct G1: G {}
```

<p class="draft item"> </p> 
Where _r_ is a requirement of a protocol `P`, and a type `T` adopts `P`, there
may exist more then implemenation of _r_ eligible to be the witness for _r_.

<p class="draft item"> </p> 
Where _r_ is a requirement of a protocol `P`, a type `T` adopts `P`, and
there exists one and only one implemenation of _r_ eligible to be the witness 
for _r_, such implementation is the witness for _r_.

<p class="draft item"> </p> 
Where _r_ is a requirement of a protocol `P`, a type `T` adopts `P`, and
there exists more than one implemenation of _r_ eligible to be the witness 
for _r_, the implementation that is the witness for _r_
is determined according to the criteria in _________.






#### Visible

In a given scope, the sources from which a type `T` may provide a an 
implementation of a requirement _r_ of a protocol `P`include: 
[refine to deal with visibility and access control levels]
  1. the members of the declaration of `T`;
  1. the members of any extension of `T`;
  1. the members of any visible extension of any protocol explicitly or 
  implicitly adopted by `T`;
  1. where `T` is a class, the members of the declaration of `T`, or any 
  extension, of any superclass of `T`;
  1. where _r_ is a `func` requirement with an operator as the function name,
a concrete module-scope operator function; or
  1. where applicable to `T: P`, a compiler-synthesized member of `T`;
  1. [others?]




A type `T` satisfies an `associatedtype` requirement _r_ of a protocol `P`
where, in the scope in which `T` adopts `P`,  



A. declared as:
  1. a member of the declaration of `T`;
  1. a member of an extension of `T`;
  1. a member of an extension of any protocol explicitly or implicitly adopted 
by `T`;
  1. where `T` is a class, a member of the declaration, or any extension, of any 
superclass of `T`;
  1. where _r_ is a `func` requirement with an operator as the function name,
a concrete module-scope operator function; or
  1. where applicable to `T: P`, a compiler-synthesized member of `T`; or

B. where _r_ is an `associatedtype`, a type that is declared in `T` (or an 
extension of `T`) to be the _____ of a `typealias` for the name of 
the `associatedtype`; or

C. where _r_ is an `associatedtype` and another requirement of `P` uses the 
name of the `associatedtype` as the type in a:
  1. [type-annotation](#type-annotation) of a 
[protocol-property-declaration](#protocol-property-declaration), or

  1. [type-annotation](#type-annotation) of a [parameter](#parameter) of a 
[function-signature] of a 
[protocol-method-declaration](#protocol-method-declaration), or
  1. [type](#type) of a [function-result] of a
[protocol-method-declaration](#protocol-method-declaration), or
  1. [type-annotation](#type-annotation) of a [parameter](#parameter) of a 
[protocol-method-declaration](#protocol-method-declaration), or
  1. [type](#type) of a [type-identifier] of a [generic-parameter] of a 
[protocol-method-declaration](#protocol-method-declaration), or
  1. [type](#type) of a [type-identifier] of a [requirement](#requirement) of a 
[generic-where-clause](#generic-where-clause) of a 
[protocol-method-declaration](#protocol-method-declaration), or

  1. [type-annotation](#type-annotation) of a [parameter](#parameter) of a 
[subscript-head](#subscript-head) of a [protocol-subscript-declaration], or
  1. [type](#type) of a [subscript-result](#subscript-result) of a 
[protocol-subscript-declaration], or
  1. vvv





a return type, a parameter type or generic-parameter-type

inferred to satisfy the `associatedtype` requirement by virtue of `T`'s
witness for another requirement of `P`, 
type of a return type, a parameter type or generic-parameter-type

used in 






#### Satisfaction of Requirements

<p class="draft item"> </p>
In certain cases, the adoption by a type of a protocol will result in synthesis 
of a  witness for a requirement of the protocol, if a witness is not otherwise
available for the requirement.  [list the cases of synthesis...]



<p class="draft item"> </p>
In a given scope, a concrete type `T` **conforms** to a protocol `P` if and 
only if:
- `T` is a nominal type and the conformance is implied [<-- link to section on how this implication is
  determined] by a
  *[type-inheritance-clause](https://docs.swift.org/swift-book/ReferenceManual/Types.html#grammar_type-inheritance-clause)* 
  visible in that scope.
- `T` is is a non-nominal type that implicitly conforms to `P` as described in [section dealing
  with tuples].

A protocol **conformance** of `T` to `P` is a triple (`T`, `P`, *M*), where *M* is a mapping from
each requirement *r* of `P` onto a corresponding **witness** that satisfies [<--link to requirement satisfaction] *r* for `T`.   


#### Creation of a Conformance

<p class="draft item"> </p>
Where a nominal or non-nominal concrete type `T` adopts a protocol `P`, 
a conformance is created for `X: P`.

<p class="draft item"> </p>
Where a generic type declares adoption of a protocol `P`,
the generic type itself does not adopt `P`, and
thus no conformance is created.

<p class="draft item"> </p>
Where a generic type `X` is declared to adopt a protocol `P` and 
a [concretization](#concretization) of `X<T>` is formed, 
`X<T>` adopts `P`, and
thus a conformance is created for `X<T>: P`.

<p class="draft item"> </p>
The mapping _M_ from each requirement _r_ of `P` 
to a corresponding witness that [satisfies](#satisfaction) _r_ for `T`
is inferred 
from the set of implementations eligible to be the witness for _r_
in the scope in which `T` adopts `P`.
A declaration 
cannot affirmatively be designated 
as expressly being _the_ witness 
for a requirement. 



A declaration that `T` conforms to `P` further constitutes, with respect to each protocol `O`*<sub>i</sub>* which 
`P` refines, a declaration that `T` conforms to `O`*<sub>i</sub>*.  Thus, for the declaration of `T: P` to be 
valid, the implicit declarations of each `T: O`*<sub>i</sub>* must be valid.  For each conformance `T: O`*<sub>i</sub>*, 
a distinct set of protocol witnesses is established. 

A type `T` cannot be declared to conform to a protocol `P` if, within the visible scope, another declaration 
exists of `T: P`.  This rule holds true even where competing declarations are conditional with disjoint conditions.  
In a given scope, a type can conform to a protocol in only one way.


#### Selection of Witness from Multiple Eligible Implementations

<p class="draft item"> </p>
Given `T: P` and a requirement _r_ of `P`, 
the witness for _r_ of `T: P` is the **most specialized** implementation
among the eligible implementations for _r_ of `T: P`,
as determined in the scope in which `T` adopts `P`.

#### Most Specialized Implementation
Among a type's implementations of a requirement, 
the most specialized implementation 
will serve as the witness for the requirement.

<p class="draft item"> </p>
If two implementations of a requirement 
are eligible to be the witness for the requirement, 
the rules stated in this subsection 
determine which implementation is the most specialized and
thus is the witness for the requirement.
If more than two implementations of a requirement are eligible, 
the implementations are paired and compared iteratively, 
using these rules until the most specialized implementation is determined.


<p class="draft item"> </p>
Where `T` adopts `P`, 
_r_ is a requirment of `P`, and 
_i1_ and _i2_ both are eligible implementations for _r_ of `T: P`,
_i1_ will not be the witness for _r_ of `T: P` 
if any of the followng conditions exist:

1. **special cases**:
    1. **_i1_ constrained in generic context**: 
type `T` is a [concretization](#concretization), 
type `G` is the generic type from which `T` is formed, and 
the declaration of _i1_ is more [constrained](#constrained) 
than the declaration of the [adoption](#adoption) `P` on `G`; 
    1. **_i1_ free operator func vs. _i2_ static/class operator method**:
... ;
    1. **_i1_ static/class method vs. _i2_ enum case with associated value(s)**:
... ;

1. **_i1_ on protocol vs. _i2_ on type**: 
_i1_ is declared in an [extension of a protocol](#extension) 
(whether `P` or another protocol adopted by `T`) and 
_i2_ is declared on `T` or a superclass of `T` 
(whether in the type's declaration or an extension of the type);

1. **declared on a protocol vs. refinement of the protocol**:
_i1_ is declared in an extension of `P` and 
_i2_ is declared in an extension of a protocol that refines `P`; and

1. **both declared on same type or protocol with differing constraints**:
_i1_ and _i2_ are both declared 
on the same protocol or on the same concrete type 
and the declaration of _i1_ 
is less constrained than 
the declaration of _i2_.

Where none of the preceding cases apply, it is ambiguous 
whether _i1_ will be the witness for _r_ of `T: P`. The cases in which 
ambiguity results, include, for example:
- _i1_ is declared in an extension of one protocol,
_i2_ is delcared in an extension of another protocol, and
neither protocol refines the other protocol;
- _i1_ and _i2_ are both declared on the same type or the same protocol
with disjoint conditions; **[is this even possible???]**
- ...

<p class="draft item"> </p>
The following example demonstrates conditon 2: the case where 
one implementation is declared in an extension of a protocol 
and another implementation is declared on the adopting type.
For the requirement _r_ of `S: P`, 
`S` has two eligible implementations: 
_i1_ declared in an extension of `P`, and 
_i2_ declared in the declaration of `S`.
Thus, _i1_ cannot be the witness, 
so _i2_ is the witness for *r* of `S: P`.  

```swift
protocol P { 
  var id: String { get } // (r)
}
extension P { 
  var id: String { "P" } // (i1)
} 

struct S {
  var id: String { "S" } // (i2)  <<< witness
}
extension S: P {}
```

<p class="draft item"> </p>
The following example demonstrates condition 3: the case where
one implementation is declared on a protocol and 
a second implementation is declated on a protocol that 
is refined by the first protocol. 
`S: P` has two eligible implementations 
of the requirement _r_ of protocol `P`.
Implementation _i1_ is declared in an extension of `P`, and 
implementation _i2_ declared in an extension of protocol `Q`. 
Since `Q` refines `P`, *i1* will not be the witness.
Thus, _i2_ is the witness for _r_ of `S: P`.
This result holds true even if 
the implementation on the less-refined protocol 
is more constrained than 
the implementation on the more-refined protocol.

```swift
protocol P {
  var id: String { get } // (r)
  associatedtype V
}
extension P where V: Numeric { // constrained
  var id: String { "P" } // (i1)
}

protocol Q: P {} //
extension Q {  // unconstrained
  var id: String { "Q_Numeric" } // (i2)
}

func getId<T: P>(of t: T) -> String {
  t.id
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

<p class="draft item"> </p>
[... add [synthesized conforamce]
(https://docs.swift.org/swift-book/LanguageGuide/Protocols.html#ID627) 
to Equatable, Hashable and Comparable]

<p class="draft item"> </p>
[... add synthesized memberwise initializer being available as witness]

<p class="draft item"> </p>
[... synth of allCases where CaseIterable present]





### References
---
1. *The Swift Programming Language*, [Guide: Protocols](https://docs.swift.org/swift-book/LanguageGuide/Protocols.html)
1. *The Swift Programming Language*, [Protocol Declaration](https://docs.swift.org/swift-book/ReferenceManual/Declarations.html#ID369)
1. Swift Evolution Repository, [SE-0011: Replace typealias keyword with associatedtype for associated type declarations](https://github.com/apple/swift-evolution/blob/master/proposals/0011-replace-typealias-associated.md)
1. Swift Evolution Repository, [SE-0070: Make Optional Requirements Objective-C-only](https://github.com/apple/swift-evolution/blob/master/proposals/0070-optional-requirements.md)
1. Swift Evolution Repository, [SE-0091: Improving operator requirements in protocols](https://github.com/apple/swift-evolution/blob/master/proposals/0091-improving-operators-in-protocols.md)
1. Swift Evolution Repository, [SE-0092: Typealiases in protocols and protocol extensions](https://github.com/apple/swift-evolution/blob/master/proposals/0092-typealiases-in-protocols.md)
1. Swift Evolution Repository, [SE-0095: Replace protocol\<P1,P2> syntax with P1 & P2 syntax](https://github.com/apple/swift-evolution/blob/master/proposals/0095-any-as-existential.md)
1. Swift Evolution Repository, [SE-0142: Permit where clauses to constrain associated types](https://github.com/apple/swift-evolution/blob/master/proposals/0142-associated-types-constraints.md)
1. Swift Evolution Repository, [SE-0143: Conditional Conformances](https://github.com/apple/swift-evolution/blob/master/proposals/0143-conditional-conformances.md)
1. Swift Evolution Repository, [SE-0156: Class and Subtype existentials](https://github.com/apple/swift-evolution/blob/master/proposals/0156-subclass-existentials.md)
1. Swift Evolution Repository, [SE-0157: Support recursive constraints on associated types](https://github.com/apple/swift-evolution/blob/master/proposals/0157-recursive-protocol-constraints.md)
1. Swift Evolution Repository, [SE-0164: Remove final support in protocol extensions](https://github.com/apple/swift-evolution/blob/master/proposals/0164-remove-final-support-in-protocol-extensions.md)
1. Swift Evolution Repository, [SE-0185: Synthesizing Equatable and Hashable conformance](https://github.com/apple/swift-evolution/blob/master/proposals/0185-synthesize-equatable-hashable.md)
1. Swift Evolution Repository, [SE-0186: Remove ownership keyword support in protocols](https://github.com/apple/swift-evolution/blob/master/proposals/0186-remove-ownership-keyword-support-in-protocols.md)
1. Swift Evolution Repository, [SE-0266: Synthesized Comparable conformance for enum types](https://github.com/apple/swift-evolution/blob/master/proposals/0266-synthesized-comparable-for-enumerations.md)
1. Swift Evolution Repository, [SE-0280: Enum cases as protocol witnesses](https://github.com/apple/swift-evolution/blob/master/proposals/0280-enum-cases-as-protocol-witnesses.md)
1. Swift Evolution Repository, [SE-0283: Tuples Conform to Equatable, Comparable, and Hashable](https://github.com/apple/swift-evolution/blob/master/proposals/0283-tuples-are-equatable-comparable-hashable.md)
1. Suyash Srijan, [Protocol Witness Matching Mini-Manifesto](https://forums.swift.org/t/protocol-witness-matching-mini-manifesto/32752)


### Temporary Link Targets
---
Links to be revised to instead point to grammar in other chapters:
<ul>
  <li id="identifier">identifier</li>
  <li id="type">type</li> 
  <li id="attributes">attributes</li>  
  <li id="access-level-modifier">access-level-modifier</li>
  <li id="type-identifier">type-identifier</li>
  <li id="generic-where-clause">generic-where-clause</li>
  <li id="compiler-control-statement">compiler-control-statement</li>
  <li id="typealias-name">typealias-name</li>
  <li id="declaration-modifiers">declaration-modifiers</li>
  <li id="parameter-clause">parameter-clause</li>
  <li id="generic-parameter-clause">generic-parameter-clause</li>
  <li id="subscript-head">subscript-head</li>
  <li id="subscript-result">subscript-result</li>
  <li id="function-head">function-head</li>
  <li id="function-name">function-name</li>
  <li id="function-signature">function-signature</li>
  <li id="initializer-head">initializer-head</li>
  <li id="getter-setter-keyword-block">parameter-clause</li>
  <li id="constant-declaration">constant-declaration</li>
  <li id="variable-declaration">variable-declaration</li>
  <li id="typealias-name">typealias-name</li>
  <li id="union-value-style-enum-case">union-value-style-enum-case</li>
  <li id="tuple-type">tuple-type</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
</ul>

Links to be revised to instead point to concepts in other chapters:
<ul>
  <li id="associated values">associated values</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
  <li id="xxx">xxx</li>
</ul>

Link to concept to be included in generics chapter:

<a id="concretization"></a>
>***Concretization of a Generic Type**
>A concretization of a generic type 
is a specialized version of the generic type 
formed by replacing the generic type's type parameters 
with concrete type arguments.  A generic type may specify that 
its concretizations will adopt, or conditionally may adopt, 
one or more protocols, 
which establishes a pattern for protocol adoption.
When a concretization is formed, 
its protocol conformances are determined by that pattern.*


<head>
  <!--
  This local style sheet is being used to experiment with refinements to the 
  css for the site. Successful styles will be moved to appropriate files, and 
  this style sheet will be discarded. 
  -->
  <style type="text/css">
    /* provide for better vertical spacing (around paragrpahs) */
    p {
      margin-block-start: 1em;
      margin-block-end: auto;
    }
    /* provide for better vertical spacing (above lists) */
    ul {
      margin-block-start: 0em;
      margin-block-end: 0em;
    }
    /* provide for better vertical spacing (above list items) */
    li {
      margin-top: 0.5em;
    }
    /* provide for better vertical spacing (above headers) */
    h3, h4, h5, h6 {
      margin-top: 1em;
    }
    /* provide for better vertical spacing (above code block) */
    .language-swift {
      margin-top: 1.0em;
    }

    /* adjustment to get numbering to align correctly */
    .item {
      height: 0.3em;
    }

    /* overall widening */
    .wrapper {
      width: 1060px;
    }
    /* widening the text */
    section {
      width: 700px;
    }

    /* adjusting font sizes of headers */
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
    }

    /* visually distinguish between finalled text vs. draft text */
    .draft.item {
      color: red;
    }
    .draft.item:before {
      content: "" counter(item);
      counter-increment: item;
    }

    /* a styled note */
    .note {
      margin-left: 20px;
      font-style: italic;
      font-size: 0.8em;
    }
    .note:before {
      content: "Note: ";
    }

    /* a styled comment */
    .comment {
      margin-left: 20px;
      font-style: italic;
      font-size: 0.8em;
    }
    .comment:before {
      content: "Comment: ";
    }

    /* reduce size of inline code */
    p>code {
      font-size: 1.0em;
    }
  </style>
</head>

