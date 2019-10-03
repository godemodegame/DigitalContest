import Foundation

struct MarioModelView: Identifiable {
    let id: Int
    let name: String
    let length: String
    let damages: [MarioModelView.PipeDamage]
    
    struct PipeDamage: Identifiable {
        let id: Int
        let name: String
        let location: String
    }
}
