#!/usr/bin/xcrun swift

func findFloor(input: String) {
  var floor: Int = 0
  var basementIndex: Int?

  for (i, n) in input.characters.enumerate() {
    switch n {
      case ")":
        floor--
      case "(":
        floor++
      default:
        continue
    }

    if basementIndex == nil && floor == -1 {
      basementIndex = i
      print("Entered basement: \(i + 1)")
    }
  }

  print("Ended at floor: \(floor)")
}

let input = Process.arguments[1]
findFloor(input)

