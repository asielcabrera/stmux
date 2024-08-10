// The Swift Programming Language
// https://docs.swift.org/swift-book

import ArgumentParser


@main
struct stmux: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift CLI tool with load, edit, new, and delete commands.",
        subcommands: [LoadSession.self, NewSession.self, EditSession.self,
            DeleteSession.self],
        defaultSubcommand: LoadSession.self)
}

    
   
    
    
