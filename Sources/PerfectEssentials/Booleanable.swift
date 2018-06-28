/// General logic protocol
public protocol Booleanable {
  /// get the boolean value of current type
  func booleanValue() -> Bool
}
extension Bool: Booleanable { public func booleanValue() -> Bool { return self } }
extension Int: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension UInt: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension Int8: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension UInt8: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension Int16: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension UInt16: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension Int32: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension UInt32: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension Int64: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension UInt64: Booleanable { public func booleanValue() -> Bool { return self != 0 } }
extension Float: Booleanable { public func booleanValue() -> Bool { return self != 0.0 } }
extension Double: Booleanable { public func booleanValue() -> Bool { return self != 0.0 } }
extension String: Booleanable { public func booleanValue() -> Bool { return !self.isEmpty } }

public extension Array where Element: Booleanable {

  /// Return `true` if all elements of the array are `true` (or if the array is empty).
  public func all() -> Bool {
    guard let _ = (self.first { !$0.booleanValue() }) else {
      return true
    }
    return false
  }

  /// Return `true` if any element of the array is `true`. If the array is empty, return `false`
  public func any() -> Bool {
    guard let _ = (self.first { $0.booleanValue() }) else {
      return false
    }
    return true
  }

}

public extension Set where Element: Booleanable {

  /// Return `true` if all elements of the array are `true` (or if the array is empty).
  public func all() -> Bool {
    guard let _ = (self.first { !$0.booleanValue() }) else {
      return true
    }
    return false
  }

  /// Return `true` if any element of the array is `true`. If the array is empty, return `false`
  public func any() -> Bool {
    guard let _ = (self.first { $0.booleanValue() }) else {
      return false
    }
    return true
  }
}
