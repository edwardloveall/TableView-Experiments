import Cocoa

class MainViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  @IBOutlet weak var tableView: NSTableView!

  var combatants = [Combatant]()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  func numberOfRows(in tableView: NSTableView) -> Int {
    return combatants.count
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let combatant = combatants[row]

    switch combatant {
    case is Player:
      return configurePlayerView(player: combatant)
    case is Creature:
      return configureCreatureView(creature: combatant)
    default:
      return nil
    }
  }

  @IBAction func addPlayer(_ sender: NSMenuItem) {
    let player = Player(name: "Hello", initiative: 10, order: combatants.count)
    combatants.append(player)
    tableView.reloadData()
  }

  @IBAction func addCreature(_ sender: NSMenuItem) {
    let creature = Creature(name: "Goodbye", initiative: 11, order: combatants.count)
    combatants.append(creature)
    tableView.reloadData()
  }

  func configurePlayerView(player: Combatant) -> PlayerView? {
    guard let player = player as? Player
          else { fatalError("could not create Player") }
    let playerView = tableView.make(withIdentifier: "player", owner: self) as? PlayerView

    playerView?.initative.integerValue = player.initiative
    playerView?.name.stringValue = player.name

    return playerView
  }

  func configureCreatureView(creature: Combatant) -> CreatureView? {
    guard let creature = creature as? Creature
          else { fatalError("could not create Creature") }
    let creatureView = tableView.make(withIdentifier: "creature", owner: self) as? CreatureView

    creatureView?.initative.integerValue = creature.initiative
    creatureView?.name.stringValue = creature.name
    creatureView?.hitPoints.integerValue = creature.hitPoints

    return creatureView
  }
}
