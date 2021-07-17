import Collections

public struct AndreyAndreyevich {

  private var generator: ActualGenerator

  public init(input: [String], order: Int, prior: Double) {
    self.generator = ActualGenerator(input: input, order: order, prior: prior)
  }

  public func generate() -> String {
    var rng = SystemRandomNumberGenerator()
    return generate(using: &rng)
  }

  public func generate<T: RandomNumberGenerator>(
    using randomGenerator: inout T
  ) -> String {
    self.generator.generate(using: &randomGenerator)
  }

}
