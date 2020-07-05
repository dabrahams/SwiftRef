# SwiftRef:  Protocol Conformance Examples

Currently, this package contains protocol conformance examples used in the body of a working-draft specification for Swift protocol conformance.  These materials are being developed as part of the SwiftRef project.

It is anticipated that this package will be expanded to more broadly inlcude all sorts of protocol conformance examples, including, edge cases, and analyses of the same--all with a view to creating a resource, confirming that the model described in SwfitRef is consistent with the implementation, and possibly labelling certain behavior as bugs in the current implementation.

Each example has its own testTarget, and is built entirely within the testTarget.  We use separate targets because protocols, protocol extensions, and type extensions all must be at the top level, and so cannot be name-spaced other than via separate targets.  Perhaps there is a more efficient way to do this.
