//
//  StackOfString.swift
//  QueueBagStacks
//
//  Created by meh on 3/10/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

extension String {

  func stackOfString(string: String) {
    var stack: StackAPI = LinkedListStack()
    let components = string.components(separatedBy: " ")
    components.forEach {
      string in
      if string.compare("-") == .orderedSame { print(stack.pop()) }
      else { stack.push(item: string) }
    }
  }
}
