//
//  aQueueAPI.swift
//  QueueBagStacks
//
//  Created by Alex Blanchard on 3/14/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

protocol aQueueAPI {
  mutating func enqueue(item: String)
  mutating func dequeue() -> String
  func isEmpty() -> Bool
  func size()    -> Int
}
