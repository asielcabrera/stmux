//
//  DeleteSession.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser

struct DeleteSession: ParsableCommand {
        static let configuration = CommandConfiguration(
            abstract: "Deletes a resource."
        )
        
        @Argument(help: "The name of the resource to delete.")
        var name: String
        
        func run() throws {
            print("Deleting resource: \(name)")
        }
    }


