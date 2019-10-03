import Foundation

struct Pipe: Codable {
    let id: Int
    let name: String
    let length: Double
    let defects: [PipeDamage]?
}

struct PipeDamage: Codable {
    let defect_type: String
    let distance: Double
}
