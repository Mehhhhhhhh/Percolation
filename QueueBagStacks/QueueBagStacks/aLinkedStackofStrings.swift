//
//  aLinkedStackofStrings.swift
//  QueueBagStacks
//
//  Created by Alex Blanchard on 3/13/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

struct aLinkedStackOfStrings {
  private var first: Node? = nil
  
  private class Node {
    
    var item: String? = ""
    var next: Node = Node()
    
  }
  
  func isEmpty() -> Bool {
    return first == nil
  }
  
  mutating func pop() -> String? {
    let item = first?.item
    first = first?.next
    return item
  }
  
  mutating func push(item: String) {
    let oldfirst = first
    first = Node()
    first?.item = item
    first?.next = oldfirst!
  }
  
}
