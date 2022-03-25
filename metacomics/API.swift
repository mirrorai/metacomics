// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

/// The signed auth challenge
public struct SignedAuthChallenge: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - address: The ethereum address you signed the signature with
  ///   - signature: The signature
  public init(address: String, signature: String) {
    graphQLMap = ["address": address, "signature": signature]
  }

  /// The ethereum address you signed the signature with
  public var address: String {
    get {
      return graphQLMap["address"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }

  /// The signature
  public var signature: String {
    get {
      return graphQLMap["signature"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "signature")
    }
  }
}

/// The challenge request
public struct ChallengeRequest: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - address: The ethereum address you want to login with
  public init(address: String) {
    graphQLMap = ["address": address]
  }

  /// The ethereum address you want to login with
  public var address: String {
    get {
      return graphQLMap["address"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "address")
    }
  }
}

public final class AuthenticateMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Authenticate($request: SignedAuthChallenge!) {
      authenticate(request: $request) {
        __typename
        accessToken
        refreshToken
      }
    }
    """

  public let operationName: String = "Authenticate"

  public var request: SignedAuthChallenge

  public init(request: SignedAuthChallenge) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("authenticate", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(Authenticate.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(authenticate: Authenticate) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "authenticate": authenticate.resultMap])
    }

    public var authenticate: Authenticate {
      get {
        return Authenticate(unsafeResultMap: resultMap["authenticate"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "authenticate")
      }
    }

    public struct Authenticate: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthenticationResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("accessToken", type: .nonNull(.scalar(String.self))),
          GraphQLField("refreshToken", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(accessToken: String, refreshToken: String) {
        self.init(unsafeResultMap: ["__typename": "AuthenticationResult", "accessToken": accessToken, "refreshToken": refreshToken])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The access token
      public var accessToken: String {
        get {
          return resultMap["accessToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "accessToken")
        }
      }

      /// The refresh token
      public var refreshToken: String {
        get {
          return resultMap["refreshToken"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "refreshToken")
        }
      }
    }
  }
}

public final class GenerateChallengeQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GenerateChallenge($request: ChallengeRequest!) {
      challenge(request: $request) {
        __typename
        text
      }
    }
    """

  public let operationName: String = "GenerateChallenge"

  public var request: ChallengeRequest

  public init(request: ChallengeRequest) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("challenge", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(Challenge.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(challenge: Challenge) {
      self.init(unsafeResultMap: ["__typename": "Query", "challenge": challenge.resultMap])
    }

    public var challenge: Challenge {
      get {
        return Challenge(unsafeResultMap: resultMap["challenge"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "challenge")
      }
    }

    public struct Challenge: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AuthChallengeResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("text", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(text: String) {
        self.init(unsafeResultMap: ["__typename": "AuthChallengeResult", "text": text])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The text to sign
      public var text: String {
        get {
          return resultMap["text"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "text")
        }
      }
    }
  }
}

public final class PingQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query Ping {
      ping
    }
    """

  public let operationName: String = "Ping"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("ping", type: .nonNull(.scalar(String.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(ping: String) {
      self.init(unsafeResultMap: ["__typename": "Query", "ping": ping])
    }

    public var ping: String {
      get {
        return resultMap["ping"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "ping")
      }
    }
  }
}
