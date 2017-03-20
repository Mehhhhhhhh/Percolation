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
  
  internal var _head: QueueStackNode?
  private var _tail: QueueStackNode?

  mutating func queue(item: String) {
    // @new     create new QueueStackNode
    let new = QueueStackNode(item, parent: _tail, next: nil)
    // @init    head & tail if empty

    if isEmpty() {
      _head = new
      _tail = new
    } else {
      // @set     @tail.next = @new
      _tail!.next = new
    }
    // @append  to the end of the linked list
    _tail = new
  }

  /// Pops the item off the back of the queue.
  mutating func dequeue() -> String {
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

///!!!TODO: check out Alex's debugDescription method

/// CustomDebugStringConvertible
extension LinkedListQueue: CustomDebugStringConvertible {

  public var debugDescription: String {
    guard let head_ = _head else { return "...empty..." }
    return head_.debugDescription
/*=======
extension LinkedListQueue: CustomDebugStringConvertible {
  var debugDescription: String {
    guard var tail = _tail  else { return "Like the trap"}
    
    var msg: String = ""
    while tail.parent != nil {
      msg += "|\(tail.item)| -> "
      tail = tail.parent!
    }
    return "\n\(msg)|\(tail.item)| -> \(tail.parent)\n"
>>>>>>> 5b21b57cc460b3bac9d20522577e683c8b3e97b1*/
  }
}
