//
//  LinkedListStack.swift
//  QueueBagStacks
//
//  Created by meh on 3/3/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

struct LinkedListStack: StackAPI {

  private var _head: StackNode?

  /// Pushes an `item` onto the top of the stack
  mutating func push(item: String) {
    /* Sequence of Steps
     *  Append at Top of the Stack
     *    tmp, Copy existing head Node
     *    new, Create new Node
     *      Set `item`
     *      Set `next` = tmp
     *    Set head to new Node
     */
    func predecessor() -> (() -> StackNode)? {
      guard let head = self._head else { return nil }
      return { head }
    }

    let successor  = StackNode(item, followedBy: predecessor())
    _head  = successor
  }

  /// Returns the top item in the stack
  mutating func pop() -> String {
    return "NOT IMPLEMENTED"
  }

  func isEmpty() -> Bool {
    return _head != nil
  }

  func size() -> Int {
    guard let head = _head else { return 0 }
    return head.size()
  }
}
