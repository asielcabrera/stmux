//
//  EditSession.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser

struct EditSession: ParsableCommand {
    static let configuration = CommandConfiguration(
            abstract: "Edits a resource."
        )
        
        @Argument(help: "The name of the resource to edit.")
        var name: String
        
        @Option(name: .shortAndLong, help: "The new content to replace the old one.")
        var content: String
        
        func run() throws {
            print("Editing resource: \(name) with new content: \(content)")
        }
    }
