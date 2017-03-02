import GameplayKit
import Foundation

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
    /// FIXME!!!
    top = _NSquared
    /// FIXME!!!
    bottom = _NSquared + 1
    cornerNW = 0
    cornerNE = (_N - 1)
    cornerSW = _NSquared - _N
    cornerSE = _NSquared - 1


    wQF.id.append(top)
    wQF.id.append(bottom)
    wQF.sz.append(1)
    wQF.sz.append(1)

    let r = UInt32(_NSquared - 1)

    let ran = arc4random_uniform(r)

    rand = Int(ran)

    connectVirtual()
  }

  mutating func open(index: Int) {
    guard index < _NSquared
      else { return /* insert requirement to throw out of bounds error */}
    guard !isOpen(site: index) else { return }
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

  func isFull(site: Int) -> Bool {
    let row_ = row(index: site) // exchuse the laiziness
    let column_ = column(index: site) // excuse the laziness
    if (!isOnTop(n: site) && column_ <= _N)
      && (!isOnBottom(n: site) && row_ <= _N) {
      return wQF.connected(q: site, p: top)
    }

    return false
  }

  func numberOfOpenSites() -> Int {
    return _sites.reduce(0, +)
  }

  func percolates() -> Bool {
    return wQF.connected(q: top, p: bottom)
  }

  func canFill(n: Int) -> Bool{
    return wQF.connected(q: n, p: top)
  }

  func isMultiple(n: Int) -> Bool {
    return n % _N == 0
  }
}

// Sites
extension Percolation {

  func connectVirtual() {

    connectVirtualTop()
    connectVirtualBottom()
  }

  func connectVirtualTop() {
    var index = 0
    while index < _N {
      wQF.union(p: index, q: top)
      index += 1
    }
  }

  func connectVirtualBottom() {
    var index = _NSquared - _N
    while index < _NSquared {
      wQF.union(p: index, q: bottom)
      index += 1
    }
  }

  func randomSite() -> Int {
    let random = arc4random_uniform(UInt32(self._NSquared-1))
    return Int(random)
  }
}

/// Indice orientation
extension Percolation {

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

/// Neighbors
extension Percolation {

  func isOpen(site: Int) -> Bool {
    return Bool(_sites[site])
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
    return n >= (_NSquared - _N)
  }
}

/// Neighboring
extension Percolation {

  func eastOpen(n: Int) -> Bool {
    guard !isLeftmost(n: n) else { return false }
    return isOpen(site: n-1)
  }

  func westOpen(n: Int) -> Bool {
    guard !isRightmost(n: n) else { return false }
    return isOpen(site: n+1)
  }

  func northOpen(n: Int) -> Bool {
    guard !isOnTop(n: n) else { return false }
    return isOpen(site: n - _N)
  }

  func southOpen(n: Int) -> Bool {
    guard !isOnBottom(n: n) else { return false }
    return isOpen(site: n + _N)
  }
}

extension Percolation: CustomDebugStringConvertible {

  var debugDescription: String {
    return "\(gridDescription)\n\(info)"
  }

  var gridDescription: String {
    var description: String = "Percolation::"
    for (index, value) in _sites.enumerated() {
      // new line begins on the nth = k * n character, where k==>1, 2, 3...
      if index % _N == 0 {
        description = "\(description)\n\(value)" } else {
        description = "\(description)\t\(value)" }
    }
    return description
  }

  var info: String {
    return
      "Percolates?\t\(percolates())\n" +
      "Open Sites:\t\(numberOfOpenSites())\n"
  }
}

extension Percolation {

  func testIndice(title: String, index: Int) -> String {
    var message =
    "\(title)" +
    "\nsrc row col idx"
    let row_     = row(index: index)
    let column_  = column(index: index)
    message = "\(message)\n" +
              "\(index)\t" +
              "\(row_)\t" +
              "\(column_)\t" +
              "\(siteIndex(row: row_, column: column_))"
    return message
  }
}

func testPercolation() {
  var percolation = Percolation(n: 10)
  print(percolation)
  //percolation.testSystem()
  print("\nTESTING...\nCHECK")
  print(percolation.testIndice(title: "NORTHWEST CORNER",
                               index: percolation.cornerNW))
  print(percolation.testIndice(title: "NORTHEAST CORNER",
                               index: percolation.cornerNE))
  print(percolation.testIndice(title: "SOUTHWEST CORNER",
                               index: percolation.cornerSW))
  print(percolation.testIndice(title: "SOUTHEAST CORNER",
                               index: percolation.cornerSE))
  print("\nTESTING...\nOPEN CORNER SITES @ ARRAY BEGIN/END BOUNDARIES")
  percolation.open(index: percolation.cornerNW)
  percolation.open(index: percolation.cornerSE)
  print(percolation)
  print("\nTESTING...\nOPEN REMAINING CORNER SITES")
  percolation.open(index: percolation.cornerNE)
  percolation.open(index: percolation.cornerSW)
  print(percolation)
}

func testFillAndPercolate() {
  var filled = Percolation(n: 3)
  print(filled)
  filled.open(index: 0)
  print(filled)
  filled.open(index: 3)
  print(filled)
  filled.isFull(site: 3)
  filled.open(index: 6)
  print(filled)
  filled.isFull(site: 6)
  print(filled.percolates())
}

/////////////////////////////////////////////Class///////////////////////////
////////////////////////////////////////// Divider ///////////////////////////
//MARK: PercolationStats

protocol Stats {
  func mean()           -> Double
  func stDev()          -> Double
  func confidenceLow()  -> Double
  func confidenceHigh() -> Double
}

struct PercolationStats {

  let _n: Int
  let _trials: Int

  init(n: Int, trials: Int) {
    _trials = trials
    _n      = n
  }

  func run(n: Int) -> Percolation {

    var percolation: Percolation = Percolation(n: n)

    while !percolation.percolates() {
      let site = percolation.randomSite()
      percolation.open(index: site)
    }

    return percolation
  }
}

func testRun(n: Int, trials: Int) {
  let stats = PercolationStats(n: n, trials: trials)
  var runs: [Percolation] = []

  for _ in 0..<trials {
    runs.append(stats.run(n: n))
  }

  let sum = runs.flatMap(){ perc in
      perc.numberOfOpenSites()
    }.reduce(0, +)
  let mean      = Double(sum) / Double(runs.count) // Double(runs.count)

  let squared = runs.flatMap(){ perc in
      let delta = Double(perc.numberOfOpenSites()) - mean
      return pow(delta, 2)
    }.reduce(Double(0), +)
  let variance  = Double(squared) / Double(runs.count)
  let stDev     = sqrt(variance)

  let printout  = String(format: "%.2f\t%.2f\t%.2f", mean, variance, stDev)
  let runNumbers  = runs.flatMap() { perc in perc.numberOfOpenSites() }
  print("N\tTrials\n\(n)\t\(trials)")
  print("mean\tvari \tstDev\n\(printout)")

}
