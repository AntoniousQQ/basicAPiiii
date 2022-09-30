// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? newJSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation


struct Nasa: Codable {
    let date: String?
    let explanation: String?
    let hdurl: String?
    let mediaType: String?
    let serviceVersion: String?
    let title: String?
    let url: String?
}
