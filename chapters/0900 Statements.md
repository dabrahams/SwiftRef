---
---

## Statements

{% comment %}
Author guidance: purely as a way of kickstarting completeness, this chapter
is intended to describe aspects of Swift analogous to what's found in 
[stmt.stmt] of the C++ standard (http://eel.is/c++draft/#stmt.stmt).
{% endcomment %}


<div class="admonition grammar">
	<p class="admonition-title">Grammar of a statement</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="0800 Expressions">expression</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="1000 Declarations">declaration</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#branch-statements">branch-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#loop-statements">loop-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#labeled-statements">labeled-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#control-transfer-statement">control-transfer-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#defer-statement">defer-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#do-statement">do-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="#compiler-control-statement">compiler-control-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
	</div>
</div>

### Simple Statements

#### Expression Statement

<div class="admonition grammar">
	<p class="first admonition-title">Grammar of expression statement</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<a id="statement_expression"></a> 
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="0800 Expressions">expression</a>
			<code>;</code><sub>opt</sub>
		</p>
	</div>
</div>

<p class="item"> </p>
*See*, <a href="0800 Expressions">Expressions</a>.

#### Declaration Statement

<div class="admonition grammar">
	<p class="first admonition-title">Grammar of declaration statement</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<a id="statement_declaration"></a>
			<span class="name">statement</span>
			<span class="arrow"> → </span> 
			<a href="1000 Declarations">declaration</a>
			<code>;</code><sub>opt</sub>
		</p>
	</div>
</div>

<p class="item"> </p>
*See*, <a href="1000 Declarations">Declarations</a>. 

### Control Flow Statements

#### Condition List

A condition list is used in branch statements and while statements to determine 
the path of execution.

<div class="admonition grammar">
	<p class="admonition-title">Grammar of a condition list</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<a id="condition-list"></a>
			<span class="name">condition-list</span>
			<span class="arrow"> → </span> 
			<a href="#condition">condition</a>
			|
			<a href="#condition">condition</a>
			<code>,</code>
			<a href="#condition-list">condition-list</a>
		</p>
		<p class="syntax-def">
			<a id="condition"></a>
			<span class="name">condition</span>
			<span class="arrow"> → </span> 
			<a href="expressions">expression</a>
			|
			<a href="#optional-binding-condition">optional-binding-condition</a>
			|
			<a href="#case-condition">case-condition</a>
			|
			<a href="/inactiveLink">availability-condition</a>
		</p>
	</div>
</div>

<p class="item"> </p>
A condition list consists of a list of one or more conditions. There are four 
types of conditions:
* an expression that evaluates to a `Bool`
* an `Optional` binding condition
* a `case` pattern-matching condition
* a compiler `#availability` condition

<p class="item"> </p>
A condition list evaluates to `true` if all conditions of the condition list 
evaluate to `true`.  

<p class="item"> </p>
Conditions of a condition list are evaluated in sequence, from left to right.  
If  a condition evaluates to `false`, any remaninig conditions are not evaluated.

<p class="item"> </p>
If an expression is used as a condition, the expression must evaluate to a 
`Bool`.  Use of any other type of expression is an error.  [Note: The C `bool` 
and `Boolean` types and the Objective-C `BOOL` type are all bridged into Swift 
as Bool.]

<p class="item"> </p>
Availability conditions, case conditions and optional binding conditions do not 
directly evaluate to `Bool`.  For purposes of evaluating a condition list, each 
is converted to a `Bool`.  

##### Optional Binding Condition

An optional binding condition attempts to initialize a variable from an instance 
of `Optional`.  If the initialization succeeds, the variable is available within
the code block of the control statement to which the condition applies.

<div class="admonition grammar">
	<p class="admonition-title">Grammar of an optional binding condition</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<a id="optional-binding-condition"></a>
			<span class="name">optional-binding-condition</span>
			<span class="arrow"> → </span> 
			<code>let</code>
			<a href="/inactiveLink">pattern</a>
			<a href="/inactiveLink">initializer</a>
			|
			<code>var</code>
			<a href="/inactiveLink">pattern</a>
			<a href="/inactiveLink">initializer</a>
		</p>
	</div>
</div>

<p class="item"> </p>
An optional binding condition yields `true` if the variable initialization 
succeeds (i.e., the instance of `Optional` is not equal to `nil`), and otherwise 
yields `false`.  

*...to be continued...*

##### Case Condition

<div class="admonition grammar">
	<p class="admonition-title">Grammar of a case condition</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<span class="name">case-condition</span>
			<span class="arrow"> → </span> 
			<code>case</code>
			<a href="/inactiveLink">pattern</a>
			<a href="/inactiveLink">initializer</a>
		</p>
	</div>
</div>

<p class="item"> </p>
A case condition yields `true` if the initialization succeeds (i.e., the  
pattern is matched), and otherwise yields `false`.

*...to be continued...*

##### Availability Condition

An availability condition is evaluated at run time to determine whether given 
API  are available based on the platform and platform version on which a program 
is running.

<div class="admonition grammar">
	<p class="admonition-title">Grammar of an availability condition</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<span class="name">availability-condition</span>
			<span class="arrow"> → </span> 
			<code>#available</code>
			<code>(</code>
			<a href="/inactiveLink">availability-arguments</a>
			<code>)</code>
		</p>
	</div>
</div>

<p class="item"> </p>
An availability condition yields `true` if one of the platforms that is the 
subject of the availability condition is present, and otherwise yields `false`.

*...to be continued...*

#### Branch Statements

<div class="admonition grammar">
	<p class="admonition-title">Grammar of a branch statement</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<span class="name">branch-statement</span>
			<span class="arrow"> → </span> 
			<a href="#if-statement">if-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">branch-statement</span>
			<span class="arrow"> → </span> 
			<a href="#guard-statement">guard-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<span class="name">branch-statement</span>
			<span class="arrow"> → </span> 
			<a href="#switch-statement">switch-statement</a>
			<code>;</code><sub>opt</sub>
		</p>
	</div>
</div>

##### If Statement
<div class="admonition grammar">
	<p class="admonition-title">Grammar of an if statement</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<span class="name">if-statement</span>
			<span class="arrow"> → </span>
			<code>if</code>
			<a href="condition-list">condition-list</a>
			<a href="/inactiveLink">code-block</a>
			<a href="#else-clause">else-clause</a><sub>opt</sub>
		</p>
		<p class="syntax-def">
			<a id="else-clause"></a>
			<span class="name">else-clause</span>
			<span class="arrow"> → </span> 
			<code>else</code>
			<a href="/inactiveLink">code-block</a>
			|
			<code>else</code>
			<a href="#if-statement">if-statement</a>
		</p>
	</div>
</div>

<p class="item"> </p>
The `if` keyword is dependent upon the `Bool` type declared in the standard 
library.
<p class="item"> </p>
The code block of an `if` statement is executed if the condition list of the 
`if` statement evaluates to `true`.
<p class="item"> </p>
If an `if` statement includes an unqualified `else` clause, the code block of 
the `else` clause is executed if the condition list of the `if` statement 
evaluates to `false` 
<p class="item"> </p>
If an `if` statement includes an `else` clause qualified by another `if` 
statement, the code block of the `else` clause is executed if the condition list 
of the former `if` statement evaluates to `false` and the condition list of the 
latter `if` statement evaluates to `true`.
<p class="item"> </p>
An `if` statement, inclusive of any `if` statements chained to the `if` 
statement via `else` clauses, may execute one and only one code block.  In other 
words, in the case of multiple `if` statements chained together, only one code 
block may be executed.  If a code block is executed within an `if` statement, 
after execution of the code block, control passes to the first line of code 
following the `if` statement. 
<p class="item"> </p>
If no code block is executed by an `if` statement, control passes to the first 
line of code following the `if` statement.
<p class="item"> </p>
An `if` statement may be labeled.  A label is not permitted on an `if` statement 
within an `else` clause.  See, [labeled statements](#labeled-statements).
<p class="item"> </p>
A code block within a labeled `if` statement may include a `break` statement 
referring to the label of the `if` statement.  If the labeled `break` statement 
is reached, control passes to the first line of code following the `if` 
statement.  For example:
```swift
let a = 0
myLabel: if a == 0 {
    print("1")
    break myLabel
    print("should not happen")
} else if a == 1 {
    print("2")
} else {
    print("3")
}
// prints "1"
```



##### Guard Statement

##### Switch Statement

#### Loop Statements
#### Labeled Statements
#### Control Transfer Statements
#### Defer Statement
#### Do Statement

### Compiler Control Statements

<div class="admonition grammar">
	<p class="first admonition-title">Grammar of a compiler control statement</p>
	<div class="syntax-group">
		<p class="syntax-def">
			<span class="name">compiler-control-statement</span>
			<span class="arrow"> → </span> 
			<a href="#conditional-compilation-block">
			conditional-compilation-block</a>
		</p>
		<p class="syntax-def">
			<span class="name">compiler-control-statement</span>
			<span class="arrow"> → </span> 
			<a href="#line-control-statement">
			line-control-statement</a>
		</p>
		<p class="syntax-def">
			<span class="name">compiler-control-statement</span>
			<span class="arrow"> → </span> 
			<a href="#diagnostic-statement">
			diagnostic-statement</a>
		</p>
	</div>
</div>

#### Conditional Compilation Block

#### Line Control Statement

#### Diagnostic Statement

### References

1. *The Swift Programming Language*, [Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html)
1. *The Swift Programming Language*, [Loop Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID429)
1. *The Swift Programming Language*, [Branch Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID434)
1. *The Swift Programming Language*, [Labeled Statement](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID439)
1. *The Swift Programming Language*, [Control Transfer Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID440)
1. *The Swift Programming Language*, [Defer Statement](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID532)
1. *The Swift Programming Language*, [Do Statement](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID533)
1. *The Swift Programming Language*, [Compiler Control Statements](https://docs.swift.org/swift-book/ReferenceManual/Statements.html#ID538)
1. *The Swift Programming Language*, [Summary of the Grammar: Statements](https://docs.swift.org/swift-book/ReferenceManual/zzSummaryOfTheGrammar.html#ID475)

