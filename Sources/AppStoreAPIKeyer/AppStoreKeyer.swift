//
// Copyright © 2020 Alexey Korolev <alphatroya@gmail.com>
//

import ArgumentParser
import Foundation

struct AppStoreJSON: Encodable {
    let keyId: String
    let issuerId: String
    let key: String
    let duration: Int = 1200
    let inHouse: Bool = false
}

struct AppStoreAPIKeyer: ParsableCommand {
    static var configuration = CommandConfiguration(
        commandName: "as-keyer",
        abstract: "A CLI tool to generate app-store.json file for using Fastlane AppStore Connect API",
        version: "0.0.1"
    )

    @Option(help: "Path to .p8 key file", completion: .file(extensions: ["p8"]))
    var input: String

    @Option(help: "Key ID for the p8 file")
    var keyID: String

    @Option(help: "Issuer ID value")
    var issuerID: String

    @Option(help: "Output file location")
    var output: String = "."

    func run() throws {
        let keyData = try Data(contentsOf: URL(fileURLWithPath: input))
        guard let keyString = String(data: keyData, encoding: .utf8) else {
            throw ValidationError("wrong key data to string transformation")
        }

        let replaced = keyString.split(separator: "\n").joined(separator: "\n")

        let json = AppStoreJSON(keyId: keyID, issuerId: issuerID, key: replaced)
        let jsonEncoder = JSONEncoder()
        jsonEncoder.keyEncodingStrategy = .convertToSnakeCase

        let data = try jsonEncoder.encode(json)
        try data.write(to: URL(fileURLWithPath: output).appendingPathComponent("api-key.json"))
    }
}
