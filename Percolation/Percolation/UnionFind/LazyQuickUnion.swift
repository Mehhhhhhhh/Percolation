//
//  LazyQuickUnion.swift
//  Percolation
//
//  Created by meh on 3/1/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

class LazyQuickUnion {

  var _ids: [Int]

  init(_ n: Int) {
    _ids = []
    for index in 0..<n {
      _ids.append(index)
    }
  }

  private func root(i: Int) -> Int {
    var i = i
    while i != _ids[i] {
      i = _ids[_ids[i]]
    }
    return i
  }

  func connected(p: Int, q: Int) -> Bool {
    return root(i: p) == root(i: q)
  }

  func union(p: Int, q: Int) {
    let i = root(i: p)
    let j = root(i: q)
    if i == j { return }

    _ids[i] = j
  }
}
