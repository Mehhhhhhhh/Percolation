import GameplayKit

// extension method for converting Integer to Boolean
extension Bool {
  init<T: Integer>(_ integer: T) {
    self.init(integer != 0)
  }
}

class WeightedQuickFind {

  var id: [Int] = []
  var sz: [Int] = []

  init(n: Int) {
    let N = n * n
    for i in 0..<N {
      id.append(i)
      sz.append(i)
      sz[i] = 1
    }
  }

  private func root(i: Int) -> Int{
    var i = i
    while i != id[i] {
      id[i] = id[id[i]]
      i = id[i]
    }

    return i
  }

  func count(n: Int) -> Int {
    return sz[n]
  }

  func connected(q: Int, p: Int) -> Bool {
    return root(i: q) == root(i: p)
  }

  func union(p: Int, q: Int){
    let i = root(i: p)
    let j = root(i: q)
    if i == j { return }

    if (sz[i] < sz[j]) {
      id[i] = j
      sz[i] += sz[j]
    } else {
      id[j] = i
      sz[i] += sz[j]
    }


  }
}

//extension WeightedQuickFind: CustomDebugStringConvertible {
//
//  var debugDescription: String {
//
//
//  }
//}

////////////////////////// Class ////////////////////////////////////////
/////////////////////////// Divider //////////////////////////////////////

struct Percolation {

  let _N: Int
  let _NSquared: Int
  var _sites: [Int]

  var wQF: WeightedQuickFind

  var top: Int
  var bottom: Int
  var cornerNW: Int
  var cornerNE: Int
  var cornerSW: Int
  var cornerSE: Int

  var rand: Int


  init(n: Int) {
    _N = n
    _NSquared = n * n
    _sites = Array(repeating: 0, count: _NSquared)

    wQF = WeightedQuickFind(n: n)
    top = _NSquared
    bottom = _NSquared + 1
    cornerNW = 0
    cornerNE = _N
    cornerSW = _NSquared - 1
    cornerSE = _NSquared - _N


    wQF.id.append(top)
    wQF.id.append(bottom)
    wQF.sz.append(1)
    wQF.sz.append(1)

    let r = UInt32(_NSquared - 1)

    let ran = arc4random_uniform(r)

    rand = Int(ran)

    attachTopBottom()

    //        testSystem()

  }

  mutating func open(row: Int, column: Int) {
    let index = siteIndex(row: row, column: column)
    open(index: index)

  }

  mutating func open(index: Int) {
    guard index < _NSquared
      else { return /* insert requirement to throw out of bounds error */}
    self._sites[index] = 1

    // connect to east if east is open
    if eastOpen(n: index) {
      wQF.union(p: index, q: index-1)
    }

    if westOpen(n: index) {
      wQF.union(p: index, q: index+1)
    }

    if northOpen(n: index) {
      wQF.union(p: index, q: index-_N)
    }

    if southOpen(n: index) {
      wQF.union(p: index, q: index+_N)
    }
  }

  mutating func fill(index: Int) {
    guard index < _NSquared
      else { return /* insert requirement to throw out of bounds error */}
    self._sites[index] = 2
  }

  func isOpen(row: Int, column: Int) -> Bool {
    let index = siteIndex(row: row, column: column)
    return Bool(_sites[index])
  }

  func isLeftmost(n: Int) -> Bool {
    return (n % _N) == 0
  }

  func isRightmost(n: Int) -> Bool {
    return ((n + 1) % _N) == 0
  }

  func isOnTop(n: Int) -> Bool {
    return n < _N
  }

  func isOnBottom(n: Int) -> Bool {
    return n > (_NSquared - _N)
  }

  func isFull(site: Int) -> Bool {
    return !(_sites[site] > 2)
  }

  func isFullV2(site: Int) -> Bool {
    let row_ = row(index: site) // exchuse the laiziness
    let column_ = column(index: site) // excuse the laziness
    if (!isOnTop(n: site) && column_ <= _N)
      && (!isOnBottom(n: site) && row_ <= _N) {
      return wQF.connected(q: site, p: top)
    }

    return false
  }

  func numberOfOpenSites(sites: [Int]) -> Int {
    return sites.reduce(0, +)
  }

  mutating func testSystem() {
    //        print(self._sites)
    //        print(wQF.id)
    //        print(percolates())

    let randomNum = createRandom()
    print("\nOPEN SITE @ INDEX:\t\(randomNum)\n")

    open(index: randomNum)

    if canFill(n: randomNum) {
      fill(index: randomNum)

    }

    if eastOpen(n: randomNum){
      let ranVal = randomNum
      fill(index: ranVal - 1)
    }

    if westOpen(n: randomNum) {
      let ranVal = randomNum
      fill(index: ranVal + 1)

    }

    if northOpen(n: randomNum) {
      let ranVal = randomNum
      fill(index: ranVal - _N)

    }

    if southOpen(n: randomNum) {
      let ranVal = randomNum
      fill(index: ranVal + _N)

    }
    //        print(self._sites)
    //        print(wQF.id)
    //        print(percolates())
  }

  func isCorner(n: Int) -> Bool {
    if n == cornerNW || n == cornerNE || n == cornerSE || n == cornerSW {
      return true
    }
    return false
  }

  func isWall(n: Int) -> Bool {
    if isMultiple(n: n) {
      return true
    }

    if isMultiple(n: n - 1) {
      return true
    }

    return false
  }

  func percolates() -> Bool {
    return wQF.connected(q: top, p: bottom)
  }

  func canFill(n: Int) -> Bool{
    return wQF.connected(q: n, p: top)
  }

  func eastOpen(n: Int) -> Bool {
    guard isLeftmost(n: n) else { return false }
    let n = n - 1
    return isOpen(row: row(index: n), column: column(index: n))
  }

  func westOpen(n: Int) -> Bool {
    guard isRightmost(n: n) else { return false }
    let n = n + 1
    return isOpen(row: row(index: n), column: column(index: n))
  }

  func northOpen(n: Int) -> Bool {
    guard isOnTop(n: n) else { return false }
    let n = n - _N
    return isOpen(row: row(index: n), column: column(index: n))
  }

  func southOpen(n: Int) -> Bool {
    guard isOnBottom(n: n) else { return false }
    let n = n + _N
    return isOpen(row: row(index: n), column: column(index: n))
  }

  func isMultiple(n: Int) -> Bool {
    return n % _N == 0
  }

  // init methods //
  mutating func createRandom() -> Int {
    let r = UInt32(_NSquared)

    let ran = arc4random_uniform(r)

    rand = Int(ran)

    return rand
  }

  func attachTopBottom() {

    var i = 0
    while (i <= _N) {
      wQF.union(p: i, q: top)
      i += 1
    }

    i = _NSquared - _N

    while (i <= (_NSquared - 1)) {
      wQF.union(p: i, q: bottom)
      i += 1
    }
  }

  // Array index <==> row+column conversion
  func column(index: Int) -> Int {
    return index % self._N
  }

  func row(index: Int) -> Int {
    return (index - column(index: index)) / self._N
  }

  func siteIndex(row: Int, column: Int) -> Int {
    return row*_N + column
  }
}

extension Percolation: CustomDebugStringConvertible {

  var debugDescription: String {
    var description: String = ""
    for (index, value) in _sites.enumerated() {
      // new line begins on the nth = k * n character, where k==>1, 2, 3...
      if index % _N == 0 {
        description = "\(description)\n\(value)" } else {
        description = "\(description)\t\(value)" }
    }
    return description
  }
}

var percolation = Percolation(n: 10)
print(percolation)
//percolation.testSystem()
percolation.open(index: 0)
print(percolation)

/////////////////////////////////////////////Class///////////////////////////
////////////////////////////////////////// Divider ///////////////////////////
//MARK: PercolationStats

struct PercolationStats {

  init(n: Int, trials: Int) {
    for _ in 0...trials {
      Percolation(n: n)
    }
  }

}











////////////////////////////////////////// Testing ///////////////////////////
//////////////////////////////////////////// Space //////////////////////////








