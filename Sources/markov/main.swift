import Foundation
import ArgumentParser
import AndreyAndreyevich

struct Markov: ParsableCommand {

  @Option(name: .shortAndLong)
  var count: Int?

  @Option(name: .shortAndLong)
  var order: Int?

  @Option(name: .shortAndLong)
  var prior: Double?

  @Argument
  var input: [String]

  mutating func run() throws {
    let order = self.order ?? 2
    let prior = self.prior ?? 0
    let count = self.count ?? 10
    let markov = AndreyAndreyevich(input: input, order: order, prior: prior)

    for _ in 0..<count {
      print(markov.generate())
    }
  }
  
}

Markov.main()
