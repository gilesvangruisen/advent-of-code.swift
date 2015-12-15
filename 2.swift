#!/usr/bin/xcrun swift

struct Box { var x: Int; var y: Int; var z: Int }

extension Box {
   init?(string: String) {
    let splits = string.characters
        .split { $0 == "x" }
        .map { Int(String($0)) }

    guard let _x = splits[0], _y = splits[1], _z = splits[2] else {
      return nil
    }

    self.init(x: _x, y: _y, z: _z)
  }


  var surfaceArea: Int {
    return (2 * x * y)
         + (2 * y * z)
         + (2 * z * x)
  }

  func smallestSide() -> (w: Int, l: Int) {
    let sorted = [x, y, z].sort(<)

    return (w: sorted[0], l: sorted[1])
  }

  var smallestSideArea: Int {
    let smallest = smallestSide()

    return smallest.w * smallest.l
  }

  func getPerimeter(w: Int, l: Int) -> Int {
    return (2 * w)
         + (2 * l)
  }

  func getRibbonLength() -> Int {
    let smallest = smallestSide()
    return getPerimeter(smallest.w, l: smallest.l)
         + (x * y * z)
  }

  func getWrappingArea() -> Int {
    return surfaceArea
         + smallestSideArea
  }

}

let input = Process.arguments[1]
let lines = input.characters.split("\n").map(String.init)
let boxes = lines.map { Box(string: $0)! }
let wrappingArea = boxes.reduce(0) { $0 + $1.getWrappingArea() }
let ribbonLength = boxes.reduce(0) { $0 + $1.getRibbonLength() }

print("wrapping: ", wrappingArea)
print("ribbon: ", ribbonLength)

