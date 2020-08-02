---
---

## Protocols 

<p class="draft item"> </p>
A protocol is a set of [requirements](#declaration-of-protocol-requirements) enabling a uniform means of 
accessing functionality on adopting types. A class, structure or 
enumeration satisfying the requirements of a protocol may [adopt](#adoption) a 
protocol, in which case, the type may be accessed through its 
[conformance](#conformance) to the protocol.  A type's conformance to a protocol
consists of one [witness](#witness) for each requirement.  A type adopting a 
protocol may gain default and other functionality via [extensions](#protocol extension) 
of the protocol. Protocols may be declared in a hierarchy, with one protocol 
being a [refinement](#refinement) of another protocol.


### Declaration of Protocol
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
[protocol typealias declaration]

<p class="draft item"> </p>
[generic where clause versus typealias declaration]

<p class="draft item"> </p>
[role of Self and self]

### Protocol Extension
---
This section concerns protocol extensions.

<div class="admonition grammar">
  <p class="admonition-title">Grammar of a protocol extension declaration</p>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="extension-declaration">extension-declaration</span>
      <span class="arrow"> → </span> 
      <a href="#attributes">attributes</a><sub class="loosen">opt</sub>
      <a href="#access-level-modifier">
      access-level-modifier</a><sub class="loosen">opt</sub>
      <code>static</code><sub>opt</sub>
      <code>extension</code>
      <a href="#protocol-name">type-identifier</a>
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
      <a href="#protocol-body">extension-body</a>
    </p>
  </div>
  <div class="syntax-group">
    <p class="syntax-def">
      <span class="name" id="extension-body">extension-body</span>
      <span class="arrow"> → </span>
      <code>{</code>
      <a href="#extension-members">extension-members</a><sub class="loosen">opt</sub>
      <code>}</code>
    </p>
    <p class="syntax-def">
      <span class="name" id="extension-members">extension-members</span>
      <span class="arrow"> → </span>
      <a href="#extension-member">extension-member</a>
      <a href="#extension-members">extension-members</a><sub class="loosen">opt</sub>
    </p>
    <p class="syntax-def">
      <span class="name" id="extension-member">extension-member</span>
      <span class="arrow"> → </span>
      <a href="#declaration">declaration</a>
      |
      <a href="#compiler-control-statement">compiler-control-statement</a><sub class="loosen">opt</sub>
      <code>}</code>
    </p>
  </div>
</div>

<p class="draft item"> </p>
A protocol extension serves two purposes:
(1) the declaration of 
default implementations 
of protocol requirements; and
(2) the declaration of arbitrary functionality.

<p class="draft item"> </p>
While a protocol extension 
is referred to 
as a "protocol extension," 
it does not extend a protocol, and 
so does not add requirements to a protocol.
Rather, an extension of a protocol acts
as an extension 
of each nominal concrete type
that adopts the protocol.

<p class="draft item"> </p>
A member of a protocol extension 
is not a member of 
the protocol with which the extension is associated.
However, the members of 
the protocol with which the extension is associated
(i.e., the requirements of the protocol)
are available within the extension
as if declared on the same type.

<p class="draft item"> </p>
[applicable attributes]

<p class="draft item"> </p>
[role of [access level modifier](#access-level-modifier)]

<p class="draft item"> </p>
A [type-inheritance-clause](#type-inheritance-clause) 
is not permitted
as part of the declaration 
of a protocol extension.

<p class="draft item"> </p>
The members of a protocol extension 
are not 
[protocol-members](#protcol-members).

<p class="draft item"> </p>
The `class` keyword 
is not permitted on declarations 
in a protocol extension.

### Declaration of Protocol Requirements
---
This section discusses 
(protocol) requirements, 
how each is declared, and 
the types of declarations 
that may satisfy each requirement.

<p class="draft item"> </p>
A **requirement** is 
a statement 
in the declaration of a protocol
describing criteria
that a type must satisy
in order to be able
to adopt the protocol. 

<p class="draft item"> </p>
There are five types of protocol requirements:
* `associatedtype`
* `var`
* `func` 
* `subscript`
* `init`

<p class="draft item"> </p>
A requirement is a customization point
for types adopting a protocol.
Each type adopting a protocol
may declare its own implementation
of a requirement of the protocol.

<p class="draft item"> </p>
[Which attributes, if any, 
are applicable to a requirement declaration?] 

<p class="draft item"> </p>
On the declaration of a protocol requirement,
an [access-level-modifier](#access-level-modifier) is not permitted.
<p class="note">This statement is contrary
to the official grammar.
For example, see the grammar
of a protocol-associated-type-declaration.</p> 

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
An `associatedtype` requirement of a protocol
establishes a typealias-name.
A type adopting the protocol must 
either
(a) expressly map the typealias-name to a type 
via declaration of a `typealias`,
or
(b) implicitly map the typealias-name to a type 
via usage.

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

<p class="draft item"> </p>
**Satisfaction by Typealias**:
Where a protocol `P` declares an `associatedtype` requirement _r_
and type `T` adopts `P`,
_r_ may be satisfied
by a declaration visible on `T`
of a `typealias`
with the same typealias-name as the typealias-name of _r_
and 
with the [type(#type)] 
of the [type-assignment](#type-assignment) 
of the `typealias`
satisfying the conditions established collectively 
by the [type-inheritance-clause](#type-inheritance-clause), 
[typealias-assignment](#typealias-assignment) 
and/or [generic-where-clause](#generic-where-clause)
of _r_.

<p class="draft item"> </p>
**Satisfaction Inferred from Usage**:
Where a protocol `P` declares an `associatedtype` requirement _r_
and type `T` adopts `P`,
_r_ may be satisfied
by inference of a [type](#type) as a witness for _r_,
with the inference being taken from
the substitution of the type 
in place of the typealias-name of _r_
within the declaration of a witness
for another requirement of `P`.
The inference behavior 
of the current implementation of Swift 
is not comprehensive.
There exist cases in which inference is logically possible,
but Swift does not infer 
the witness for an `associatedtype` requirement.


<p class="draft item"> </p>


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
      <a href="#generic-where-clause">
      generic-where-clause</a><sub class="loosen">opt</sub>
    </p>
  </div>
</div>

<p class="draft item"> </p>
[what it is]

<p class="draft item"> </p>
[role of attributes in function-head]

<p class="draft item"> </p>
[role of declaration-modifiers in function-head]

<p class="draft item"> </p>
[role of generic where clause]

<p class="draft item"> </p>
Where the optional [generic where clause](#generic-where-clause)
of a protocol method declaration
constrains the type alias 
of an `associatedtype` requirement of the protocol,
the effect 
is not to constrain the applicability 
of the protocol method requirement,
but rather 
indirectly constrains the `associatedtype` requirement
so that adoption of the protocol
is not possible
unless the type satisfying the `associatedtype` requirement
is so constrained.  
The following example demonstrates this effect.

```swift
protocol P {
    associatedtype V // (r1)
    func id<T>() -> T where T == V, V: Numeric // (r2)
}

struct W: P { // no witness present for r2; program is ill-formed
    typealias V = String
}

struct X: P { // no witness present for r2; program is ill-formed
    typealias V = String
    func id() -> Int { 2 } // Int: Numeric, but Int != V
}

struct Y: P { // no witness present for r2; program is ill-formed
    typealias V = String
    func id() -> String { 2 } // String == V, but String is not Numeric
}

struct Z: P {  // valid
    typealias V = Double
    func id() -> Int { 2 } // Double: Numeric, Double == V
}
```

<p class="draft item"> </p>
[operator can be satisfied by free function]

<p class="draft item"> </p>
[declarations that satisfy the requirement]

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

<p class="draft item"> </p>
[declarations that satisfy the requirement]

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

<p class="draft item"> </p>
[declarations that satisfy the requirement]

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

<p class="note"> </p>
A member of a protocol `O` refined by a protcol `P` 
does not become a member of protocol `O`.
Thus, the set of requirements of `O` 
are not part of set of requirements of `P`.
Nevertheless, in order for a type to adopt `P`,
the type must satisfy the requirements of `O`.

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

### Adoption
---
This section concerns the adoption of a protocol by a type.

<p class="draft item"> </p>
In a given scope, 
a concrete type `T` 
**adopts** 
a protocol `P` 
if and only if:
- `T` is a nominal type and 
the adoption is implied by a
[type-inheritance-clause](#type-inheritance-clause)
visible in that scope; or
- `T` is a non-nominal type 
that [implicitly conforms](#tuple-implicit-adoption) 
to `P` in that scope.

#### Adoption by Types Satisfying Requirements

<p class="draft item"> </p>
Any struct, enum or class [satisfying](#conformance) the requirements of a 
protocol may be declared to adopt the protocol.

<p class="draft item"> </p>
Types other than structs, enums and classes cannot be _declared_ to adopt a 
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
is declared to unconditionally adopt a protocol `P`, 
a concretization of `X` 
adopts `P`. 

<p class="draft item"> </p>
Where a generic type `X` 
is declared to conditionally adopt a protocol `P`, 
a concretization of `X` 
that satisfies the condition
adopts `P`. 

<p class="draft item"> </p>
Where type `T` [satisfies](#conformance) the requirements of protocol `P`, `T` 
may unconditionally adopt `P` by including a `: P` 
[type  inheritance clause](#type-inheritance-clause) in the declaration of `T` 
or in any extension of `T`.

```swift
protocol P { var a: Int { get } } // requirement r

struct S: P { var a: Int { 42 } } // r satisfied; adoption declared

class C { let a: Int } // r satisfied
extension C: P {} // adoption declared

enum E {}
extension E: P { var a: Int { 42 } } // r satisfied; adoption declared
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
Where a protocol `P` [refines](#refinement) a protocol `O` and 
type `T` is declared to adopt `P`, 
`T` must [satisfy](#conformance) 
the requirements of both `P` and `O`,
otherwise the program is ill-formed.

```swift
protocol O { var a: Int { get } } // requirement r

protocol P: O {}

struct S {} // r not satisfied
extension S: P {} // error: struct S does not conform to protocol O
```

<p class="draft item"> </p>
Where a protocol `P` [refines](#refinement) a protocol `O`, 
a type `T` [satisfies](#conformance) the requirements of `O` and `P`, and 
`T` unconditionally is declared to adopt `P`, 
`T` implicilty adopts `O` unconditionally.

```swift
protocol O { var a: Int { get } } // requirement r

protocol P: O {}

struct S { var a: Int { 1 } } // r satisfied
extension S: P {} // adoption of P declared; adoption of O implied
```

<p class="draft item"> </p>
Where a protocol `P` refines a protocol `O`, type `T` [satisfies](#conformance) 
the requirements of `O` and `P`, and `T` declares adoption of 
`P` subject to conditions _c_, `T` also must delcare adoption of `O` 
subject to conditions that are a superset of _c_, otherwise the program is
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

<p class="draft item" id="tuple-implicit-adoption"> </p>
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

<p class="draft item"> </p>
Where two express declarations of
a type `T` adopting a protocol `P`
exist in the same scope,
the program is ill-formed.
This prohibition on multiple express declarations of adoption
holds true even where competing declarations 
are conditional with disjoint conditions. 

<p class="draft item"> </p>
Where a protocol `P` refines a protocol `O` and
a type `T` expressly declares adoption of `P`,
`T` also may expressly declare adoption of `O`
so long as the condition on the adoption of `O`
is a superset of the condition on the adoption of `P`.

#### Declared Adoption with Synthesized Witness

<p class="draft item"> </p>
[opt-in synthesis of Equatable for struct
where all stored properties, if any,
conform to `Equatable`]

<p class="draft item"> </p>
[opt-in synthesis of Hashable for struct
where all stored properties, if any,
conform to `Hashable`]

<p class="draft item"> </p>
[opt-in synthesis of Equatable for enum
where all associated values, if any,
conform to `Equatable`]

<p class="draft item"> </p>
[opt-in synthesis of Hashable for enum
where all associated values, if any,
conform to `Hashable`]

<p class="draft item"> </p>
[opt-in synthesis of Comparable for enum
where all associated values, if any,
conform to Comparable]

<p class="draft item"> </p>
[opt-in synthesis of CaseIterable for enum]

#### Automatic Adoption with Synthesized Witness

<p class="draft item"> </p>
[automatic adoption and synthesis of Equatable and Hashable for
enum without associated values where the rawValue type is Equatable/Hashable] 

<p class="draft item"> </p>
[automatic adoption and synthesis of Equatable, Hashable and/or Comparable
for tuple types where all types in the tuple type conform to the same.] 

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

<p class="draft item"> </p>
In a given scope, 
a type can conform to a protocol in only one way
(i.e., one and only one conformance exists for an adoption).

#### Witness

<p class="draft item"> </p>
Where _r_ is a requirement of a protocol `P` and 
a type `T` adopts `P`, 
the **witness** of _r_ for the conformance `T: P` 
is 
the property, method, function, enum case, type, subscript or initializer 
that serves as 
`T`'s implementation of _r_.  

<p class="draft item"> </p>
For a given requirement of a conformance, 
the identity of the witness for such requirement 
is immutable.

<p class="draft item"> </p>   
Where _r_ is a requirement of a protocol `P`, 
a type `T` adopts `P`, and 
a given 
property, method, enum case, type, subscript or initializer of `T` 
**satisfies** _r_, 
such property, method, enum case, type, subscript or initializer 
is a possible implementation of _r_, and 
is eligible to be the witness for _r_.

<p class="draft item"> </p> 
Where _r_ 
is a `static func` requirement 
of a protocol `P`, 
the [function-name](#function-name) of _r_ 
is an [operator](#operator), 
a type `T` adopts `P`, and 
in the scope in which `T` adopts `P` 
there exists a concrete module-scope operator function _f_ 
that **satisfies** _r_, 
_f_ is an implementation of _r_, and 
is eligible to be 
the witness for _r_.

```swift
func <(lhs: G1, rhs: G1) -> G1 { G1() }

protocol G { static func <(lhs: Self, rhs: Self) -> Self }

struct G1: G {}
```

<p class="draft item"> </p> 
Where _r_ is a requirement of a protocol `P`, and 
a type `T` adopts `P`, 
there may exist more than one possible implemenation of _r_ 
eligible to be the witness for _r_.

<p class="draft item"> </p> 
Where _r_ is a requirement of a protocol `P`, 
a type `T` adopts `P`, and
there exists 
only one possible implemenation of _r_ 
eligible to be the witness for _r_, 
such implementation is the witness for _r_.

<p class="draft item"> </p> 
Where _r_ is a requirement of a protocol `P`, 
a type `T` adopts `P`, and
there exists more than one possible implemenation of _r_ 
eligible to be the witness for _r_, 
the implementation that is the witness for _r_
is the [most specialized](#most-specialized) 
of such implementations.

#### Possible Implementations of a Requirement

<p class="draft item"> </p>
In the scope in which a type `T` adopts a protocol `P`,
the sources from which `T` may provide 
a possible implementation of a requirement _r_ of `P`
include declarations
(subject to an [access level](#access-level-modifier) 
no more restrictive
than the access level of `P`) 
that are stated within: 

  1. the declaration of `T`;
  1. the declaration of any extension of `T`;
  1. the declaration of any extension of `P`; and
  1. the declaration of any extension of any other protocol adopted by `T`.

Additionally:
  1. where `T` is a class, 
  the set of inheritances 
  by `T` from its superclass
  may be available to `T` to satisfy _r_;
  1. where _r_ is a `func` requirement 
  with an operator as the function name,
  a concrete module-scope operator function
  may be available to `T` to satisfy _r_; and
  1. where the adoption of `P` results
  in the synthesis of a conformance,
  the compiler-synthesized method
  is available to `T` to satisfy _r_.

#### Creation of a Conformance

<p class="draft item"> </p>
Where a nominal or non-nominal concrete type `T` adopts a protocol `P`, 
a conformance is created for `X: P`.

<p class="draft item"> </p>
Where a generic type declares adoption of a protocol `P`,
the generic type itself does not adopt `P`, and
thus no conformance is created.  **[is this accurate?]**

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

<p class="draft item"> </p> 
Where a type `T` adopts a protocol `P` and 
`P` refines a protocol `O`,
a conformance is created for both `X: P` and `X: O`.
The requirements of `O` are assigned witnesses
as part of the `X: O` conformance, and
the requirements of `P` are assgined witnesses
as part of the `X: P` conformance.

```swift
protocol O { var a: Int { getter } } // r1

protocol P { var b : String { getter } } // r2

struct S: P {
    var a: Int { 1 }  // witness for r1,
                      // which is part of conformance for X: O

    var b: String { "2" } // witness for r2,
                          // which is part of conformance for X: P
}
```

#### Most Specialized

<p class="draft item"> </p>
Given `T: P` and a requirement _r_ of `P`, 
the witness for _r_ of `T: P` is the **most specialized** implementation
among the possible implementations for _r_ of `T: P`,
as determined in the scope in which `T` adopts `P`.

<p class="draft item"> </p>
Where only one possible implementation exists for a requirement,
that possible implementation is the most specialized, and
thus is the witness for the requirement.

<p class="draft item"> </p>
Where exactly two possible implementations exist for a requirement, 
one of the possible implementations 
satsifies any one of
[the Less-Specialized Conditions](#less-specialized-condtions) and
the other possible implementation 
does not satisfy any of 
the Less-Specialized Conditions,
the latter implementation is more specialized than
the former implementation, and
thus is the witness for the requirement.
If neither possible implementation
satisfies any of the Less-Specialized Conditions,
it is ambiguous which should be the witness, and
the program is ill-formed.

<p class="draft item"> </p>
Where more than two possible implementations exist for a requirement,
considering all possible implementations in pairs, 
if any pair of the possible implementations is considered, and
one of the possible implementations satsifies any one of
[the Less-Specialized Conditions](#less-specialized-condtions) and
the other possible implementation does not satisfy any of 
the Less-Specialized Conditions,
the latter implementation is more specialized than
the former implementation, and
the former implementation is eliminated
as a possible implementation.
If, after considering all pairs of possible implementations, 
only one possible implementation remains for the requirement,
that possible implementation is the most specialized, and
thus is the witness for the requirement.
If more than one possible implementation remains,
it is ambiguous which should be the witness, and
the program is ill-formed.

<p class="draft item" id="less-specialized-condtions"> </p>
The four conditions stated in this paragraph
are referred to in this Conformance subsection
as the **Less-Specialized Conditions**.
Where a type `T` adopts a protocol `P`, 
_r_ is a requirment of `P`, and
_i1_ and _i2_ both satisfy _r_ and are visbile 
in the scope in which `T` adopts `P`,
_i1_ is not the most specialized implementation 
for _r_ of `T: P` 
if any of the followng conditions exist:

1. **_i1_ declared on protocol while _i2_ declared on adopting type**: 
_i1_ is declared in an [extension of a protocol](#extension) 
(whether `P` or another protocol adopted by `T`) and 
_i2_ is declared on `T` or a superclass of `T` 
(whether in the type's declaration or an extension of the type);

2. **_i1_ declared on a protocol while _i2_ declared on refinement 
of the protocol**:
_i1_ is declared in an extension of `P` and 
_i2_ is declared in an extension of a protocol that refines `P`; and

3. **_i1_ and _i2_ declared on same protocol with _i1_ less constrained**:
_i1_ and _i2_ are both declared 
on the same protocol
and the declaration of _i1_ 
is less constrained than 
the declaration of _i2_.

4. **_i1_ declaration more constrained than 
generic declaration of protocol adoption**: 
type `T` is a [concretization](#concretization), 
type `G` is the generic type from which `T` is formed, and 
the declaration of _i1_ is more [constrained](#constrained) 
than the declaration of the [adoption](#adoption) `P` on `G`; 

The conditions, above, are referred to in this subsection 
by the numbering used, above.
The numbering and captions used in this paragraph are arbitrary, 
and do not have any meaning outside this subsection.

<p class="draft item"> </p>
Where none of the preceding cases apply, it is ambiguous 
whether _i1_ will be the witness for _r_ of `T: P`. The cases in which 
ambiguity results, include, for example:
- _i1_ is declared in an extension of one protocol,
_i2_ is delcared in an extension of another protocol, and
neither protocol refines the other protocol;
- _i1_ and _i2_ are both declared 
in extensions of the same protocol
with disjoint generic-where-conditions;
- _r_ is an operator function requirement;
- **[what others exist?]**

<p class="draft item"> </p>
Where a condition _c1_ 
is a proper subset 
of a condition _c2_ (i.e., _c1_ ⊂ _c2_),
a declaration _d1_ subject to _c1_
is more constrained than 
a declaration _d2_ subject to _c2_.
Declarations are constrained 
by [generic-where-clauses](#generic-where-clause).
Where a declaration is not subject to a generic-where-clause,
it is unconstrained, and
thus cannot be more constrained than another declaration.
Where the conditions to two declarations are disjoint,
it is indeterminate whether one declaration 
is more constrained than the other declaration.

<p class="draft item"> </p>
Condition 4 is due to 
a restriction existing 
in the current implementation of Swift.
Where a generic type `T` 
adopts a protocol `P` 
subject to condition _c1_, 
a requirement _r_ is a member of `P`, and
a member of `T` _i_
that satisfies requirement _r_
is conditionally declared 
subject to condition _c2_,
_i_ is eligible to be a witness for _r_
if and only if 
_c2_ is a superset of _c1_.
Even where _c2_ is satisfied 
by a given concretization of `T`
and thus 
_i_ is a member of the concretization,
_i_ remains ineligible to be a witness for _r_.

<p class="draft item"> </p>
The following example demonstrates condition 1: the case where 
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
The following example demonstrates condition 2: the case where
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

<p class="draft item"> </p>
The following example demonstrates condition 3: the case where
two implementations 
are declared on the same type.
The conformance of `S: P` has two implementations 
of the requirement _r1_ of protocol `P`, 
implementations _i1_ and _i2_. 
While the variable labelled _i3_ also would satisfy _m1_, 
it is not present on `S`, 
because the `P` extension on which it is declared 
is an extension only of types that conform to `P` 
with an implemention of _r2_ that conforms to protocol `StringProtocol`; 
since `S`'s implementation of _r2_ is `Int`, 
which does not conform to  `StringProtocol`, 
the extension containing _i3_ does not extend `S`.
As between the only two implementations of _r1_ available on `S`, 
_i1_ and _i2_, both are declared on `P`.
Since _i1_ is unconstrained and _i2_ is constrained,
_i2_ is more specialized.
Thus, _i2_ is the witness for _r1_ of `S: P`.

```swift
protocol P {
  var id: String { get } // (r1)
  associatedtype V // (r2)
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

struct S: P { // The conformance for `S: P` is [r1:i2, r2:Int]
  typealias V = Int // (i4)
}
```           

<p class="draft item"> </p>
The following example demonstrates condition 4: the case where,
in a generic context,
a constrained implementation of a protocol requirement
is unavailable to be a witness for the requirement 
for the conformance of 
the adoption by a concretization of the protocol
even though 
the concretization satisfies 
the conditions constraining the implementation.
The conformance of `X<Int>: P` 
has two implementations of 
the requirement _r1_ of protocol `P`, _i1_ and _i2_.
The constraint _c2_ on _i2_ 
limits the availability of _i2_ 
to cases in which 
requirement _r2_ 
is performed by 
a witness that conforms to protocol `Numeric`.
Constraint _c2_ is satisfied by `X<Int>`, 
because `Int`, which is `X<Int>`'s implementation of _r2_, 
conforms to `Numeric`.
Thus, _i2_ is available on `X<Int>`, 
and when the `id` property is 
accessed directly on `X<Int>` at _a2_, 
the access is dispatched to _i2_; and 
the value "P_Numeric" is returned.
However, constraint _c2_ on the adoption `X<Int>: P` 
is the universal set (i.e., the conformance is unconstrained).  
Constraint _c2_ is not a superset of the universal set, _c3_.
Consequently, per condition 1.1, 
_i2_ cannot serve as a witness for _r1_ 
in the conformance `X<Int>: P`, and 
so _i1_, as the only implementation 
of _r1_ available for purposes of `X<Int>: P`, 
is the witness for _r1_.
When the `id` property is accessed on `X<Int>: P` 
at _a1_ (or anywhere else), 
_r1_ is the witness, and 
the access is dispatached to _r1_.

```swift
protocol P {
  var id: String { get } // (r1)
  associatedtype V // (r2)
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

<p class="draft item"> </p>
The following example is a demonstration 
of another aspect of condition 4.
This example demonstrates that 
a specialized implementation of a protocol's requirement, 
provided by another protocol that refines the protocol, 
can be unavailable to a conformance 
of a concretization that adopts the protocol
even though the concretization also adopts
the refining protocol that provides the implementation.
Since constraint *c1* on *i2* 
is not a superset 
of constraint *c2* on `X<Int>: P`, 
*i2* cannot serve 
as the witness for _r1_ of `X<Int>: P`. 

```swift
protocol P {
  var id: String { get } // (r1)
  associatedtype V // (r2)
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
Notwithstanding the general inability of concretizations 
to take advantage of specialized implementations, 
the `Collection` family of protocols in the Standard Library 
uses a private attribute 
to gain some access to specialized implementations 
for concretizations of generic types 
conforming to `BidirectionalCollection` and `RandomAccessCollection`.
The private attribute is `@nonoverride`.

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
</ul>

Links to be revised to instead point to concepts in other chapters:
<ul>
  <li id="associated values">associated values</li>
  <li id="synthesized-initializer">synthesized memberwise initializer</li>
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

