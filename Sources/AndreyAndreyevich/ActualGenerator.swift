import Foundation

struct ActualGenerator {

  var order: Int
  var prior: Double
  var models: [MarkovModel]

  init(input: [String], order: Int, prior: Double) {
    self.order = order
    self.prior = prior

    self.models = (0..<order).map {
      MarkovModel(input: input, order: order - $0, prior: prior)
    }
  }

  func generate<T: RandomNumberGenerator>(
    using randomGenerator: inout T
  ) -> String {
    var word = Substring(repeating: "^", count: order)

    while word.last != "$" {
      guard let letter = nextLetter(for: word, using: &randomGenerator) else {
        continue
      }
      word.append(letter)
    }

    return String(word.filter { $0 != "^" && $0 != "$" })
  }

  private func nextLetter<T: RandomNumberGenerator>(
    for word: Substring,
    using randomGenerator: inout T
  ) -> Character? {
    var context = word.suffix(order)
    for model in models {
      if let letter = model.generate(context, using: &randomGenerator) {
        return letter
      } else {
        context.removeFirst()
      }
    }
    return nil
  }

}
