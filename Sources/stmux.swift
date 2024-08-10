// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser
import Foundation

let rootDirectory = "\(NSHomeDirectory())/.config/stmux"
let layoutRoot = "\(rootDirectory)/layouts"

@main
struct stmux: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift-based tmux session manager.",
        subcommands: [Check.self, New.self, Load.self, Edit.self],
        defaultSubcommand: Help.self
    )
}

    
   
    
    
