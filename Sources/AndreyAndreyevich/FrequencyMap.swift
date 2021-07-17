import Collections

typealias FrequencyMap = OrderedDictionary<Character, Double>

extension FrequencyMap {

  func weightedRandom() -> Character? {
    var generator = SystemRandomNumberGenerator()
    return weightedRandom(using: &generator)
  }

  func weightedRandom<T: RandomNumberGenerator>(
    using generator: inout T
  ) -> Character? {
    let frequencies = elements.map(\.value)
    let sum = frequencies.reduce(0, +)
    let rnd = Double.random(in: 0..<sum, using: &generator)
    var acc = 0.0
    for (i, p) in frequencies.enumerated() {
      acc += p
      if rnd < acc {
        return elements[i].key
      }
    }
    return elements[frequencies.count - 1].key
  }

}
