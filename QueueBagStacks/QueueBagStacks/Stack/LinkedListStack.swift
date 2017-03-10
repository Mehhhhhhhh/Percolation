//
//  LinkedListStack.swift
//  QueueBagStacks
//
//  Created by meh on 3/3/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

indirect enum Node {
  case Progenitor
  case Scheme([Node])
  case Item(String)
  case Next(Node)
}

extension Node {

  func size() -> Int {
    return size(node: self)
  }

  func size(node: Node) -> Int {
    var count: Int = 1
    // Scheme
    switch node {
    case .Scheme(let nodes):
      for index in 0..<nodes.count {
        count += size(node: nodes[index])
      }
    case .Item(_):
      count += 1
    case .Next(let node):
      count += size(node: node)
    case .Progenitor: break
    }
    return count
  }
}

extension Node {

  func pop(node: Node) -> String {
    switch node {
    case .Item(let item):
      return item
    case .Next(let node):
      return pop(node: node)
    case .Scheme(_), .Progenitor:
      return ""

    }
  }
}

// Instant access requires that we pull 
// out a reducible set, or a structure with expectations

/*
 * Instant Access
 */
extension Node {

  func item() -> Node {
    return item(node: self)
  }

  func item(node: Node) -> Node {
    switch node {
//    case .Scheme(let nodes):
    // 1. item is the first item
    default:
      return Node.Progenitor
    }
  }
}

struct LinkedListStack: StackAPI {

  var first: Node

  func isEmpty() -> Bool {
    switch first {
    case .Item(_):
      return true
    default:
      return false
    }
  }

  mutating func push(item: String) {
    let old = first
    first   = Node.Scheme([.Item(item), .Next(old)])
  }

  /*
   *  q: how do we pop an enumeration of Nodes 
   *  a: if
   */
  mutating func pop() -> String {
    let item: String
    switch first {
    case .Item(let string):
      item = string
//    case .Next(let node): break;
//      item =
    default:
      item = "" // should we throw an error here?
    }
    return item
  }

  func size() -> Int {
    return first.size()
  }
}
