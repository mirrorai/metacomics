import Apollo
import Foundation

class Apollo {
    static let shared = Apollo()
    let client: ApolloClient
    init() {
      client = ApolloClient(url: URL(string: "https://api-mumbai.lens.dev/")!)
    }
    
    
}
