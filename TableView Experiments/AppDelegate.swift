//
//  AppDelegate.swift
//  TableView Experiments
//
//  Created by Edward Loveall on 10/15/16.
//  Copyright © 2016 Edward Loveall. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
  var mainWindowController: MainWindowController?

  func applicationDidFinishLaunching(_ notification: Notification) {
    let mainWindowController = MainWindowController()
    mainWindowController.showWindow(self)
    self.mainWindowController = mainWindowController
  }
}
