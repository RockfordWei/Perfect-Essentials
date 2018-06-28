# PerfectEssentials


A convenient function library candidate for Perfect

## Status

Developing.

## API Doc

### Protocol Booleanable

``` swift
/// General logic protocol
public protocol Booleanable {
  /// get the boolean value of current type
  func booleanValue() -> Bool
}
```

### Implemented Booleanables

Type|True Value|False Value
----|----------|----------
Bool|true|false
all signed/unsigned integer| 0 | non-zero value
float/double | 0 | non-zero value
string| empty | non-empty value

### Array/Set extension with Booleanable Elements

- `all()`: Return `true` if all elements of are `true` (or if empty).
- `any()`: Return `true` if any element is `true`. If empty, return `false`

### Examples

``` swift
import PerfectEssentials

let x = [1, 3, 5, 0.1, 0.3]
print(x.all())
// will print true

let y = x + [0]
print(y.all())
// will print false

let z = [0, 0, 0, 0, 0]
print(z.any())
// will print false

let a = [0, 0, 0, 0.0000000001, 0, 0, 0]
print(a.any())
// will print true
```