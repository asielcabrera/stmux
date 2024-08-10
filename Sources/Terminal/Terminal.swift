//
//  Terminal.swift
//  stmux
//
//  Created by Asiel Cabrera Gonzalez on 8/10/24.
//

import Foundation

struct Terminal {
    @discardableResult
    static func execute(_ command: String, arguments: [String] = []) -> String {
        let process = Process()
        process.executableURL = URL(fileURLWithPath: "/usr/bin/env")
        process.arguments = [command] + arguments

        let pipe = Pipe()
        process.standardOutput = pipe
        process.standardError = pipe

        do {
            try process.run()
        } catch {
            return "Failed to run command: \(error)"
        }

        let data = pipe.fileHandleForReading.readDataToEndOfFile()
        let output = String(data: data, encoding: .utf8) ?? ""
        return output.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}
