//
//  New.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser
import Foundation

struct New: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "Create a new project."
    )
    
    @Argument(help: "The name of the new project.")
    var projectName: String
    
    func run() throws {
        let exampleFilePath = "\(rootDirectory)/example.toml"
        let projectFilePath = "\(layoutRoot)/\(projectName).toml"
        
        if !FileManager.default.fileExists(atPath: exampleFilePath) {
            print("example.toml not found. WHAT THE HELL DID YOU DO?!")
            throw ExitCode.failure
        }
        
        if FileManager.default.fileExists(atPath: projectFilePath) {
            print("""
            Project already exists.
            come on, figure it out.
            All your friends have figured this out.
            why can't you?
            """)
            throw ExitCode.failure
        }
        
        try FileManager.default.copyItem(atPath: exampleFilePath, toPath: projectFilePath)
        if let editor = ProcessInfo.processInfo.environment["EDITOR"] {
            Terminal.execute(editor, arguments: [projectFilePath])
        } else {
            print("Project \(projectName) created but no editor defined.")
        }
    }
}
