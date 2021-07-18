import Algorithms

struct MarkovModel {
  
  var order: Int
  var prior: Double
  private var chains = [Substring: FrequencyMap]()

  init(input: [String], order: Int, prior: Double) {
    self.order = order
    self.prior = prior

    input.forEach {
      let str = String(repeating: "^", count: order) + $0 + "$"

      str.windows(ofCount: order + 1).forEach { window in
        let key = window.dropLast()
        let value = window.last!
        chains[key, default: FrequencyMap()][value, default: prior] += 1
      }
    }
  }

  func generate<T: RandomNumberGenerator>(
    _ context: Substring,
    using generator: inout T
  ) -> Character? {
    chains[context]?.weightedRandom(using: &generator)
  }

}
