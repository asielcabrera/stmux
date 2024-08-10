//
//  Load.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser
import Foundation

struct Load: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Load a project."
    )
    
    @Argument(help: "The name of the project to load.")
    var projectName: String
    
    func run() throws {
        let configFilePath = "\(layoutRoot)/\(projectName).toml"
        if !FileManager.default.fileExists(atPath: configFilePath) {
            print("Project not found.")
            throw ExitCode.failure
        }
        
        let config = try Tmux.loadConfig(from: configFilePath)
        let tmux = Tmux(config: config)
        tmux.startSession()
    }
}
