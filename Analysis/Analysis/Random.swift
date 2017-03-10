//
//  Random.swift
//  Analysis
//
//  Created by meh on 3/8/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

extension Int {

  /*
   * Random Int between 0 and 100
   */
  static func random() -> Int {
    return random(0...100)
  }

  static func random(_ interval: ClosedRange<Int>) -> Int {
    return interval.lowerBound
      + Int(arc4random_uniform(
        UInt32(interval.upperBound - interval.lowerBound + 1)))
  }
}
