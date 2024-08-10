//
//  NewSession.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser

 struct NewSession: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Creates a new resource."
        )
        
        @Argument(help: "The name of the new resource.")
        var name: String
        
        @Option(name: .shortAndLong, help: "The content of the new resource.")
        var content: String
        
        func run() throws {
            print("Creating new resource: \(name) with content: \(content)")
        }
    }
