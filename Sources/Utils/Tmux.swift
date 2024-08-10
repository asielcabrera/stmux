//
//  Tmux.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import Foundation
import TOMLDecoder

struct Tmux {
    let config: TmuxSessionConfig

    init(config: TmuxSessionConfig) {
        self.config = config
    }

    func newSession() {
        let rootDir = URL(fileURLWithPath: config.rootDirectory).path
        Terminal.execute("tmux", arguments: ["new-session", "-d", "-s", config.sessionName, "-c", rootDir])
    }

    func createWindows() {
        for (index, window) in config.windows.enumerated() {
            if index == 0 {
                Terminal.execute("tmux", arguments: ["rename-window", "-t", "\(config.sessionName):0", window.windowName])
            } else {
                Terminal.execute("tmux", arguments: ["new-window", "-t", config.sessionName, "-n", window.windowName])
            }
            setupPanes(for: window, inWindow: index)
        }
    }

    func setupPanes(for window: TmuxWindowConfig, inWindow windowIndex: Int) {
        for (paneIndex, pane) in window.panes.enumerated() {
            if paneIndex == 0 {
                executeCommands(in: pane, windowIndex: windowIndex, paneIndex: paneIndex)
            } else {
                if let split = pane.split {
                    let splitFlag = split == "vertical" ? "-v" : "-h"
                    Terminal.execute("tmux", arguments: ["split-window", splitFlag, "-t", "\(config.sessionName):\(windowIndex).\(paneIndex - 1)"])
                }
                executeCommands(in: pane, windowIndex: windowIndex, paneIndex: paneIndex)
            }
        }
    }

    func executeCommands(in pane: TmuxPaneConfig, windowIndex: Int, paneIndex: Int) {
        for command in pane.commands {
            Terminal.execute("tmux", arguments: ["send-keys", "-t", "\(config.sessionName):\(windowIndex).\(paneIndex)", command, "C-m"])
        }
    }

    func attachSession() {
        Terminal.execute("tmux", arguments: ["select-window", "-t", "\(config.sessionName):\(config.activeWindow)"])
        Terminal.execute("tmux", arguments: ["attach-session", "-t", config.sessionName])
    }

    func startSession() {
        newSession()
        createWindows()
        attachSession()
    }

    static func loadConfig(from file: String) throws -> TmuxSessionConfig {
        let data = try Data(contentsOf: URL(fileURLWithPath: file))
        return try TOMLDecoder().decode(TmuxSessionConfig.self, from: data)
    }
}
