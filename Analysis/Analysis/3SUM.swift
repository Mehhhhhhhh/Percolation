//
//  3SUM.swift
//  Analysis
//
//  Created by meh on 3/8/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

struct ThreeSum { }

extension ThreeSum {

  /*
   * Given N distinct integers, how many triples sum to exactly zero
   */
  func count(list: [Int]) -> Int {
    var count: Int = 0
    for indexOne in 0..<list.count {
      for indexTwo in indexOne+1..<list.count {
        for indexThree in indexTwo+1..<list.count {
          if (list[indexOne] + list[indexTwo] + list[indexThree] == 0) {
            count += 1
          }
        }
      }
    }
    return count
  }
}

extension ThreeSum {

  /// Return mock data integer array of `size` by computing random integers
  /// between -1*`size` and `size`
  func mockData(size: Int) -> [Int] {
    var data: [Int] = Array(repeating: 0, count: size)
    for index in 0..<size {
      data[index] = Int.random(-1*size...size)
    }
    return data
  }
}
