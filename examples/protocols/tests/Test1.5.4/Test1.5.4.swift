import XCTest

/// Example 1.5.4

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

class Test1: XCTestCase {
  func test() {
    let xInt = X<Int>()
    XCTAssertEqual(xInt.id, "P_Numeric")
    XCTAssertEqual(getId(of: xInt), "P")
  }
}


/// Example 1.5.4.2
/// ... continuing from Example 1.5.4.1

protocol Q: P {} // (c2)
extension Q where V: Numeric {
  var id: String { "Q_Numeric" } // (i2)
}

func getId2<T: Q>(of t: T) -> String {
  t.id
}

struct Y<T> {
  typealias V = T
}
extension Y: P {} // (c4)
extension Y: Q {}

class Test2: XCTestCase {
  func test() {
    let yInt = Y<Int>()
    XCTAssertEqual(yInt.id, "Q_Numeric")
    XCTAssertEqual(getId2(of: yInt), "P")
  }
}
