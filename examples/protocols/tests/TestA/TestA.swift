import XCTest

/// Example A

protocol P {
  var id: String { get } // (m1)
  associatedtype V // (m2)
}
extension P where V: Numeric { // (c1)
  var id: String { "P" } // (i1)
}

protocol Q: P {} // (c2)
extension Q { // (c3)
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

class Test: XCTestCase {
  func test() {
    let s = S()
    XCTAssertEqual(s.id, "Q_Numeric")
    XCTAssertEqual(getId(of: s), "Q_Numeric")
  }
}
