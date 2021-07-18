import AndreyAndreyevich
import Benchmark

let input = "abra aerodactyl alakazam arbok arcanine articuno beedrill bellsprout blastoise bulbasaur butterfree caterpie chansey charizard charmander charmeleon clefable clefairy cloyster cubone dewgong diglett ditto dodrio doduo dragonair dragonite dratini drowzee dugtrio eevee ekans electabuzz electrode exeggcute exeggutor farfetchd fearow flareon gastly gengar geodude gloom golbat goldeen golduck golem graveler grimer growlithe gyarados haunter hitmonchan hitmonlee horsea hypno ivysaur jigglypuff jolteon jynx kabuto kabutops kadabra kakuna kangaskhan kingler koffing krabby lapras lickitung machamp machoke machop magikarp magmar magnemite magneton mankey marowak meowth metapod mew mewtwo mime moltres muk nidoking nidoqueen nidoran nidoran nidorina nidorino ninetales oddish omanyte omastar onix paras parasect persian pidgeot pidgeotto pidgey pikachu pinsir poliwag poliwhirl poliwrath ponyta porygon primeape psyduck raichu rapidash raticate rattata rhydon rhyhorn sandshrew sandslash scyther seadra seaking seel shellder slowbro slowpoke snorlax spearow squirtle starmie staryu tangela tauros tentacool tentacruel vaporeon venomoth venonat venusaur victreebel vileplume voltorb vulpix wartortle weedle weepinbell weezing wigglytuff zapdos zubat"
  .split(separator: " ")
  .map(String.init)

benchmark("model generation order 2") {
  _ = AndreyAndreyevich(input: input, order: 2, prior: 0.05)
}

benchmark("model generation order 3") {
  _ = AndreyAndreyevich(input: input, order: 3, prior: 0.05)
}

let markov2 = AndreyAndreyevich(input: input, order: 2, prior: 0.05)
benchmark("name generation with model order 2 prior 0.05") {
  _ = markov2.generate()
}

let markov3 = AndreyAndreyevich(input: input, order: 3, prior: 0.05)
benchmark("name generation with model order 3 prior 0.05") {
  _ = markov3.generate()
}

let markov2prior0 = AndreyAndreyevich(input: input, order: 2, prior: 0)
benchmark("name generation with model order 2 prior 0.0") {
  _ = markov2prior0.generate()
}

let markov3prior0 = AndreyAndreyevich(input: input, order: 3, prior: 0)
benchmark("name generation with model order 3 prior 0.0") {
  _ = markov3prior0.generate()
}

Benchmark.main()
