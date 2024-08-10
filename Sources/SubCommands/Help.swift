//
//  Help.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import ArgumentParser

struct Help: ParsableCommand {
    func run() throws {
        print("""
        oh you need help? man. what a loser.
        Just kidding, here is some info

        \(layoutRoot) is the directory where all the layouts are stored
        \(rootDirectory) is the file where the default layout is stored

        Usage:
          -h, --help: show this help message
          check, check_for_project: [project_name] check if a project exists [project_name]
          new, new_project: [project_name] create a new project with name [project_name]
          load, load_project: [project_name] load a project with name [project_name]
        """)
    }
}
