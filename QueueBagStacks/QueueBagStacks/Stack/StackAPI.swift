//
//  StackAPI.swift
//  QueueBagStacks
//
//  Created by meh on 3/2/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

protocol StackAPI {
  mutating func push(item: String)
  mutating func pop()      -> String
  func isEmpty()  -> Bool
  func size()     -> Int
}
