//
//  WeightedQuickFind.swift
//  Percolation
//
//  Created by meh on 3/1/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

class WeightedQuickFindV2 {

  var ids:  [Int] = []
  var size: [Int] = []

  init(_ n: Int) {
    let square = n*n
    for index in 0..<square {
      ids.append(index)
      size.append(1)
    }
  }

  private func root(i: Int) -> Int {
    var i = i
    while i != ids[i] {
      // path compression
      ids[i] = ids[ids[i]]
      i = ids[i]
    }
    return i
  }

  func connected(q: Int, p: Int) -> Bool {
    return root(i: q) == root(i: p)
  }

  func uniom(p: Int, q: Int) {
    let i = root(i: p)
    let j = root(i: q)
    if i == j { return }

    // weight the trees
    if (size[i] < size[j]) {
      ids[i] = j
      size[j] += size[i]
    } else {
      ids[j] = i
      size[i] += size[j]
    }
  }
}
