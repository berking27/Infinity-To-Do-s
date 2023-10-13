//
//  Logger.swift
//  InfinityTo-Do's
//
//  Created by Berkin Koca on 25.08.2023.
//

import Foundation

enum Log {
    enum LogLevel {
        case info
        case warning
        case error

        fileprivate var prefix: String {
            switch self {
            case .info: return "INFO"
            case .warning: return "WARN ⚠️"
            case .error: return "ALERT ❌"
            }
        }
    }

    struct Context {
        let file: String
        let function: String
        let line: Int
        var description: String {
            "\((file as NSString).lastPathComponent):\(line) \(function)"
        }
    }

    static func info(_ str: String,
                     shouldLogContext: Bool = true,
                     file: String = #file,
                     function: String = #function,
                     line: Int = #line)
    {
        let context: Context = .init(file: file, function: function, line: line)
        Log.handleLog(level: .info, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }

    static func warning(_ str: String,
                        shouldLogContext: Bool = true,
                        file: String = #file,
                        function: String = #function,
                        line: Int = #line)
    {
        let context: Context = .init(file: file, function: function, line: line)
        Log.handleLog(level: .warning, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }

    static func error(_ str: String,
                      shouldLogContext: Bool = true,
                      file: String = #file,
                      function: String = #function,
                      line: Int = #line)
    {
        let context: Context = .init(file: file, function: function, line: line)
        Log.handleLog(level: .error, str: str.description, shouldLogContext: shouldLogContext, context: context)
    }

    fileprivate static func handleLog(level: LogLevel, str: String, shouldLogContext: Bool, context: Context) {
        let logCompanents: [String] = ["[\(level.prefix)]", str]
        var fullString = logCompanents.joined(separator: " ")
        if shouldLogContext {
            fullString += " -> \(context.description)"
        }
        #if DEBUG
        // swiftlint:disable:next print_statements
            print(fullString)
        #endif
    }
}


