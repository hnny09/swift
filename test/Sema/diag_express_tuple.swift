// RUN: %target-swift-frontend -parse -verify %s

func foo(a : [(some: Int, (key: Int, value: String))]) -> String {
  for (i , (j, k)) in a { // expected-error {{cannot express tuple conversion '(some: Int, (key: Int, value: String))' to '(Int, (Int, String))'}}{8-8=some: }} {{13-13=key: }} {{16-16=value: }}
    if i == j { return k }
  }
}

func rdar28207648() -> [(Int, CustomStringConvertible)] {
  let v : [(Int, Int)] = []
  return v as [(Int, CustomStringConvertible)] // expected-error {{cannot express tuple conversion '(Int, Int)' to '(Int, CustomStringConvertible)'}}
}

