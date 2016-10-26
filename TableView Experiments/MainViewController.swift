import Cocoa

class MainViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  @IBOutlet weak var tableView: NSTableView!
  var players = [Player]()

  override func viewDidLoad() {
    super.viewDidLoad()
    let player = Player(name: "Hello", initiative: 10, order: players.count)
    players.append(player)
    tableView.reloadData()
  }

  func numberOfRows(in tableView: NSTableView) -> Int {
    return players.count
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    let player = players[row]
    if let view = tableView.make(withIdentifier: "player", owner: nil) as? PlayerView {
      view.initative.intValue = Int32(player.initiative)
      view.name.stringValue = player.name
      return view
    }
    
    return nil
  }

  @IBAction func addPlayer(_ sender: NSMenuItem) {
    let player = Player(name: "Hello", initiative: 10, order: players.count)
    players.append(player)
    tableView.reloadData()
  }
}
