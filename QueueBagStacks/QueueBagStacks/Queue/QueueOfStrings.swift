//
//  QueueOfStrings.swift
//  QueueBagStacks
//
//  Created by meh on 3/17/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

func testQueueOfStrings(_ string: String) -> LinkedListQueue {
  var queue: LinkedListQueue = LinkedListQueue()
  string.components(separatedBy: " ").forEach {
    component in
    if component.compare("-") == .orderedSame {
      print("QUEUE\n\(queue)\n)")
      queue.dequeue()
      print("DEQUEUE\n\(queue)")

    }
    else { queue.queue(item: component) }
  }
  return queue
}
