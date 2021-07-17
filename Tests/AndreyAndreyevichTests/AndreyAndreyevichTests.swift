import XCTest
import AndreyAndreyevich
import SnapshotTesting

final class AndreyAndreyevichTests: XCTestCase {

  let input = "abra aerodactyl alakazam arbok arcanine articuno beedrill bellsprout blastoise bulbasaur butterfree caterpie chansey charizard charmander charmeleon clefable clefairy cloyster cubone dewgong diglett ditto dodrio doduo dragonair dragonite dratini drowzee dugtrio eevee ekans electabuzz electrode exeggcute exeggutor farfetchd fearow flareon gastly gengar geodude gloom golbat goldeen golduck golem graveler grimer growlithe gyarados haunter hitmonchan hitmonlee horsea hypno ivysaur jigglypuff jolteon jynx kabuto kabutops kadabra kakuna kangaskhan kingler koffing krabby lapras lickitung machamp machoke machop magikarp magmar magnemite magneton mankey marowak meowth metapod mew mewtwo mime moltres muk nidoking nidoqueen nidoran nidoran nidorina nidorino ninetales oddish omanyte omastar onix paras parasect persian pidgeot pidgeotto pidgey pikachu pinsir poliwag poliwhirl poliwrath ponyta porygon primeape psyduck raichu rapidash raticate rattata rhydon rhyhorn sandshrew sandslash scyther seadra seaking seel shellder slowbro slowpoke snorlax spearow squirtle starmie staryu tangela tauros tentacool tentacruel vaporeon venomoth venonat venusaur victreebel vileplume voltorb vulpix wartortle weedle weepinbell weezing wigglytuff zapdos zubat".split(separator: " ").map(String.init)

  func testSimpleGen() throws {
    var rng = SplitMix64(seed: 42)
    let markov = AndreyAndreyevich(input: input, order: 2, prior: 0.0)
    let result = (1...100).map { _ in markov.generate(using: &rng) }
    assertSnapshot(matching: result, as: .description)
  }

  func testGenWithPrior() throws {
    var rng = SplitMix64(seed: 42)
    let markov = AndreyAndreyevich(input: input, order: 2, prior: 0.05)
    let result = (1...100).map { _ in markov.generate(using: &rng) }
    assertSnapshot(matching: result, as: .description)
  }

}
