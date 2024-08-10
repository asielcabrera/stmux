//
//  LoadSession.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser

struct LoadSession: ParsableCommand {
    static let configuration = CommandConfiguration(abstract: "Load Session")

    @Argument(help: "")
        var name: String


    public func run() throws {
        print("Loading resource: \(name)")
    }
}
