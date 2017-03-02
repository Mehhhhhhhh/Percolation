//
//  EagerQuickFind.swift
//  Percolation
//
//  Created by meh on 3/1/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

class EagerQuickFind {

  var ids: [Int]  = []

  init(n: Int) {
    for index in 0..<n {
      ids[index] = index
    }
  }

  func connected(p: Int, q: Int) -> Bool {
    return ids[p] == ids[q]
  }

  func union(p: Int, q: Int) {
    let pid = ids[p]
    let qid = ids[q]
    for index in 0..<ids.count {
      if ids[index] == pid {
        ids[index] = qid
      }
    }
  }
}
