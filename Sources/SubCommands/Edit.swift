//
//  Edit.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser
import Foundation

struct Edit: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Edit a project."
    )
    
    @Argument(help: "The name of the project to edit.")
    var projectName: String
    
    func run() throws {
        let filePath = "\(layoutRoot)/\(projectName).toml"
        if !FileManager.default.fileExists(atPath: filePath) {
            print("""
            Project not found.
            Did you spell it right?
            or did you mess this up, like you always do?
            """)
            throw ExitCode.failure
        }
        if let editor = ProcessInfo.processInfo.environment["EDITOR"] {
            Terminal.execute(editor, arguments: [filePath])
        } else {
            print("No editor defined. Set the EDITOR environment variable.")
        }
    }
}
