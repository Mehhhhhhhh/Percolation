//
//  StackNode.swift
//  QueueBagStacks
//
//  Created by meh on 3/10/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

// String implementation of StackNode
class StackNode {
  let item: String

  /// Discussion  parameterless function to compute the `next` node in the
  ///  linked list.
  typealias NextNode = () -> StackNode

  internal let _next: NextNode?
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

  /// Returns the size of `Self`
  func size() -> Int {
    return size(self)
  }

  /// Recursively computes the size of a node which is 1 plus the number of
  /// `next` descendents
  func size(_ node: StackNode?) -> Int {
    guard let node_ = node else { return 0 }
    if let next_ = node_.next { return 1 + size(next_) }
    return 1
  }
}
