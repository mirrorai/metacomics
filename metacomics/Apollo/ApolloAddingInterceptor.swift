import Foundation
import Apollo

class TokenAddingInterceptor: ApolloInterceptor {
    func interceptAsync<Operation: GraphQLOperation>(
        chain: RequestChain,
        request: HTTPRequest<Operation>,
        response: HTTPResponse<Operation>?,
        completion: @escaping (Result<GraphQLResult<Operation.Data>, Error>) -> Void) {

            let key = UserDefaults.DefaultsKeys.authenticateAccessToken.rawValue
            if let token = UserDefaults.standard.string(forKey: key) {
                request.addHeader(name: "x-access-token", value: "Bearer \(token)")
            } // else do nothing

            chain.proceedAsync(
                request: request,
                response: response,
                completion: completion
            )
    }
}
