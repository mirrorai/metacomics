import Foundation

struct ProfileItemInfo: Codable {
    var id: String
    var handle: String
    var ownedBy: String
    
    static let stubProfile = ProfileItemInfo(
        id: "0x024b",
        handle: "testuser1",
        ownedBy: "0xC3a29b394133C0802867D443072F0FE011d9D11e"
    )
    static let stubFiendProfiles = [
        ProfileItemInfo(
            id: "0x0285",
            handle: "testuser4",
            ownedBy: "0x58Ae6515A2d8464cbDb3d68ff3a5B1B4c774e9e2"
        ),
        ProfileItemInfo(
            id: "0x0284",
            handle: "testuser3",
            ownedBy: "0xC3a29b394133C0802867D443072F0FE011d9D11e"
        )
    ]
}
