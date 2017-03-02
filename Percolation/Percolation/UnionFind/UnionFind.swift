//
//  UnionFind.swift
//  Percolation
//
//  Created by meh on 3/1/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

protocol UnionFind {
  func root(i: Int) -> Int
  func connected(p: Int, q: Int) -> Bool
  func union(p: Int, q: Int)
}
