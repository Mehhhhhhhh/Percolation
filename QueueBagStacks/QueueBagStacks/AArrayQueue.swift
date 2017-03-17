//
//  aArrayQueue.swift
//  QueueBagStacks
//
//  Created by Alex Blanchard on 3/14/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

struct AArrayQueue: AQueueAPI {
  
  private var queueArray: [String]
  
  init(n: Int) {
    queueArray = Array(repeating: "", count: n)
  }
  
  mutating func enqueue(item: String) {
    queueArray.append(item)
  }
  
  mutating func dequeue() -> String {
    queueArray.remove(at: 0)
    return ""
  }
  
  func isEmpty() -> Bool {
    return true
  }
  
  func size() -> Int {
    return queueArray.count
  }

}
