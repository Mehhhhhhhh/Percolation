//
//  LinkedListQueue.swift
//  QueueBagStacks
//
//  Created by meh on 3/15/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

/// Queue structure, Last In, First Out
/// Complexity
struct LinkedListQueue {

  fileprivate var _head: QueueStackNode?
  fileprivate var _tail: QueueStackNode?

  mutating func push(item: String) {
    
    // @new     create new QueueStackNode
    let new = QueueStackNode(item, parent: _tail, next: nil)
    
    // @set     @head = new
    if self.isEmpty() {
      _head = new
    }
    
    // @set     @tail.next = @new
    _tail?.next = new
    
    // @append  to the end of the linked list
    _tail = new
  }

  /// Pops the item off the back of the queue.
  mutating func pop() -> String {
    // @head_   the current head
    guard let head_ = _head else { return "" }
    // @set     @_head = @head_.next
    _head       = _head?.next
    // @return  @head_
    return head_.item
  }
  
  func peek() -> String {
    guard let head_ = _head else { return "Aint shit here yo" }
    return head_.item
  }

  func isEmpty() -> Bool {
    return size() == 0
  }

  func size() -> Int {
    guard let head_ = _head else { return 0 }
    return head_.size()
  }
}

extension LinkedListQueue: CustomDebugStringConvertible {
  var debugDescription: String {
    guard var tail = _tail  else { return "Like the trap"}
    
    var msg: String = ""
    while tail.parent != nil {
      msg += "|\(tail.item)| -> "
      tail = tail.parent!
    }
    return "\n\(msg)|\(tail.item)| -> \(tail.parent)\n"
  }
}
