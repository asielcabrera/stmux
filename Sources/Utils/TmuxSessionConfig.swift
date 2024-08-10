//
//  TmuxSessionConfig.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//


import Foundation
import TOMLDecoder

struct TmuxSessionConfig: Codable {
    var sessionName: String
    var rootDirectory: String
    var windows: [TmuxWindowConfig]
    var activeWindow: Int
}

struct TmuxWindowConfig: Codable {
    var windowName: String
    var panes: [TmuxPaneConfig]
}

struct TmuxPaneConfig: Codable {
    var commands: [String]
    var split: String? // vertical or horizontal
}