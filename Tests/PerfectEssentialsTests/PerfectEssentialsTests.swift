import XCTest
@testable import PerfectEssentials


final class PerfectEssentialsTests: XCTestCase {
  static var allTests = [
    ("testAll", testAll),
    ]

  func testFor<T>(size: Int, random: @escaping (Bool) -> T) -> T
    where T: Booleanable, T: Hashable {

    let trueValue: T = random(true)
    let falseValue: T = random(false)
    let empty:[T] = []
    XCTAssertTrue(empty.all())
    XCTAssertFalse(empty.any())

    var allTrue = Array.init(repeating: trueValue, count: Int.random(in: 0 ..< size))
    XCTAssertTrue(allTrue.all())
    allTrue[Int.random(in: 0 ..< allTrue.count)] = random(false)
    XCTAssertFalse(allTrue.all())

    var allTrueSet: Set<T> = Set(allTrue)
    XCTAssertFalse(allTrue.all())

    allTrueSet = allTrueSet.filter { $0.booleanValue() }
    XCTAssertTrue(allTrueSet.all())

    var allFalse = Array.init(repeating: falseValue, count: Int.random(in: 0 ..< size))
    XCTAssertFalse(allFalse.all())
    allFalse[Int.random(in: 0 ..< allFalse.count)] = random(true)
    XCTAssertTrue(allFalse.any())

    var allFalseSet: Set<T> = Set(allFalse)
    XCTAssertTrue(allFalseSet.any())

    allFalseSet = allFalseSet.filter { !$0.booleanValue() }
    XCTAssertFalse(allFalseSet.any())

    return trueValue
  }

  func testAll() {
    _ = testFor(size: 100000) {
      bool in
      return bool
    }

    let a: Int = testFor(size: 10000) {
      bool in
      return bool ? Int.random(in: 0 ..< 100000) : 0
    }
    print(a)

    let b: Int = testFor(size: 10000) {
      bool in
      return bool ? Int.random(in: -1000000 ..< 0) : 0
    }
    print(b)

    let c: UInt = testFor(size: 10000) {
      bool in
      return bool ? UInt.random(in: 0 ..< 1000000) : 0
    }
    print(c)

    let d: Double = testFor(size: 10000) {
      bool in
      return bool ? Double.random(in: 1e-8 ..< 1e-3 ): 0.0
    }
    print(d)

    let e: Double = testFor(size: 10000) {
      bool in
      return bool ? Double.random(in: -1e-3 ..< -1e-8 ): 0.0
    }
    print(e)

    let f: String = testFor(size: 10000) {
      bool in
      return bool ? "Hello world!" : ""
    }
    print(f)
  }
}
