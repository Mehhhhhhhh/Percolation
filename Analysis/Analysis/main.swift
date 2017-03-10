//
//  main.swift
//  Analysis
//
//  Created by meh on 3/8/17.
//  Copyright © 2017 ForeCyte. All rights reserved.
//

import Foundation

print("Hello, World!")

let size: Int = 4096
let threeSum = ThreeSum()
let data = threeSum.mockData(size: size)
print(data)
print(threeSum.count(list: data))

// write data to text
do {
  let json: Data = try! JSONSerialization.data(
    withJSONObject: data, options: .prettyPrinted)
  let directory = NSSearchPathForDirectoriesInDomains(
    .documentDirectory, .userDomainMask, true).first!
  let path = "\(directory)/\(size)ints.txt"
  print(path)
  try! json.write(to: URL(fileURLWithPath: path), options: .atomic)
  print("\nEXPORTED INTS\nFILE\t\(path)")
}
