import Foundation
import UIKit

struct TokenInfo: Codable {
    
    var contract: TokenContractModelInfo
    var id: TokenIdModelInfo
    var title: String
    var description: String
    var tokenUri: TokenIdTokenUriModelInfo
    var metadata: TokenIdMetadataModelInfo
    
    static let base64ApplicationJsonPrefix = "data:application/json;base64,"
    static let utf8ApplicationJsonPrefix = "data:application/json;utf8,"
    static let base64ImageSvgPrefix = "data:image/svg+xml;base64,"
    
    var imageUrl: URL? {
        if let url = imageUrl(from: metadata) {
            return url
        } else {
            let tokenUriRaw = tokenUri.raw
            if tokenUriRaw.hasPrefix(TokenInfo.base64ApplicationJsonPrefix) {
                let dataString = tokenUriRaw.replacingOccurrences(
                    of: TokenInfo.base64ApplicationJsonPrefix,
                    with: ""
                )
                if let data = Data(base64Encoded: dataString),
                   let result: TokenIdMetadataModelInfo = try? JSONDecoder().decode(TokenIdMetadataModelInfo.self, from: data) {
                    return imageUrl(from: result)
                }
            } else if tokenUriRaw.hasPrefix(TokenInfo.utf8ApplicationJsonPrefix) {
                let dataString = tokenUriRaw.replacingOccurrences(
                    of: TokenInfo.utf8ApplicationJsonPrefix,
                    with: ""
                )
                if let data = dataString.data(using: .utf8),
                   let result: TokenIdMetadataModelInfo = try? JSONDecoder().decode(TokenIdMetadataModelInfo.self, from: data) {
                    return imageUrl(from: result)
                }
            }
        }
        return nil
    }
    
    func imageUrl(from metadata: TokenIdMetadataModelInfo) -> URL? {
        if let imageUrlString = metadata.image {
            if imageUrlString.hasPrefix("ipfs://") {
                let httpImageUrlString = imageUrlString.replacingOccurrences(
                    of: "ipfs://",
                    with: "https://cloudflare-ipfs.com/ipfs/"
                )
                return URL(string: httpImageUrlString)
            } else if imageUrlString.hasPrefix(TokenInfo.base64ImageSvgPrefix) {
                let dataString = imageUrlString.replacingOccurrences(
                    of: TokenInfo.base64ImageSvgPrefix,
                    with: ""
                )
                if let data = Data(base64Encoded: dataString) {
//                    return
                }
                return nil
            } else {
                return URL(string: imageUrlString)
            }
        }
        return nil
    }
    
    var image: UIImage? {
        if let image = image(from: metadata) {
            return image
        } else {
            let tokenUriRaw = tokenUri.raw
            if tokenUriRaw.hasPrefix(TokenInfo.base64ApplicationJsonPrefix) {
                let dataString = tokenUriRaw.replacingOccurrences(
                    of: TokenInfo.base64ApplicationJsonPrefix,
                    with: ""
                )
                if let data = Data(base64Encoded: dataString),
                   let result: TokenIdMetadataModelInfo = try? JSONDecoder().decode(TokenIdMetadataModelInfo.self, from: data) {
                    return image(from: result)
                }
            } else if tokenUriRaw.hasPrefix(TokenInfo.utf8ApplicationJsonPrefix) {
                let dataString = tokenUriRaw.replacingOccurrences(
                    of: TokenInfo.utf8ApplicationJsonPrefix,
                    with: ""
                )
                if let data = dataString.data(using: .utf8),
                   let result: TokenIdMetadataModelInfo = try? JSONDecoder().decode(TokenIdMetadataModelInfo.self, from: data) {
                    return image(from: result)
                }
            }
        }
        return nil
    }
    
    func image(from metadata: TokenIdMetadataModelInfo) -> UIImage? {
        if let imageUrlString = metadata.image {
            if imageUrlString.hasPrefix(TokenInfo.base64ImageSvgPrefix) {
                let dataString = imageUrlString.replacingOccurrences(
                    of: TokenInfo.base64ImageSvgPrefix,
                    with: ""
                )
                if let data = Data(base64Encoded: dataString) {
                    return UIImage(data: data)
                }
                return nil
            }
        }
        return nil
    }
    
}

struct TokenContractModelInfo: Codable {
    var address: String
}

struct TokenIdModelInfo: Codable {
    var tokenId: String
    var tokenMetadata: TokenMetadataModelInfo
}

struct TokenMetadataModelInfo: Codable {
    var tokenType: String
}

struct TokenIdTokenUriModelInfo: Codable {
    var raw: String
    var gateway: String
}

struct TokenIdMetadataModelInfo: Codable {
    var image: String?
}

struct GetTokensModelInfo: Codable {
    
    var ownedNfts: [TokenInfo]
    var totalCount: Int
    var blockHash: String
    
}
