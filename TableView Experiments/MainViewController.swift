//
//  MainViewController.swift
//  TableView Experiments
//
//  Created by Edward Loveall on 10/15/16.
//  Copyright © 2016 Edward Loveall. All rights reserved.
//

import Cocoa

class MainViewController: NSViewController {
  override func viewDidLoad() {
    super.viewDidLoad()
    view.wantsLayer = true
    view.layer?.backgroundColor = NSColor.red.cgColor
  }
}
