//
//  QueueStackNode.swift
//  QueueBagStacks
//
//  Created by meh on 3/16/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation



/// Exposes
class QueueStackNode {

  var parent: QueueStackNode?
  var next:   QueueStackNode?
  let item:   String

  init(_ item_: String, parent parent_: QueueStackNode?, next next_: QueueStackNode?) {
    item    = item_
    parent  = parent_
    next    = next_
  }
}

extension QueueStackNode {

  func size() -> Int {
    return size(node: self)
  }

  func size(node: QueueStackNode?) -> Int {
    guard let node_ = node else { return 0 }
    if let next_ = node_.next { return 1 + size(node: next_) }
    return 1
  }
}
