//
//  StackNode.swift
//  QueueBagStacks
//
//  Created by meh on 3/10/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

// Non-generic string implementation of StackNode
class StackNode {
  let item: String

  typealias NextNode = () -> StackNode
  private let _next: (() -> StackNode)?
  var next: StackNode? {
    get {
      guard let f = _next else { return nil }
      return f()
    }
  }

  init(_ item_: String, followedBy: NextNode?) {
    item  = item_
    _next = followedBy
  }
}

extension StackNode {

  func size() -> Int {
    return size(self)
  }

  func size(_ node: StackNode?) -> Int {
    guard let node_ = node else { return 0 }
    if let next_ = node_.next { return 1 + size(next_) }
    return 1
  }
}
