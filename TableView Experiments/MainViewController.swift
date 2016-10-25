import Cocoa

class MainViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {
  @IBOutlet weak var tableView: NSTableView!
  var views = [PlayerViewController]()

  override func viewDidLoad() {
    super.viewDidLoad()
    let playerNib = NSNib(nibNamed: "PlayerViewController", bundle: nil)
    self.tableView.register(playerNib, forIdentifier: "player")
    guard
      let player1 = PlayerViewController(nibName: "PlayerViewController", bundle: nil)
    else {
      return
    }
    views.append(player1)
    tableView.reloadData()
  }

  func numberOfRows(in tableView: NSTableView) -> Int {
    return views.count
  }

  func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
    return tableView.make(withIdentifier: "player", owner: self)
  }

  @IBAction func addPlayer(_ sender: NSMenuItem) {
    guard
      let player1 = PlayerViewController(nibName: "PlayerViewController", bundle: nil)
    else {
      return
    }
    views.append(player1)
  }
}
