class Creature: Combatant {
  var name: String
  var initiative: Int
  var order: Int
  var hitPoints: Int

  init(name: String, initiative: Int = 0, order: Int, hitPoints: Int = 0) {
    self.name = name
    self.initiative = initiative
    self.order = order
    self.hitPoints = hitPoints
  }
}
