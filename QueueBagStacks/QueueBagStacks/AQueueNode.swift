//
//  aQueueNode.swift
//  QueueBagStacks
//
//  Created by Alex Blanchard on 3/14/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

class AQueueNode {
  
  // Variable to store an item/queueID
  let item: String
  
  // Type Alias to name the new function/Type
  typealias NextNode = () -> AQueueNode
  
  // access control restricted to use within class
  private let _next: NextNode?
  
  // getter to store nil or the following node
  var next: AQueueNode? {
    get {
      guard let f = _next else { return nil }
      return f()
    }
  }
		
  init(_ item_: String, followedBy: NextNode?) {
    item = item_
    _next = followedBy
  }
}

extension AQueueNode {
  // Returns size of self
  func size() -> Int {
    return size(self)
  }
  
  // This is fucking awesome
  func size(_ node: AQueueNode?) -> Int {
    guard let node_ = node else { return 0 }
    if let next_ = node_.next { return 1 + size(next_) }
    return 1
  }
}
