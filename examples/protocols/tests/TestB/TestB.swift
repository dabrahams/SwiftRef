import XCTest

/// Example B

protocol P {
  associatedtype V // (m2)
  var id: String { get } // (m1)
}
extension P {
  var id: String { "P" } // (i1)
}
extension P where V: Numeric {
 var id: String { "P_Numeric" } // (i2)
}
extension P where V: StringProtocol {
  var id: String { "P_StringProtocol" } // (i3)
}

func getId<T: P>(of t: T) -> String {
  t.id // (a2)
}

struct S: P {
  typealias V = Int
}

class Test: XCTestCase {
  func test() {
    let s = S()
    XCTAssertEqual(s.id, "P_Numeric")
    XCTAssertEqual(getId(of: s), "P_Numeric")
  }
}
