import Apollo
import Foundation

class ApolloNetwork {
    static let shared = ApolloNetwork()
    
    private(set) lazy var client: ApolloClient = {
            let client = URLSessionClient()
            let cache = InMemoryNormalizedCache()
            let store = ApolloStore(cache: cache)
            let provider = NetworkInterceptorProvider(client: client, store: store)
            let url = URL(string: "https://api-mumbai.lens.dev/")!
            let transport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                         endpointURL: url)
            return ApolloClient(networkTransport: transport, store: store)
        }()
    
    init() {
      
    }
    
    
}
