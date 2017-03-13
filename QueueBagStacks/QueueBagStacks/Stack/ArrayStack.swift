//
//  ArrayStack.swift
//  QueueBagStacks
//
//  Created by meh on 3/13/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

struct ArrayStack {

  internal var _arrayStack: [String]
  internal var _count: Int

  init(_ n: Int) {
    _arrayStack = Array(repeating: "", count: n)
    _count = 0
  }
}

extension ArrayStack: StackAPI {

  mutating func push(item: String) {
    _arrayStack[_count] = item
    _count = _count+1
  }

  mutating func pop() -> String {
    let pops = _arrayStack[_count]
    _arrayStack[_count] = ""
    _count = _count-1
    return pops
  }

  func isEmpty() -> Bool {
    return size() == 0
  }

  func size() -> Int {
    return _count
  }
}
