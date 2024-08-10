//
//  Check.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser
import Foundation

struct Check: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Check if a project exists."
    )
    
    @Argument(help: "The name of the project to check.")
    var projectName: String
    
    func run() throws {
        print("Checking for project \(projectName)")
        let filePath = "\(layoutRoot)/\(projectName).toml"
        print(filePath)
        if !FileManager.default.fileExists(atPath: filePath) {
            print("""
            Project not found.
            Did you spell it right?
            or did you mess this up, like you always do?
            """)
            throw ExitCode.failure
        }
    }
}
