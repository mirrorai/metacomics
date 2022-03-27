import Foundation
import Photos
import UIKit

enum TokenAPIError: Error {
    case apiUrlError
    case serverError
    case jsonError
}

class GetTokensAPI {

    lazy var hostname: String = {
        return "https://eth-mainnet.alchemyapi.io/v2/3QbPWtL5fxHLjcnVIKmuroAF01g6bihR"
//        return "https://eth-rinkeby.alchemyapi.io/v2/XumJjnNzRjAI7hB9_IYDhrHdjChHTm2C"
    }()

    func getTokens(walletId: String, completion: @escaping (Swift.Result<[TokenInfo], Error>) -> Void) {
        let apiUrlString = "\(hostname)/getNFTs/?owner=\(walletId)"
        guard let url = URL(string: apiUrlString) else {
            completion(.failure(TokenAPIError.apiUrlError))
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let _ = error {
                completion(.failure(TokenAPIError.serverError))
            } else if let data = data, let response = response as? HTTPURLResponse {
                if response.statusCode == 200,
                    let result: GetTokensModelInfo = try? JSONDecoder().decode(GetTokensModelInfo.self, from: data) {
                    completion(.success(result.ownedNfts))
                } else {
                    completion(.failure(TokenAPIError.serverError))
                }
            } else {
                completion(.failure(TokenAPIError.serverError))
            }
        }

        task.resume()
    }

}
