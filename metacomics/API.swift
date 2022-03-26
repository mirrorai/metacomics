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

public struct CreateProfileRequest: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - handle
  ///   - profilePictureUri: The profile picture uri
  ///   - followModule: The follow module
  ///   - followNfturi: The follow NFT URI is the NFT metadata your followers will mint when they follow you. This can be updated at all times. If you do not pass in anything it will create a super cool changing NFT which will show the last publication of your profile as the NFT which looks awesome! This means people do not have to worry about writing this logic but still have the ability to customise it for their followers
  public init(handle: String, profilePictureUri: Swift.Optional<String?> = nil, followModule: Swift.Optional<FollowModuleParams?> = nil, followNfturi: Swift.Optional<String?> = nil) {
    graphQLMap = ["handle": handle, "profilePictureUri": profilePictureUri, "followModule": followModule, "followNFTURI": followNfturi]
  }

  public var handle: String {
    get {
      return graphQLMap["handle"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "handle")
    }
  }

  /// The profile picture uri
  public var profilePictureUri: Swift.Optional<String?> {
    get {
      return graphQLMap["profilePictureUri"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profilePictureUri")
    }
  }

  /// The follow module
  public var followModule: Swift.Optional<FollowModuleParams?> {
    get {
      return graphQLMap["followModule"] as? Swift.Optional<FollowModuleParams?> ?? Swift.Optional<FollowModuleParams?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "followModule")
    }
  }

  /// The follow NFT URI is the NFT metadata your followers will mint when they follow you. This can be updated at all times. If you do not pass in anything it will create a super cool changing NFT which will show the last publication of your profile as the NFT which looks awesome! This means people do not have to worry about writing this logic but still have the ability to customise it for their followers
  public var followNfturi: Swift.Optional<String?> {
    get {
      return graphQLMap["followNFTURI"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "followNFTURI")
    }
  }
}

public struct FollowModuleParams: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - feeFollowModule: The follower fee follower module
  ///   - emptyFollowModule: The empty follow module
  public init(feeFollowModule: Swift.Optional<FeeFollowModuleParams?> = nil, emptyFollowModule: Swift.Optional<Bool?> = nil) {
    graphQLMap = ["feeFollowModule": feeFollowModule, "emptyFollowModule": emptyFollowModule]
  }

  /// The follower fee follower module
  public var feeFollowModule: Swift.Optional<FeeFollowModuleParams?> {
    get {
      return graphQLMap["feeFollowModule"] as? Swift.Optional<FeeFollowModuleParams?> ?? Swift.Optional<FeeFollowModuleParams?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "feeFollowModule")
    }
  }

  /// The empty follow module
  public var emptyFollowModule: Swift.Optional<Bool?> {
    get {
      return graphQLMap["emptyFollowModule"] as? Swift.Optional<Bool?> ?? Swift.Optional<Bool?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "emptyFollowModule")
    }
  }
}

public struct FeeFollowModuleParams: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount: The follow module amount info
  ///   - recipient: The follow module recipient address
  public init(amount: ModuleFeeAmountParams, recipient: String) {
    graphQLMap = ["amount": amount, "recipient": recipient]
  }

  /// The follow module amount info
  public var amount: ModuleFeeAmountParams {
    get {
      return graphQLMap["amount"] as! ModuleFeeAmountParams
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
    }
  }

  /// The follow module recipient address
  public var recipient: String {
    get {
      return graphQLMap["recipient"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "recipient")
    }
  }
}

public struct ModuleFeeAmountParams: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - currency: The currency address
  ///   - value: Floating point number as string (e.g. 42.009837). It could have the entire precision of the Asset or be truncated to the last significant decimal.
  public init(currency: String, value: String) {
    graphQLMap = ["currency": currency, "value": value]
  }

  /// The currency address
  public var currency: String {
    get {
      return graphQLMap["currency"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "currency")
    }
  }

  /// Floating point number as string (e.g. 42.009837). It could have the entire precision of the Asset or be truncated to the last significant decimal.
  public var value: String {
    get {
      return graphQLMap["value"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "value")
    }
  }
}

/// Relay error reason
public enum RelayErrorReasons: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case rejected
  case handleTaken
  case expired
  case wrongWalletSigned
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "REJECTED": self = .rejected
      case "HANDLE_TAKEN": self = .handleTaken
      case "EXPIRED": self = .expired
      case "WRONG_WALLET_SIGNED": self = .wrongWalletSigned
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .rejected: return "REJECTED"
      case .handleTaken: return "HANDLE_TAKEN"
      case .expired: return "EXPIRED"
      case .wrongWalletSigned: return "WRONG_WALLET_SIGNED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: RelayErrorReasons, rhs: RelayErrorReasons) -> Bool {
    switch (lhs, rhs) {
      case (.rejected, .rejected): return true
      case (.handleTaken, .handleTaken): return true
      case (.expired, .expired): return true
      case (.wrongWalletSigned, .wrongWalletSigned): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [RelayErrorReasons] {
    return [
      .rejected,
      .handleTaken,
      .expired,
      .wrongWalletSigned,
    ]
  }
}

public struct FollowRequest: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - follow
  public init(follow: [Follow]) {
    graphQLMap = ["follow": follow]
  }

  public var follow: [Follow] {
    get {
      return graphQLMap["follow"] as! [Follow]
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "follow")
    }
  }
}

public struct Follow: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - profile
  ///   - followModule
  public init(profile: String, followModule: Swift.Optional<FollowModuleRedeemParams?> = nil) {
    graphQLMap = ["profile": profile, "followModule": followModule]
  }

  public var profile: String {
    get {
      return graphQLMap["profile"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profile")
    }
  }

  public var followModule: Swift.Optional<FollowModuleRedeemParams?> {
    get {
      return graphQLMap["followModule"] as? Swift.Optional<FollowModuleRedeemParams?> ?? Swift.Optional<FollowModuleRedeemParams?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "followModule")
    }
  }
}

public struct FollowModuleRedeemParams: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - feeFollowModule: The follower fee follower module
  public init(feeFollowModule: Swift.Optional<FeeFollowModuleRedeemParams?> = nil) {
    graphQLMap = ["feeFollowModule": feeFollowModule]
  }

  /// The follower fee follower module
  public var feeFollowModule: Swift.Optional<FeeFollowModuleRedeemParams?> {
    get {
      return graphQLMap["feeFollowModule"] as? Swift.Optional<FeeFollowModuleRedeemParams?> ?? Swift.Optional<FeeFollowModuleRedeemParams?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "feeFollowModule")
    }
  }
}

public struct FeeFollowModuleRedeemParams: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - amount: The expected amount to pay
  public init(amount: ModuleFeeAmountParams) {
    graphQLMap = ["amount": amount]
  }

  /// The expected amount to pay
  public var amount: ModuleFeeAmountParams {
    get {
      return graphQLMap["amount"] as! ModuleFeeAmountParams
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "amount")
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

public struct FollowersRequest: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - limit
  ///   - cursor
  ///   - profileId
  public init(limit: Swift.Optional<String?> = nil, cursor: Swift.Optional<String?> = nil, profileId: String) {
    graphQLMap = ["limit": limit, "cursor": cursor, "profileId": profileId]
  }

  public var limit: Swift.Optional<String?> {
    get {
      return graphQLMap["limit"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var cursor: Swift.Optional<String?> {
    get {
      return graphQLMap["cursor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cursor")
    }
  }

  public var profileId: String {
    get {
      return graphQLMap["profileId"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profileId")
    }
  }
}

/// The follow module types
public enum FollowModules: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case feeFollowModule
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "FeeFollowModule": self = .feeFollowModule
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .feeFollowModule: return "FeeFollowModule"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: FollowModules, rhs: FollowModules) -> Bool {
    switch (lhs, rhs) {
      case (.feeFollowModule, .feeFollowModule): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [FollowModules] {
    return [
      .feeFollowModule,
    ]
  }
}

public struct ProfileQueryRequest: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - limit
  ///   - cursor
  ///   - profileIds: The profile ids
  ///   - ownedBy: The ethereum addresses
  ///   - handles: The handles for the profile
  ///   - whoMirroredPublicationId: The mirrored publication id
  public init(limit: Swift.Optional<String?> = nil, cursor: Swift.Optional<String?> = nil, profileIds: Swift.Optional<[String]?> = nil, ownedBy: Swift.Optional<[String]?> = nil, handles: Swift.Optional<[String]?> = nil, whoMirroredPublicationId: Swift.Optional<String?> = nil) {
    graphQLMap = ["limit": limit, "cursor": cursor, "profileIds": profileIds, "ownedBy": ownedBy, "handles": handles, "whoMirroredPublicationId": whoMirroredPublicationId]
  }

  public var limit: Swift.Optional<String?> {
    get {
      return graphQLMap["limit"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "limit")
    }
  }

  public var cursor: Swift.Optional<String?> {
    get {
      return graphQLMap["cursor"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "cursor")
    }
  }

  /// The profile ids
  public var profileIds: Swift.Optional<[String]?> {
    get {
      return graphQLMap["profileIds"] as? Swift.Optional<[String]?> ?? Swift.Optional<[String]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "profileIds")
    }
  }

  /// The ethereum addresses
  public var ownedBy: Swift.Optional<[String]?> {
    get {
      return graphQLMap["ownedBy"] as? Swift.Optional<[String]?> ?? Swift.Optional<[String]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "ownedBy")
    }
  }

  /// The handles for the profile
  public var handles: Swift.Optional<[String]?> {
    get {
      return graphQLMap["handles"] as? Swift.Optional<[String]?> ?? Swift.Optional<[String]?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "handles")
    }
  }

  /// The mirrored publication id
  public var whoMirroredPublicationId: Swift.Optional<String?> {
    get {
      return graphQLMap["whoMirroredPublicationId"] as? Swift.Optional<String?> ?? Swift.Optional<String?>.none
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "whoMirroredPublicationId")
    }
  }
}

public struct HasTxHashBeenIndexedRequest: GraphQLMapConvertible {
  public var graphQLMap: GraphQLMap

  /// - Parameters:
  ///   - txHash
  public init(txHash: String) {
    graphQLMap = ["txHash": txHash]
  }

  public var txHash: String {
    get {
      return graphQLMap["txHash"] as! String
    }
    set {
      graphQLMap.updateValue(newValue, forKey: "txHash")
    }
  }
}

/// publication metadata status type
public enum PublicationMetadataStatusType: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case pending
  case metadataValidationFailed
  case success
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "PENDING": self = .pending
      case "METADATA_VALIDATION_FAILED": self = .metadataValidationFailed
      case "SUCCESS": self = .success
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .pending: return "PENDING"
      case .metadataValidationFailed: return "METADATA_VALIDATION_FAILED"
      case .success: return "SUCCESS"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: PublicationMetadataStatusType, rhs: PublicationMetadataStatusType) -> Bool {
    switch (lhs, rhs) {
      case (.pending, .pending): return true
      case (.metadataValidationFailed, .metadataValidationFailed): return true
      case (.success, .success): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [PublicationMetadataStatusType] {
    return [
      .pending,
      .metadataValidationFailed,
      .success,
    ]
  }
}

/// Transaction error reason
public enum TransactionErrorReasons: RawRepresentable, Equatable, Hashable, CaseIterable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case reverted
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "REVERTED": self = .reverted
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .reverted: return "REVERTED"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransactionErrorReasons, rhs: TransactionErrorReasons) -> Bool {
    switch (lhs, rhs) {
      case (.reverted, .reverted): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }

  public static var allCases: [TransactionErrorReasons] {
    return [
      .reverted,
    ]
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

public final class CreateProfileMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateProfile($request: CreateProfileRequest!) {
      createProfile(request: $request) {
        __typename
        ... on RelayerResult {
          __typename
          txHash
        }
        ... on RelayError {
          __typename
          reason
        }
      }
    }
    """

  public let operationName: String = "CreateProfile"

  public var request: CreateProfileRequest

  public init(request: CreateProfileRequest) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createProfile", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(CreateProfile.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createProfile: CreateProfile) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createProfile": createProfile.resultMap])
    }

    public var createProfile: CreateProfile {
      get {
        return CreateProfile(unsafeResultMap: resultMap["createProfile"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createProfile")
      }
    }

    public struct CreateProfile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RelayerResult", "RelayError"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["RelayerResult": AsRelayerResult.selections, "RelayError": AsRelayError.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeRelayerResult(txHash: String) -> CreateProfile {
        return CreateProfile(unsafeResultMap: ["__typename": "RelayerResult", "txHash": txHash])
      }

      public static func makeRelayError(reason: RelayErrorReasons) -> CreateProfile {
        return CreateProfile(unsafeResultMap: ["__typename": "RelayError", "reason": reason])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asRelayerResult: AsRelayerResult? {
        get {
          if !AsRelayerResult.possibleTypes.contains(__typename) { return nil }
          return AsRelayerResult(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsRelayerResult: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RelayerResult"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("txHash", type: .nonNull(.scalar(String.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(txHash: String) {
          self.init(unsafeResultMap: ["__typename": "RelayerResult", "txHash": txHash])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The tx hash
        public var txHash: String {
          get {
            return resultMap["txHash"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "txHash")
          }
        }
      }

      public var asRelayError: AsRelayError? {
        get {
          if !AsRelayError.possibleTypes.contains(__typename) { return nil }
          return AsRelayError(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsRelayError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["RelayError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("reason", type: .nonNull(.scalar(RelayErrorReasons.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(reason: RelayErrorReasons) {
          self.init(unsafeResultMap: ["__typename": "RelayError", "reason": reason])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var reason: RelayErrorReasons {
          get {
            return resultMap["reason"]! as! RelayErrorReasons
          }
          set {
            resultMap.updateValue(newValue, forKey: "reason")
          }
        }
      }
    }
  }
}

public final class FollowMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation Follow($request: FollowRequest!) {
      createFollowTypedData(request: $request) {
        __typename
        id
        expiresAt
        typedData {
          __typename
          domain {
            __typename
            name
            chainId
            version
            verifyingContract
          }
          types {
            __typename
            FollowWithSig {
              __typename
              name
              type
            }
          }
          value {
            __typename
            nonce
            deadline
            profileIds
            datas
          }
        }
      }
    }
    """

  public let operationName: String = "Follow"

  public var request: FollowRequest

  public init(request: FollowRequest) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createFollowTypedData", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(CreateFollowTypedDatum.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createFollowTypedData: CreateFollowTypedDatum) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createFollowTypedData": createFollowTypedData.resultMap])
    }

    public var createFollowTypedData: CreateFollowTypedDatum {
      get {
        return CreateFollowTypedDatum(unsafeResultMap: resultMap["createFollowTypedData"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "createFollowTypedData")
      }
    }

    public struct CreateFollowTypedDatum: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["CreateFollowBroadcastItemResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(String.self))),
          GraphQLField("expiresAt", type: .nonNull(.scalar(String.self))),
          GraphQLField("typedData", type: .nonNull(.object(TypedDatum.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: String, expiresAt: String, typedData: TypedDatum) {
        self.init(unsafeResultMap: ["__typename": "CreateFollowBroadcastItemResult", "id": id, "expiresAt": expiresAt, "typedData": typedData.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// This broadcast item ID
      public var id: String {
        get {
          return resultMap["id"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The date the broadcast item expiries
      public var expiresAt: String {
        get {
          return resultMap["expiresAt"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "expiresAt")
        }
      }

      /// The typed data
      public var typedData: TypedDatum {
        get {
          return TypedDatum(unsafeResultMap: resultMap["typedData"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "typedData")
        }
      }

      public struct TypedDatum: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["CreateFollowEIP712TypedData"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("domain", type: .nonNull(.object(Domain.selections))),
            GraphQLField("types", type: .nonNull(.object(`Type`.selections))),
            GraphQLField("value", type: .nonNull(.object(Value.selections))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(domain: Domain, types: `Type`, value: Value) {
          self.init(unsafeResultMap: ["__typename": "CreateFollowEIP712TypedData", "domain": domain.resultMap, "types": types.resultMap, "value": value.resultMap])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The typed data domain
        public var domain: Domain {
          get {
            return Domain(unsafeResultMap: resultMap["domain"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "domain")
          }
        }

        /// The types
        public var types: `Type` {
          get {
            return `Type`(unsafeResultMap: resultMap["types"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "types")
          }
        }

        /// The values
        public var value: Value {
          get {
            return Value(unsafeResultMap: resultMap["value"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "value")
          }
        }

        public struct Domain: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["EIP712TypedDataDomain"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("name", type: .nonNull(.scalar(String.self))),
              GraphQLField("chainId", type: .nonNull(.scalar(String.self))),
              GraphQLField("version", type: .nonNull(.scalar(String.self))),
              GraphQLField("verifyingContract", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(name: String, chainId: String, version: String, verifyingContract: String) {
            self.init(unsafeResultMap: ["__typename": "EIP712TypedDataDomain", "name": name, "chainId": chainId, "version": version, "verifyingContract": verifyingContract])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The name of the typed data domain
          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }

          /// The chainId
          public var chainId: String {
            get {
              return resultMap["chainId"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "chainId")
            }
          }

          /// The version
          public var version: String {
            get {
              return resultMap["version"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "version")
            }
          }

          /// The verifying contract
          public var verifyingContract: String {
            get {
              return resultMap["verifyingContract"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "verifyingContract")
            }
          }
        }

        public struct `Type`: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CreateFollowEIP712TypedDataTypes"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("FollowWithSig", type: .nonNull(.list(.nonNull(.object(FollowWithSig.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(followWithSig: [FollowWithSig]) {
            self.init(unsafeResultMap: ["__typename": "CreateFollowEIP712TypedDataTypes", "FollowWithSig": followWithSig.map { (value: FollowWithSig) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var followWithSig: [FollowWithSig] {
            get {
              return (resultMap["FollowWithSig"] as! [ResultMap]).map { (value: ResultMap) -> FollowWithSig in FollowWithSig(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: FollowWithSig) -> ResultMap in value.resultMap }, forKey: "FollowWithSig")
            }
          }

          public struct FollowWithSig: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["EIP712TypedDataField"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .nonNull(.scalar(String.self))),
                GraphQLField("type", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(name: String, type: String) {
              self.init(unsafeResultMap: ["__typename": "EIP712TypedDataField", "name": name, "type": type])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The name of the typed data field
            public var name: String {
              get {
                return resultMap["name"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// The type of the typed data field
            public var type: String {
              get {
                return resultMap["type"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "type")
              }
            }
          }
        }

        public struct Value: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["CreateFollowEIP712TypedDataValue"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("nonce", type: .nonNull(.scalar(String.self))),
              GraphQLField("deadline", type: .nonNull(.scalar(String.self))),
              GraphQLField("profileIds", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
              GraphQLField("datas", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(nonce: String, deadline: String, profileIds: [String], datas: [String]) {
            self.init(unsafeResultMap: ["__typename": "CreateFollowEIP712TypedDataValue", "nonce": nonce, "deadline": deadline, "profileIds": profileIds, "datas": datas])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var nonce: String {
            get {
              return resultMap["nonce"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "nonce")
            }
          }

          public var deadline: String {
            get {
              return resultMap["deadline"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "deadline")
            }
          }

          public var profileIds: [String] {
            get {
              return resultMap["profileIds"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "profileIds")
            }
          }

          public var datas: [String] {
            get {
              return resultMap["datas"]! as! [String]
            }
            set {
              resultMap.updateValue(newValue, forKey: "datas")
            }
          }
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

public final class GetFollowersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetFollowers($request: FollowersRequest!) {
      followers(request: $request) {
        __typename
        items {
          __typename
          wallet {
            __typename
            address
            defaultProfile {
              __typename
              id
              name
              bio
              location
              website
              twitterUrl
              handle
              picture {
                __typename
                ... on NftImage {
                  __typename
                  contractAddress
                  tokenId
                  uri
                  verified
                }
                ... on MediaSet {
                  __typename
                  original {
                    __typename
                    url
                    mimeType
                  }
                }
              }
              coverPicture {
                __typename
                ... on NftImage {
                  __typename
                  contractAddress
                  tokenId
                  uri
                  verified
                }
                ... on MediaSet {
                  __typename
                  original {
                    __typename
                    url
                    mimeType
                  }
                }
              }
              ownedBy
              depatcher {
                __typename
                address
                canUseRelay
              }
              stats {
                __typename
                totalFollowers
                totalFollowing
                totalPosts
                totalComments
                totalMirrors
                totalPublications
                totalCollects
              }
              followModule {
                __typename
                ... on FeeFollowModuleSettings {
                  __typename
                  type
                  contractAddress
                  amount {
                    __typename
                    asset {
                      __typename
                      name
                      symbol
                      decimals
                      address
                    }
                    value
                  }
                  recipient
                }
              }
            }
          }
          totalAmountOfTimesFollowed
        }
        pageInfo {
          __typename
          prev
          next
          totalCount
        }
      }
    }
    """

  public let operationName: String = "GetFollowers"

  public var request: FollowersRequest

  public init(request: FollowersRequest) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("followers", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(Follower.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(followers: Follower) {
      self.init(unsafeResultMap: ["__typename": "Query", "followers": followers.resultMap])
    }

    public var followers: Follower {
      get {
        return Follower(unsafeResultMap: resultMap["followers"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "followers")
      }
    }

    public struct Follower: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaginatedFollowersResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "PaginatedFollowersResult", "items": items.map { (value: Item) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (resultMap["items"] as! [ResultMap]).map { (value: ResultMap) -> Item in Item(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Item) -> ResultMap in value.resultMap }, forKey: "items")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Follower"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("wallet", type: .nonNull(.object(Wallet.selections))),
            GraphQLField("totalAmountOfTimesFollowed", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(wallet: Wallet, totalAmountOfTimesFollowed: Int) {
          self.init(unsafeResultMap: ["__typename": "Follower", "wallet": wallet.resultMap, "totalAmountOfTimesFollowed": totalAmountOfTimesFollowed])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var wallet: Wallet {
          get {
            return Wallet(unsafeResultMap: resultMap["wallet"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "wallet")
          }
        }

        public var totalAmountOfTimesFollowed: Int {
          get {
            return resultMap["totalAmountOfTimesFollowed"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalAmountOfTimesFollowed")
          }
        }

        public struct Wallet: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Wallet"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .nonNull(.scalar(String.self))),
              GraphQLField("defaultProfile", type: .object(DefaultProfile.selections)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address: String, defaultProfile: DefaultProfile? = nil) {
            self.init(unsafeResultMap: ["__typename": "Wallet", "address": address, "defaultProfile": defaultProfile.flatMap { (value: DefaultProfile) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var address: String {
            get {
              return resultMap["address"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }

          /// The default profile for the wallet for now it is just their first profile, this will be the default profile they picked soon enough
          public var defaultProfile: DefaultProfile? {
            get {
              return (resultMap["defaultProfile"] as? ResultMap).flatMap { DefaultProfile(unsafeResultMap: $0) }
            }
            set {
              resultMap.updateValue(newValue?.resultMap, forKey: "defaultProfile")
            }
          }

          public struct DefaultProfile: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Profile"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("id", type: .nonNull(.scalar(String.self))),
                GraphQLField("name", type: .scalar(String.self)),
                GraphQLField("bio", type: .scalar(String.self)),
                GraphQLField("location", type: .scalar(String.self)),
                GraphQLField("website", type: .scalar(String.self)),
                GraphQLField("twitterUrl", type: .scalar(String.self)),
                GraphQLField("handle", type: .nonNull(.scalar(String.self))),
                GraphQLField("picture", type: .object(Picture.selections)),
                GraphQLField("coverPicture", type: .object(CoverPicture.selections)),
                GraphQLField("ownedBy", type: .nonNull(.scalar(String.self))),
                GraphQLField("depatcher", type: .object(Depatcher.selections)),
                GraphQLField("stats", type: .nonNull(.object(Stat.selections))),
                GraphQLField("followModule", type: .object(FollowModule.selections)),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(id: String, name: String? = nil, bio: String? = nil, location: String? = nil, website: String? = nil, twitterUrl: String? = nil, handle: String, picture: Picture? = nil, coverPicture: CoverPicture? = nil, ownedBy: String, depatcher: Depatcher? = nil, stats: Stat, followModule: FollowModule? = nil) {
              self.init(unsafeResultMap: ["__typename": "Profile", "id": id, "name": name, "bio": bio, "location": location, "website": website, "twitterUrl": twitterUrl, "handle": handle, "picture": picture.flatMap { (value: Picture) -> ResultMap in value.resultMap }, "coverPicture": coverPicture.flatMap { (value: CoverPicture) -> ResultMap in value.resultMap }, "ownedBy": ownedBy, "depatcher": depatcher.flatMap { (value: Depatcher) -> ResultMap in value.resultMap }, "stats": stats.resultMap, "followModule": followModule.flatMap { (value: FollowModule) -> ResultMap in value.resultMap }])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The profile id
            public var id: String {
              get {
                return resultMap["id"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "id")
              }
            }

            /// Name of the profile
            public var name: String? {
              get {
                return resultMap["name"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "name")
              }
            }

            /// Bio of the profile
            public var bio: String? {
              get {
                return resultMap["bio"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "bio")
              }
            }

            /// Location set on profile
            public var location: String? {
              get {
                return resultMap["location"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "location")
              }
            }

            /// Website set on profile
            public var website: String? {
              get {
                return resultMap["website"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "website")
              }
            }

            /// Twitter url set on profile
            public var twitterUrl: String? {
              get {
                return resultMap["twitterUrl"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "twitterUrl")
              }
            }

            /// The profile handle
            public var handle: String {
              get {
                return resultMap["handle"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "handle")
              }
            }

            /// The picture for the profile
            public var picture: Picture? {
              get {
                return (resultMap["picture"] as? ResultMap).flatMap { Picture(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "picture")
              }
            }

            /// The cover picture for the profile
            public var coverPicture: CoverPicture? {
              get {
                return (resultMap["coverPicture"] as? ResultMap).flatMap { CoverPicture(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "coverPicture")
              }
            }

            /// Who owns the profile
            public var ownedBy: String {
              get {
                return resultMap["ownedBy"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "ownedBy")
              }
            }

            /// The dispatcher
            public var depatcher: Depatcher? {
              get {
                return (resultMap["depatcher"] as? ResultMap).flatMap { Depatcher(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "depatcher")
              }
            }

            /// Profile stats
            public var stats: Stat {
              get {
                return Stat(unsafeResultMap: resultMap["stats"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "stats")
              }
            }

            /// The follow module
            public var followModule: FollowModule? {
              get {
                return (resultMap["followModule"] as? ResultMap).flatMap { FollowModule(unsafeResultMap: $0) }
              }
              set {
                resultMap.updateValue(newValue?.resultMap, forKey: "followModule")
              }
            }

            public struct Picture: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["NftImage", "MediaSet"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLTypeCase(
                    variants: ["NftImage": AsNftImage.selections, "MediaSet": AsMediaSet.selections],
                    default: [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    ]
                  )
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeNftImage(contractAddress: String, tokenId: String, uri: String, verified: Bool) -> Picture {
                return Picture(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
              }

              public static func makeMediaSet(original: AsMediaSet.Original) -> Picture {
                return Picture(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var asNftImage: AsNftImage? {
                get {
                  if !AsNftImage.possibleTypes.contains(__typename) { return nil }
                  return AsNftImage(unsafeResultMap: resultMap)
                }
                set {
                  guard let newValue = newValue else { return }
                  resultMap = newValue.resultMap
                }
              }

              public struct AsNftImage: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["NftImage"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("contractAddress", type: .nonNull(.scalar(String.self))),
                    GraphQLField("tokenId", type: .nonNull(.scalar(String.self))),
                    GraphQLField("uri", type: .nonNull(.scalar(String.self))),
                    GraphQLField("verified", type: .nonNull(.scalar(Bool.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(contractAddress: String, tokenId: String, uri: String, verified: Bool) {
                  self.init(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The contract address
                public var contractAddress: String {
                  get {
                    return resultMap["contractAddress"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "contractAddress")
                  }
                }

                /// The token id of the nft
                public var tokenId: String {
                  get {
                    return resultMap["tokenId"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "tokenId")
                  }
                }

                /// The token image nft
                public var uri: String {
                  get {
                    return resultMap["uri"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "uri")
                  }
                }

                /// If the NFT is verified
                public var verified: Bool {
                  get {
                    return resultMap["verified"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "verified")
                  }
                }
              }

              public var asMediaSet: AsMediaSet? {
                get {
                  if !AsMediaSet.possibleTypes.contains(__typename) { return nil }
                  return AsMediaSet(unsafeResultMap: resultMap)
                }
                set {
                  guard let newValue = newValue else { return }
                  resultMap = newValue.resultMap
                }
              }

              public struct AsMediaSet: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MediaSet"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("original", type: .nonNull(.object(Original.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(original: Original) {
                  self.init(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Original media
                public var original: Original {
                  get {
                    return Original(unsafeResultMap: resultMap["original"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "original")
                  }
                }

                public struct Original: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Media"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      GraphQLField("mimeType", type: .scalar(String.self)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String, mimeType: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Media", "url": url, "mimeType": mimeType])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The token image nft
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }

                  /// The image/audio/video mime type for the publication
                  public var mimeType: String? {
                    get {
                      return resultMap["mimeType"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "mimeType")
                    }
                  }
                }
              }
            }

            public struct CoverPicture: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["NftImage", "MediaSet"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLTypeCase(
                    variants: ["NftImage": AsNftImage.selections, "MediaSet": AsMediaSet.selections],
                    default: [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    ]
                  )
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public static func makeNftImage(contractAddress: String, tokenId: String, uri: String, verified: Bool) -> CoverPicture {
                return CoverPicture(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
              }

              public static func makeMediaSet(original: AsMediaSet.Original) -> CoverPicture {
                return CoverPicture(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              public var asNftImage: AsNftImage? {
                get {
                  if !AsNftImage.possibleTypes.contains(__typename) { return nil }
                  return AsNftImage(unsafeResultMap: resultMap)
                }
                set {
                  guard let newValue = newValue else { return }
                  resultMap = newValue.resultMap
                }
              }

              public struct AsNftImage: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["NftImage"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("contractAddress", type: .nonNull(.scalar(String.self))),
                    GraphQLField("tokenId", type: .nonNull(.scalar(String.self))),
                    GraphQLField("uri", type: .nonNull(.scalar(String.self))),
                    GraphQLField("verified", type: .nonNull(.scalar(Bool.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(contractAddress: String, tokenId: String, uri: String, verified: Bool) {
                  self.init(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The contract address
                public var contractAddress: String {
                  get {
                    return resultMap["contractAddress"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "contractAddress")
                  }
                }

                /// The token id of the nft
                public var tokenId: String {
                  get {
                    return resultMap["tokenId"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "tokenId")
                  }
                }

                /// The token image nft
                public var uri: String {
                  get {
                    return resultMap["uri"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "uri")
                  }
                }

                /// If the NFT is verified
                public var verified: Bool {
                  get {
                    return resultMap["verified"]! as! Bool
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "verified")
                  }
                }
              }

              public var asMediaSet: AsMediaSet? {
                get {
                  if !AsMediaSet.possibleTypes.contains(__typename) { return nil }
                  return AsMediaSet(unsafeResultMap: resultMap)
                }
                set {
                  guard let newValue = newValue else { return }
                  resultMap = newValue.resultMap
                }
              }

              public struct AsMediaSet: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["MediaSet"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("original", type: .nonNull(.object(Original.selections))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(original: Original) {
                  self.init(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// Original media
                public var original: Original {
                  get {
                    return Original(unsafeResultMap: resultMap["original"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "original")
                  }
                }

                public struct Original: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Media"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("url", type: .nonNull(.scalar(String.self))),
                      GraphQLField("mimeType", type: .scalar(String.self)),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(url: String, mimeType: String? = nil) {
                    self.init(unsafeResultMap: ["__typename": "Media", "url": url, "mimeType": mimeType])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// The token image nft
                  public var url: String {
                    get {
                      return resultMap["url"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "url")
                    }
                  }

                  /// The image/audio/video mime type for the publication
                  public var mimeType: String? {
                    get {
                      return resultMap["mimeType"] as? String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "mimeType")
                    }
                  }
                }
              }
            }

            public struct Depatcher: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Dispatcher"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                  GraphQLField("canUseRelay", type: .nonNull(.scalar(Bool.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(address: String, canUseRelay: Bool) {
                self.init(unsafeResultMap: ["__typename": "Dispatcher", "address": address, "canUseRelay": canUseRelay])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The dispatcher address
              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }

              /// If the dispatcher can use the relay
              public var canUseRelay: Bool {
                get {
                  return resultMap["canUseRelay"]! as! Bool
                }
                set {
                  resultMap.updateValue(newValue, forKey: "canUseRelay")
                }
              }
            }

            public struct Stat: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["ProfileStats"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("totalFollowers", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("totalFollowing", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("totalPosts", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("totalComments", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("totalMirrors", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("totalPublications", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("totalCollects", type: .nonNull(.scalar(Int.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(totalFollowers: Int, totalFollowing: Int, totalPosts: Int, totalComments: Int, totalMirrors: Int, totalPublications: Int, totalCollects: Int) {
                self.init(unsafeResultMap: ["__typename": "ProfileStats", "totalFollowers": totalFollowers, "totalFollowing": totalFollowing, "totalPosts": totalPosts, "totalComments": totalComments, "totalMirrors": totalMirrors, "totalPublications": totalPublications, "totalCollects": totalCollects])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Total follower count
              public var totalFollowers: Int {
                get {
                  return resultMap["totalFollowers"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalFollowers")
                }
              }

              /// Total following count (remember the wallet follows not profile so will be same for every profile they own)
              public var totalFollowing: Int {
                get {
                  return resultMap["totalFollowing"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalFollowing")
                }
              }

              /// Total post count
              public var totalPosts: Int {
                get {
                  return resultMap["totalPosts"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalPosts")
                }
              }

              /// Total comment count
              public var totalComments: Int {
                get {
                  return resultMap["totalComments"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalComments")
                }
              }

              /// Total mirror count
              public var totalMirrors: Int {
                get {
                  return resultMap["totalMirrors"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalMirrors")
                }
              }

              /// Total publication count
              public var totalPublications: Int {
                get {
                  return resultMap["totalPublications"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalPublications")
                }
              }

              /// Total collects count
              public var totalCollects: Int {
                get {
                  return resultMap["totalCollects"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "totalCollects")
                }
              }
            }

            public struct FollowModule: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["FeeFollowModuleSettings"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("type", type: .nonNull(.scalar(FollowModules.self))),
                  GraphQLField("contractAddress", type: .nonNull(.scalar(String.self))),
                  GraphQLField("amount", type: .nonNull(.object(Amount.selections))),
                  GraphQLField("recipient", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(type: FollowModules, contractAddress: String, amount: Amount, recipient: String) {
                self.init(unsafeResultMap: ["__typename": "FeeFollowModuleSettings", "type": type, "contractAddress": contractAddress, "amount": amount.resultMap, "recipient": recipient])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The follow modules enum
              public var type: FollowModules {
                get {
                  return resultMap["type"]! as! FollowModules
                }
                set {
                  resultMap.updateValue(newValue, forKey: "type")
                }
              }

              public var contractAddress: String {
                get {
                  return resultMap["contractAddress"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "contractAddress")
                }
              }

              /// The collect module amount info
              public var amount: Amount {
                get {
                  return Amount(unsafeResultMap: resultMap["amount"]! as! ResultMap)
                }
                set {
                  resultMap.updateValue(newValue.resultMap, forKey: "amount")
                }
              }

              /// The collect module recipient address
              public var recipient: String {
                get {
                  return resultMap["recipient"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "recipient")
                }
              }

              public struct Amount: GraphQLSelectionSet {
                public static let possibleTypes: [String] = ["ModuleFeeAmount"]

                public static var selections: [GraphQLSelection] {
                  return [
                    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                    GraphQLField("asset", type: .nonNull(.object(Asset.selections))),
                    GraphQLField("value", type: .nonNull(.scalar(String.self))),
                  ]
                }

                public private(set) var resultMap: ResultMap

                public init(unsafeResultMap: ResultMap) {
                  self.resultMap = unsafeResultMap
                }

                public init(asset: Asset, value: String) {
                  self.init(unsafeResultMap: ["__typename": "ModuleFeeAmount", "asset": asset.resultMap, "value": value])
                }

                public var __typename: String {
                  get {
                    return resultMap["__typename"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "__typename")
                  }
                }

                /// The erc20 token info
                public var asset: Asset {
                  get {
                    return Asset(unsafeResultMap: resultMap["asset"]! as! ResultMap)
                  }
                  set {
                    resultMap.updateValue(newValue.resultMap, forKey: "asset")
                  }
                }

                /// Floating point number as string (e.g. 42.009837). It could have the entire precision of the Asset or be truncated to the last significant decimal.
                public var value: String {
                  get {
                    return resultMap["value"]! as! String
                  }
                  set {
                    resultMap.updateValue(newValue, forKey: "value")
                  }
                }

                public struct Asset: GraphQLSelectionSet {
                  public static let possibleTypes: [String] = ["Erc20"]

                  public static var selections: [GraphQLSelection] {
                    return [
                      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                      GraphQLField("name", type: .nonNull(.scalar(String.self))),
                      GraphQLField("symbol", type: .nonNull(.scalar(String.self))),
                      GraphQLField("decimals", type: .nonNull(.scalar(Int.self))),
                      GraphQLField("address", type: .nonNull(.scalar(String.self))),
                    ]
                  }

                  public private(set) var resultMap: ResultMap

                  public init(unsafeResultMap: ResultMap) {
                    self.resultMap = unsafeResultMap
                  }

                  public init(name: String, symbol: String, decimals: Int, address: String) {
                    self.init(unsafeResultMap: ["__typename": "Erc20", "name": name, "symbol": symbol, "decimals": decimals, "address": address])
                  }

                  public var __typename: String {
                    get {
                      return resultMap["__typename"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "__typename")
                    }
                  }

                  /// Name of the symbol
                  public var name: String {
                    get {
                      return resultMap["name"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "name")
                    }
                  }

                  /// Symbol for the token
                  public var symbol: String {
                    get {
                      return resultMap["symbol"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "symbol")
                    }
                  }

                  /// Decimal places for the token
                  public var decimals: Int {
                    get {
                      return resultMap["decimals"]! as! Int
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "decimals")
                    }
                  }

                  /// The erc20 address
                  public var address: String {
                    get {
                      return resultMap["address"]! as! String
                    }
                    set {
                      resultMap.updateValue(newValue, forKey: "address")
                    }
                  }
                }
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaginatedResultInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("prev", type: .scalar(String.self)),
            GraphQLField("next", type: .scalar(String.self)),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(prev: String? = nil, next: String? = nil, totalCount: Int) {
          self.init(unsafeResultMap: ["__typename": "PaginatedResultInfo", "prev": prev, "next": next, "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Cursor to query the actual results
        public var prev: String? {
          get {
            return resultMap["prev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "prev")
          }
        }

        /// Cursor to query next results
        public var next: String? {
          get {
            return resultMap["next"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }

        /// The total number of entities the pagination iterates over. e.g. For a query that requests all nfts with more than 10 likes, this field gives the total amount of nfts with more than 10 likes, not the total amount of nfts
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }
      }
    }
  }
}

public final class GetProfilesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetProfiles($request: ProfileQueryRequest!) {
      profiles(request: $request) {
        __typename
        items {
          __typename
          id
          name
          bio
          location
          website
          twitterUrl
          picture {
            __typename
            ... on NftImage {
              __typename
              contractAddress
              tokenId
              uri
              verified
            }
            ... on MediaSet {
              __typename
              original {
                __typename
                url
                mimeType
              }
            }
          }
          handle
          coverPicture {
            __typename
            ... on NftImage {
              __typename
              contractAddress
              tokenId
              uri
              verified
            }
            ... on MediaSet {
              __typename
              original {
                __typename
                url
                mimeType
              }
            }
          }
          ownedBy
          depatcher {
            __typename
            address
            canUseRelay
          }
          stats {
            __typename
            totalFollowers
            totalFollowing
            totalPosts
            totalComments
            totalMirrors
            totalPublications
            totalCollects
          }
          followModule {
            __typename
            ... on FeeFollowModuleSettings {
              __typename
              type
              amount {
                __typename
                asset {
                  __typename
                  symbol
                  name
                  decimals
                  address
                }
                value
              }
              recipient
            }
          }
        }
        pageInfo {
          __typename
          prev
          next
          totalCount
        }
      }
    }
    """

  public let operationName: String = "GetProfiles"

  public var request: ProfileQueryRequest

  public init(request: ProfileQueryRequest) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("profiles", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(Profile.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profiles: Profile) {
      self.init(unsafeResultMap: ["__typename": "Query", "profiles": profiles.resultMap])
    }

    public var profiles: Profile {
      get {
        return Profile(unsafeResultMap: resultMap["profiles"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "profiles")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["PaginatedProfileResult"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("items", type: .nonNull(.list(.nonNull(.object(Item.selections))))),
          GraphQLField("pageInfo", type: .nonNull(.object(PageInfo.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(items: [Item], pageInfo: PageInfo) {
        self.init(unsafeResultMap: ["__typename": "PaginatedProfileResult", "items": items.map { (value: Item) -> ResultMap in value.resultMap }, "pageInfo": pageInfo.resultMap])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var items: [Item] {
        get {
          return (resultMap["items"] as! [ResultMap]).map { (value: ResultMap) -> Item in Item(unsafeResultMap: value) }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Item) -> ResultMap in value.resultMap }, forKey: "items")
        }
      }

      public var pageInfo: PageInfo {
        get {
          return PageInfo(unsafeResultMap: resultMap["pageInfo"]! as! ResultMap)
        }
        set {
          resultMap.updateValue(newValue.resultMap, forKey: "pageInfo")
        }
      }

      public struct Item: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Profile"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("bio", type: .scalar(String.self)),
            GraphQLField("location", type: .scalar(String.self)),
            GraphQLField("website", type: .scalar(String.self)),
            GraphQLField("twitterUrl", type: .scalar(String.self)),
            GraphQLField("picture", type: .object(Picture.selections)),
            GraphQLField("handle", type: .nonNull(.scalar(String.self))),
            GraphQLField("coverPicture", type: .object(CoverPicture.selections)),
            GraphQLField("ownedBy", type: .nonNull(.scalar(String.self))),
            GraphQLField("depatcher", type: .object(Depatcher.selections)),
            GraphQLField("stats", type: .nonNull(.object(Stat.selections))),
            GraphQLField("followModule", type: .object(FollowModule.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: String, name: String? = nil, bio: String? = nil, location: String? = nil, website: String? = nil, twitterUrl: String? = nil, picture: Picture? = nil, handle: String, coverPicture: CoverPicture? = nil, ownedBy: String, depatcher: Depatcher? = nil, stats: Stat, followModule: FollowModule? = nil) {
          self.init(unsafeResultMap: ["__typename": "Profile", "id": id, "name": name, "bio": bio, "location": location, "website": website, "twitterUrl": twitterUrl, "picture": picture.flatMap { (value: Picture) -> ResultMap in value.resultMap }, "handle": handle, "coverPicture": coverPicture.flatMap { (value: CoverPicture) -> ResultMap in value.resultMap }, "ownedBy": ownedBy, "depatcher": depatcher.flatMap { (value: Depatcher) -> ResultMap in value.resultMap }, "stats": stats.resultMap, "followModule": followModule.flatMap { (value: FollowModule) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The profile id
        public var id: String {
          get {
            return resultMap["id"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Name of the profile
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// Bio of the profile
        public var bio: String? {
          get {
            return resultMap["bio"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "bio")
          }
        }

        /// Location set on profile
        public var location: String? {
          get {
            return resultMap["location"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "location")
          }
        }

        /// Website set on profile
        public var website: String? {
          get {
            return resultMap["website"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "website")
          }
        }

        /// Twitter url set on profile
        public var twitterUrl: String? {
          get {
            return resultMap["twitterUrl"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "twitterUrl")
          }
        }

        /// The picture for the profile
        public var picture: Picture? {
          get {
            return (resultMap["picture"] as? ResultMap).flatMap { Picture(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "picture")
          }
        }

        /// The profile handle
        public var handle: String {
          get {
            return resultMap["handle"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "handle")
          }
        }

        /// The cover picture for the profile
        public var coverPicture: CoverPicture? {
          get {
            return (resultMap["coverPicture"] as? ResultMap).flatMap { CoverPicture(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "coverPicture")
          }
        }

        /// Who owns the profile
        public var ownedBy: String {
          get {
            return resultMap["ownedBy"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "ownedBy")
          }
        }

        /// The dispatcher
        public var depatcher: Depatcher? {
          get {
            return (resultMap["depatcher"] as? ResultMap).flatMap { Depatcher(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "depatcher")
          }
        }

        /// Profile stats
        public var stats: Stat {
          get {
            return Stat(unsafeResultMap: resultMap["stats"]! as! ResultMap)
          }
          set {
            resultMap.updateValue(newValue.resultMap, forKey: "stats")
          }
        }

        /// The follow module
        public var followModule: FollowModule? {
          get {
            return (resultMap["followModule"] as? ResultMap).flatMap { FollowModule(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "followModule")
          }
        }

        public struct Picture: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["NftImage", "MediaSet"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLTypeCase(
                variants: ["NftImage": AsNftImage.selections, "MediaSet": AsMediaSet.selections],
                default: [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                ]
              )
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeNftImage(contractAddress: String, tokenId: String, uri: String, verified: Bool) -> Picture {
            return Picture(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
          }

          public static func makeMediaSet(original: AsMediaSet.Original) -> Picture {
            return Picture(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asNftImage: AsNftImage? {
            get {
              if !AsNftImage.possibleTypes.contains(__typename) { return nil }
              return AsNftImage(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsNftImage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["NftImage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("contractAddress", type: .nonNull(.scalar(String.self))),
                GraphQLField("tokenId", type: .nonNull(.scalar(String.self))),
                GraphQLField("uri", type: .nonNull(.scalar(String.self))),
                GraphQLField("verified", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(contractAddress: String, tokenId: String, uri: String, verified: Bool) {
              self.init(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The contract address
            public var contractAddress: String {
              get {
                return resultMap["contractAddress"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "contractAddress")
              }
            }

            /// The token id of the nft
            public var tokenId: String {
              get {
                return resultMap["tokenId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "tokenId")
              }
            }

            /// The token image nft
            public var uri: String {
              get {
                return resultMap["uri"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "uri")
              }
            }

            /// If the NFT is verified
            public var verified: Bool {
              get {
                return resultMap["verified"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "verified")
              }
            }
          }

          public var asMediaSet: AsMediaSet? {
            get {
              if !AsMediaSet.possibleTypes.contains(__typename) { return nil }
              return AsMediaSet(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsMediaSet: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaSet"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("original", type: .nonNull(.object(Original.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(original: Original) {
              self.init(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Original media
            public var original: Original {
              get {
                return Original(unsafeResultMap: resultMap["original"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "original")
              }
            }

            public struct Original: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("mimeType", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String, mimeType: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Media", "url": url, "mimeType": mimeType])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The token image nft
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// The image/audio/video mime type for the publication
              public var mimeType: String? {
                get {
                  return resultMap["mimeType"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "mimeType")
                }
              }
            }
          }
        }

        public struct CoverPicture: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["NftImage", "MediaSet"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLTypeCase(
                variants: ["NftImage": AsNftImage.selections, "MediaSet": AsMediaSet.selections],
                default: [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                ]
              )
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public static func makeNftImage(contractAddress: String, tokenId: String, uri: String, verified: Bool) -> CoverPicture {
            return CoverPicture(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
          }

          public static func makeMediaSet(original: AsMediaSet.Original) -> CoverPicture {
            return CoverPicture(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var asNftImage: AsNftImage? {
            get {
              if !AsNftImage.possibleTypes.contains(__typename) { return nil }
              return AsNftImage(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsNftImage: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["NftImage"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("contractAddress", type: .nonNull(.scalar(String.self))),
                GraphQLField("tokenId", type: .nonNull(.scalar(String.self))),
                GraphQLField("uri", type: .nonNull(.scalar(String.self))),
                GraphQLField("verified", type: .nonNull(.scalar(Bool.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(contractAddress: String, tokenId: String, uri: String, verified: Bool) {
              self.init(unsafeResultMap: ["__typename": "NftImage", "contractAddress": contractAddress, "tokenId": tokenId, "uri": uri, "verified": verified])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The contract address
            public var contractAddress: String {
              get {
                return resultMap["contractAddress"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "contractAddress")
              }
            }

            /// The token id of the nft
            public var tokenId: String {
              get {
                return resultMap["tokenId"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "tokenId")
              }
            }

            /// The token image nft
            public var uri: String {
              get {
                return resultMap["uri"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "uri")
              }
            }

            /// If the NFT is verified
            public var verified: Bool {
              get {
                return resultMap["verified"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "verified")
              }
            }
          }

          public var asMediaSet: AsMediaSet? {
            get {
              if !AsMediaSet.possibleTypes.contains(__typename) { return nil }
              return AsMediaSet(unsafeResultMap: resultMap)
            }
            set {
              guard let newValue = newValue else { return }
              resultMap = newValue.resultMap
            }
          }

          public struct AsMediaSet: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["MediaSet"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("original", type: .nonNull(.object(Original.selections))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(original: Original) {
              self.init(unsafeResultMap: ["__typename": "MediaSet", "original": original.resultMap])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// Original media
            public var original: Original {
              get {
                return Original(unsafeResultMap: resultMap["original"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "original")
              }
            }

            public struct Original: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Media"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("url", type: .nonNull(.scalar(String.self))),
                  GraphQLField("mimeType", type: .scalar(String.self)),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(url: String, mimeType: String? = nil) {
                self.init(unsafeResultMap: ["__typename": "Media", "url": url, "mimeType": mimeType])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// The token image nft
              public var url: String {
                get {
                  return resultMap["url"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "url")
                }
              }

              /// The image/audio/video mime type for the publication
              public var mimeType: String? {
                get {
                  return resultMap["mimeType"] as? String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "mimeType")
                }
              }
            }
          }
        }

        public struct Depatcher: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Dispatcher"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("address", type: .nonNull(.scalar(String.self))),
              GraphQLField("canUseRelay", type: .nonNull(.scalar(Bool.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(address: String, canUseRelay: Bool) {
            self.init(unsafeResultMap: ["__typename": "Dispatcher", "address": address, "canUseRelay": canUseRelay])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The dispatcher address
          public var address: String {
            get {
              return resultMap["address"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "address")
            }
          }

          /// If the dispatcher can use the relay
          public var canUseRelay: Bool {
            get {
              return resultMap["canUseRelay"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "canUseRelay")
            }
          }
        }

        public struct Stat: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["ProfileStats"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("totalFollowers", type: .nonNull(.scalar(Int.self))),
              GraphQLField("totalFollowing", type: .nonNull(.scalar(Int.self))),
              GraphQLField("totalPosts", type: .nonNull(.scalar(Int.self))),
              GraphQLField("totalComments", type: .nonNull(.scalar(Int.self))),
              GraphQLField("totalMirrors", type: .nonNull(.scalar(Int.self))),
              GraphQLField("totalPublications", type: .nonNull(.scalar(Int.self))),
              GraphQLField("totalCollects", type: .nonNull(.scalar(Int.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(totalFollowers: Int, totalFollowing: Int, totalPosts: Int, totalComments: Int, totalMirrors: Int, totalPublications: Int, totalCollects: Int) {
            self.init(unsafeResultMap: ["__typename": "ProfileStats", "totalFollowers": totalFollowers, "totalFollowing": totalFollowing, "totalPosts": totalPosts, "totalComments": totalComments, "totalMirrors": totalMirrors, "totalPublications": totalPublications, "totalCollects": totalCollects])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Total follower count
          public var totalFollowers: Int {
            get {
              return resultMap["totalFollowers"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalFollowers")
            }
          }

          /// Total following count (remember the wallet follows not profile so will be same for every profile they own)
          public var totalFollowing: Int {
            get {
              return resultMap["totalFollowing"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalFollowing")
            }
          }

          /// Total post count
          public var totalPosts: Int {
            get {
              return resultMap["totalPosts"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalPosts")
            }
          }

          /// Total comment count
          public var totalComments: Int {
            get {
              return resultMap["totalComments"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalComments")
            }
          }

          /// Total mirror count
          public var totalMirrors: Int {
            get {
              return resultMap["totalMirrors"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalMirrors")
            }
          }

          /// Total publication count
          public var totalPublications: Int {
            get {
              return resultMap["totalPublications"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalPublications")
            }
          }

          /// Total collects count
          public var totalCollects: Int {
            get {
              return resultMap["totalCollects"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "totalCollects")
            }
          }
        }

        public struct FollowModule: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["FeeFollowModuleSettings"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("type", type: .nonNull(.scalar(FollowModules.self))),
              GraphQLField("amount", type: .nonNull(.object(Amount.selections))),
              GraphQLField("recipient", type: .nonNull(.scalar(String.self))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(type: FollowModules, amount: Amount, recipient: String) {
            self.init(unsafeResultMap: ["__typename": "FeeFollowModuleSettings", "type": type, "amount": amount.resultMap, "recipient": recipient])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// The follow modules enum
          public var type: FollowModules {
            get {
              return resultMap["type"]! as! FollowModules
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          /// The collect module amount info
          public var amount: Amount {
            get {
              return Amount(unsafeResultMap: resultMap["amount"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "amount")
            }
          }

          /// The collect module recipient address
          public var recipient: String {
            get {
              return resultMap["recipient"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "recipient")
            }
          }

          public struct Amount: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["ModuleFeeAmount"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("asset", type: .nonNull(.object(Asset.selections))),
                GraphQLField("value", type: .nonNull(.scalar(String.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(asset: Asset, value: String) {
              self.init(unsafeResultMap: ["__typename": "ModuleFeeAmount", "asset": asset.resultMap, "value": value])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            /// The erc20 token info
            public var asset: Asset {
              get {
                return Asset(unsafeResultMap: resultMap["asset"]! as! ResultMap)
              }
              set {
                resultMap.updateValue(newValue.resultMap, forKey: "asset")
              }
            }

            /// Floating point number as string (e.g. 42.009837). It could have the entire precision of the Asset or be truncated to the last significant decimal.
            public var value: String {
              get {
                return resultMap["value"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "value")
              }
            }

            public struct Asset: GraphQLSelectionSet {
              public static let possibleTypes: [String] = ["Erc20"]

              public static var selections: [GraphQLSelection] {
                return [
                  GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                  GraphQLField("symbol", type: .nonNull(.scalar(String.self))),
                  GraphQLField("name", type: .nonNull(.scalar(String.self))),
                  GraphQLField("decimals", type: .nonNull(.scalar(Int.self))),
                  GraphQLField("address", type: .nonNull(.scalar(String.self))),
                ]
              }

              public private(set) var resultMap: ResultMap

              public init(unsafeResultMap: ResultMap) {
                self.resultMap = unsafeResultMap
              }

              public init(symbol: String, name: String, decimals: Int, address: String) {
                self.init(unsafeResultMap: ["__typename": "Erc20", "symbol": symbol, "name": name, "decimals": decimals, "address": address])
              }

              public var __typename: String {
                get {
                  return resultMap["__typename"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "__typename")
                }
              }

              /// Symbol for the token
              public var symbol: String {
                get {
                  return resultMap["symbol"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "symbol")
                }
              }

              /// Name of the symbol
              public var name: String {
                get {
                  return resultMap["name"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "name")
                }
              }

              /// Decimal places for the token
              public var decimals: Int {
                get {
                  return resultMap["decimals"]! as! Int
                }
                set {
                  resultMap.updateValue(newValue, forKey: "decimals")
                }
              }

              /// The erc20 address
              public var address: String {
                get {
                  return resultMap["address"]! as! String
                }
                set {
                  resultMap.updateValue(newValue, forKey: "address")
                }
              }
            }
          }
        }
      }

      public struct PageInfo: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["PaginatedResultInfo"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("prev", type: .scalar(String.self)),
            GraphQLField("next", type: .scalar(String.self)),
            GraphQLField("totalCount", type: .nonNull(.scalar(Int.self))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(prev: String? = nil, next: String? = nil, totalCount: Int) {
          self.init(unsafeResultMap: ["__typename": "PaginatedResultInfo", "prev": prev, "next": next, "totalCount": totalCount])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Cursor to query the actual results
        public var prev: String? {
          get {
            return resultMap["prev"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "prev")
          }
        }

        /// Cursor to query next results
        public var next: String? {
          get {
            return resultMap["next"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }

        /// The total number of entities the pagination iterates over. e.g. For a query that requests all nfts with more than 10 likes, this field gives the total amount of nfts with more than 10 likes, not the total amount of nfts
        public var totalCount: Int {
          get {
            return resultMap["totalCount"]! as! Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "totalCount")
          }
        }
      }
    }
  }
}

public final class HasTxHashBeenIndexedQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query HasTxHashBeenIndexed($request: HasTxHashBeenIndexedRequest!) {
      hasTxHashBeenIndexed(request: $request) {
        __typename
        ... on TransactionIndexedResult {
          __typename
          indexed
          txReceipt {
            __typename
            to
            from
            contractAddress
            transactionIndex
            root
            gasUsed
            logsBloom
            blockHash
            transactionHash
            blockNumber
            confirmations
            cumulativeGasUsed
            effectiveGasPrice
            byzantium
            type
            status
            logs {
              __typename
              blockNumber
              blockHash
              transactionIndex
              removed
              address
              data
              topics
              transactionHash
              logIndex
            }
          }
          metadataStatus {
            __typename
            status
            reason
          }
        }
        ... on TransactionError {
          __typename
          reason
          txReceipt {
            __typename
            to
            from
            contractAddress
            transactionIndex
            root
            gasUsed
            logsBloom
            blockHash
            transactionHash
            blockNumber
            confirmations
            cumulativeGasUsed
            effectiveGasPrice
            byzantium
            type
            status
            logs {
              __typename
              blockNumber
              blockHash
              transactionIndex
              removed
              address
              data
              topics
              transactionHash
              logIndex
            }
          }
        }
      }
    }
    """

  public let operationName: String = "HasTxHashBeenIndexed"

  public var request: HasTxHashBeenIndexedRequest

  public init(request: HasTxHashBeenIndexedRequest) {
    self.request = request
  }

  public var variables: GraphQLMap? {
    return ["request": request]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("hasTxHashBeenIndexed", arguments: ["request": GraphQLVariable("request")], type: .nonNull(.object(HasTxHashBeenIndexed.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(hasTxHashBeenIndexed: HasTxHashBeenIndexed) {
      self.init(unsafeResultMap: ["__typename": "Query", "hasTxHashBeenIndexed": hasTxHashBeenIndexed.resultMap])
    }

    public var hasTxHashBeenIndexed: HasTxHashBeenIndexed {
      get {
        return HasTxHashBeenIndexed(unsafeResultMap: resultMap["hasTxHashBeenIndexed"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "hasTxHashBeenIndexed")
      }
    }

    public struct HasTxHashBeenIndexed: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TransactionIndexedResult", "TransactionError"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLTypeCase(
            variants: ["TransactionIndexedResult": AsTransactionIndexedResult.selections, "TransactionError": AsTransactionError.selections],
            default: [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            ]
          )
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeTransactionIndexedResult(indexed: Bool, txReceipt: AsTransactionIndexedResult.TxReceipt? = nil, metadataStatus: AsTransactionIndexedResult.MetadataStatus? = nil) -> HasTxHashBeenIndexed {
        return HasTxHashBeenIndexed(unsafeResultMap: ["__typename": "TransactionIndexedResult", "indexed": indexed, "txReceipt": txReceipt.flatMap { (value: AsTransactionIndexedResult.TxReceipt) -> ResultMap in value.resultMap }, "metadataStatus": metadataStatus.flatMap { (value: AsTransactionIndexedResult.MetadataStatus) -> ResultMap in value.resultMap }])
      }

      public static func makeTransactionError(reason: TransactionErrorReasons, txReceipt: AsTransactionError.TxReceipt? = nil) -> HasTxHashBeenIndexed {
        return HasTxHashBeenIndexed(unsafeResultMap: ["__typename": "TransactionError", "reason": reason, "txReceipt": txReceipt.flatMap { (value: AsTransactionError.TxReceipt) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var asTransactionIndexedResult: AsTransactionIndexedResult? {
        get {
          if !AsTransactionIndexedResult.possibleTypes.contains(__typename) { return nil }
          return AsTransactionIndexedResult(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsTransactionIndexedResult: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TransactionIndexedResult"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("indexed", type: .nonNull(.scalar(Bool.self))),
            GraphQLField("txReceipt", type: .object(TxReceipt.selections)),
            GraphQLField("metadataStatus", type: .object(MetadataStatus.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(indexed: Bool, txReceipt: TxReceipt? = nil, metadataStatus: MetadataStatus? = nil) {
          self.init(unsafeResultMap: ["__typename": "TransactionIndexedResult", "indexed": indexed, "txReceipt": txReceipt.flatMap { (value: TxReceipt) -> ResultMap in value.resultMap }, "metadataStatus": metadataStatus.flatMap { (value: MetadataStatus) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var indexed: Bool {
          get {
            return resultMap["indexed"]! as! Bool
          }
          set {
            resultMap.updateValue(newValue, forKey: "indexed")
          }
        }

        public var txReceipt: TxReceipt? {
          get {
            return (resultMap["txReceipt"] as? ResultMap).flatMap { TxReceipt(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "txReceipt")
          }
        }

        /// Publications can be indexed but the ipfs link for example not findable for x time. This allows you to work that out for publications. If its not a publication tx then it always be null.
        public var metadataStatus: MetadataStatus? {
          get {
            return (resultMap["metadataStatus"] as? ResultMap).flatMap { MetadataStatus(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "metadataStatus")
          }
        }

        public struct TxReceipt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TransactionReceipt"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("to", type: .scalar(String.self)),
              GraphQLField("from", type: .nonNull(.scalar(String.self))),
              GraphQLField("contractAddress", type: .scalar(String.self)),
              GraphQLField("transactionIndex", type: .nonNull(.scalar(Int.self))),
              GraphQLField("root", type: .scalar(String.self)),
              GraphQLField("gasUsed", type: .nonNull(.scalar(String.self))),
              GraphQLField("logsBloom", type: .nonNull(.scalar(String.self))),
              GraphQLField("blockHash", type: .nonNull(.scalar(String.self))),
              GraphQLField("transactionHash", type: .nonNull(.scalar(String.self))),
              GraphQLField("blockNumber", type: .nonNull(.scalar(Int.self))),
              GraphQLField("confirmations", type: .nonNull(.scalar(Int.self))),
              GraphQLField("cumulativeGasUsed", type: .nonNull(.scalar(String.self))),
              GraphQLField("effectiveGasPrice", type: .nonNull(.scalar(String.self))),
              GraphQLField("byzantium", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("type", type: .nonNull(.scalar(Int.self))),
              GraphQLField("status", type: .nonNull(.scalar(Int.self))),
              GraphQLField("logs", type: .nonNull(.list(.nonNull(.object(Log.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(to: String? = nil, from: String, contractAddress: String? = nil, transactionIndex: Int, root: String? = nil, gasUsed: String, logsBloom: String, blockHash: String, transactionHash: String, blockNumber: Int, confirmations: Int, cumulativeGasUsed: String, effectiveGasPrice: String, byzantium: Bool, type: Int, status: Int, logs: [Log]) {
            self.init(unsafeResultMap: ["__typename": "TransactionReceipt", "to": to, "from": from, "contractAddress": contractAddress, "transactionIndex": transactionIndex, "root": root, "gasUsed": gasUsed, "logsBloom": logsBloom, "blockHash": blockHash, "transactionHash": transactionHash, "blockNumber": blockNumber, "confirmations": confirmations, "cumulativeGasUsed": cumulativeGasUsed, "effectiveGasPrice": effectiveGasPrice, "byzantium": byzantium, "type": type, "status": status, "logs": logs.map { (value: Log) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var to: String? {
            get {
              return resultMap["to"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "to")
            }
          }

          public var from: String {
            get {
              return resultMap["from"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "from")
            }
          }

          public var contractAddress: String? {
            get {
              return resultMap["contractAddress"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "contractAddress")
            }
          }

          public var transactionIndex: Int {
            get {
              return resultMap["transactionIndex"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "transactionIndex")
            }
          }

          public var root: String? {
            get {
              return resultMap["root"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "root")
            }
          }

          public var gasUsed: String {
            get {
              return resultMap["gasUsed"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "gasUsed")
            }
          }

          public var logsBloom: String {
            get {
              return resultMap["logsBloom"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "logsBloom")
            }
          }

          public var blockHash: String {
            get {
              return resultMap["blockHash"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "blockHash")
            }
          }

          public var transactionHash: String {
            get {
              return resultMap["transactionHash"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "transactionHash")
            }
          }

          public var blockNumber: Int {
            get {
              return resultMap["blockNumber"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "blockNumber")
            }
          }

          public var confirmations: Int {
            get {
              return resultMap["confirmations"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "confirmations")
            }
          }

          public var cumulativeGasUsed: String {
            get {
              return resultMap["cumulativeGasUsed"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cumulativeGasUsed")
            }
          }

          public var effectiveGasPrice: String {
            get {
              return resultMap["effectiveGasPrice"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "effectiveGasPrice")
            }
          }

          public var byzantium: Bool {
            get {
              return resultMap["byzantium"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "byzantium")
            }
          }

          public var type: Int {
            get {
              return resultMap["type"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var status: Int {
            get {
              return resultMap["status"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var logs: [Log] {
            get {
              return (resultMap["logs"] as! [ResultMap]).map { (value: ResultMap) -> Log in Log(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Log) -> ResultMap in value.resultMap }, forKey: "logs")
            }
          }

          public struct Log: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Log"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("blockNumber", type: .nonNull(.scalar(Int.self))),
                GraphQLField("blockHash", type: .nonNull(.scalar(String.self))),
                GraphQLField("transactionIndex", type: .nonNull(.scalar(Int.self))),
                GraphQLField("removed", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("address", type: .nonNull(.scalar(String.self))),
                GraphQLField("data", type: .nonNull(.scalar(String.self))),
                GraphQLField("topics", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
                GraphQLField("transactionHash", type: .nonNull(.scalar(String.self))),
                GraphQLField("logIndex", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(blockNumber: Int, blockHash: String, transactionIndex: Int, removed: Bool, address: String, data: String, topics: [String], transactionHash: String, logIndex: Int) {
              self.init(unsafeResultMap: ["__typename": "Log", "blockNumber": blockNumber, "blockHash": blockHash, "transactionIndex": transactionIndex, "removed": removed, "address": address, "data": data, "topics": topics, "transactionHash": transactionHash, "logIndex": logIndex])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var blockNumber: Int {
              get {
                return resultMap["blockNumber"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "blockNumber")
              }
            }

            public var blockHash: String {
              get {
                return resultMap["blockHash"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "blockHash")
              }
            }

            public var transactionIndex: Int {
              get {
                return resultMap["transactionIndex"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "transactionIndex")
              }
            }

            public var removed: Bool {
              get {
                return resultMap["removed"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "removed")
              }
            }

            public var address: String {
              get {
                return resultMap["address"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "address")
              }
            }

            public var data: String {
              get {
                return resultMap["data"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "data")
              }
            }

            public var topics: [String] {
              get {
                return resultMap["topics"]! as! [String]
              }
              set {
                resultMap.updateValue(newValue, forKey: "topics")
              }
            }

            public var transactionHash: String {
              get {
                return resultMap["transactionHash"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "transactionHash")
              }
            }

            public var logIndex: Int {
              get {
                return resultMap["logIndex"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "logIndex")
              }
            }
          }
        }

        public struct MetadataStatus: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["PublicationMetadataStatus"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("status", type: .nonNull(.scalar(PublicationMetadataStatusType.self))),
              GraphQLField("reason", type: .scalar(String.self)),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(status: PublicationMetadataStatusType, reason: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "PublicationMetadataStatus", "status": status, "reason": reason])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var status: PublicationMetadataStatusType {
            get {
              return resultMap["status"]! as! PublicationMetadataStatusType
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          /// If metadata validation failed it will put a reason why here
          public var reason: String? {
            get {
              return resultMap["reason"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "reason")
            }
          }
        }
      }

      public var asTransactionError: AsTransactionError? {
        get {
          if !AsTransactionError.possibleTypes.contains(__typename) { return nil }
          return AsTransactionError(unsafeResultMap: resultMap)
        }
        set {
          guard let newValue = newValue else { return }
          resultMap = newValue.resultMap
        }
      }

      public struct AsTransactionError: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TransactionError"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("reason", type: .nonNull(.scalar(TransactionErrorReasons.self))),
            GraphQLField("txReceipt", type: .object(TxReceipt.selections)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(reason: TransactionErrorReasons, txReceipt: TxReceipt? = nil) {
          self.init(unsafeResultMap: ["__typename": "TransactionError", "reason": reason, "txReceipt": txReceipt.flatMap { (value: TxReceipt) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var reason: TransactionErrorReasons {
          get {
            return resultMap["reason"]! as! TransactionErrorReasons
          }
          set {
            resultMap.updateValue(newValue, forKey: "reason")
          }
        }

        public var txReceipt: TxReceipt? {
          get {
            return (resultMap["txReceipt"] as? ResultMap).flatMap { TxReceipt(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "txReceipt")
          }
        }

        public struct TxReceipt: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TransactionReceipt"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("to", type: .scalar(String.self)),
              GraphQLField("from", type: .nonNull(.scalar(String.self))),
              GraphQLField("contractAddress", type: .scalar(String.self)),
              GraphQLField("transactionIndex", type: .nonNull(.scalar(Int.self))),
              GraphQLField("root", type: .scalar(String.self)),
              GraphQLField("gasUsed", type: .nonNull(.scalar(String.self))),
              GraphQLField("logsBloom", type: .nonNull(.scalar(String.self))),
              GraphQLField("blockHash", type: .nonNull(.scalar(String.self))),
              GraphQLField("transactionHash", type: .nonNull(.scalar(String.self))),
              GraphQLField("blockNumber", type: .nonNull(.scalar(Int.self))),
              GraphQLField("confirmations", type: .nonNull(.scalar(Int.self))),
              GraphQLField("cumulativeGasUsed", type: .nonNull(.scalar(String.self))),
              GraphQLField("effectiveGasPrice", type: .nonNull(.scalar(String.self))),
              GraphQLField("byzantium", type: .nonNull(.scalar(Bool.self))),
              GraphQLField("type", type: .nonNull(.scalar(Int.self))),
              GraphQLField("status", type: .nonNull(.scalar(Int.self))),
              GraphQLField("logs", type: .nonNull(.list(.nonNull(.object(Log.selections))))),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(to: String? = nil, from: String, contractAddress: String? = nil, transactionIndex: Int, root: String? = nil, gasUsed: String, logsBloom: String, blockHash: String, transactionHash: String, blockNumber: Int, confirmations: Int, cumulativeGasUsed: String, effectiveGasPrice: String, byzantium: Bool, type: Int, status: Int, logs: [Log]) {
            self.init(unsafeResultMap: ["__typename": "TransactionReceipt", "to": to, "from": from, "contractAddress": contractAddress, "transactionIndex": transactionIndex, "root": root, "gasUsed": gasUsed, "logsBloom": logsBloom, "blockHash": blockHash, "transactionHash": transactionHash, "blockNumber": blockNumber, "confirmations": confirmations, "cumulativeGasUsed": cumulativeGasUsed, "effectiveGasPrice": effectiveGasPrice, "byzantium": byzantium, "type": type, "status": status, "logs": logs.map { (value: Log) -> ResultMap in value.resultMap }])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var to: String? {
            get {
              return resultMap["to"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "to")
            }
          }

          public var from: String {
            get {
              return resultMap["from"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "from")
            }
          }

          public var contractAddress: String? {
            get {
              return resultMap["contractAddress"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "contractAddress")
            }
          }

          public var transactionIndex: Int {
            get {
              return resultMap["transactionIndex"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "transactionIndex")
            }
          }

          public var root: String? {
            get {
              return resultMap["root"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "root")
            }
          }

          public var gasUsed: String {
            get {
              return resultMap["gasUsed"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "gasUsed")
            }
          }

          public var logsBloom: String {
            get {
              return resultMap["logsBloom"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "logsBloom")
            }
          }

          public var blockHash: String {
            get {
              return resultMap["blockHash"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "blockHash")
            }
          }

          public var transactionHash: String {
            get {
              return resultMap["transactionHash"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "transactionHash")
            }
          }

          public var blockNumber: Int {
            get {
              return resultMap["blockNumber"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "blockNumber")
            }
          }

          public var confirmations: Int {
            get {
              return resultMap["confirmations"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "confirmations")
            }
          }

          public var cumulativeGasUsed: String {
            get {
              return resultMap["cumulativeGasUsed"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "cumulativeGasUsed")
            }
          }

          public var effectiveGasPrice: String {
            get {
              return resultMap["effectiveGasPrice"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "effectiveGasPrice")
            }
          }

          public var byzantium: Bool {
            get {
              return resultMap["byzantium"]! as! Bool
            }
            set {
              resultMap.updateValue(newValue, forKey: "byzantium")
            }
          }

          public var type: Int {
            get {
              return resultMap["type"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "type")
            }
          }

          public var status: Int {
            get {
              return resultMap["status"]! as! Int
            }
            set {
              resultMap.updateValue(newValue, forKey: "status")
            }
          }

          public var logs: [Log] {
            get {
              return (resultMap["logs"] as! [ResultMap]).map { (value: ResultMap) -> Log in Log(unsafeResultMap: value) }
            }
            set {
              resultMap.updateValue(newValue.map { (value: Log) -> ResultMap in value.resultMap }, forKey: "logs")
            }
          }

          public struct Log: GraphQLSelectionSet {
            public static let possibleTypes: [String] = ["Log"]

            public static var selections: [GraphQLSelection] {
              return [
                GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
                GraphQLField("blockNumber", type: .nonNull(.scalar(Int.self))),
                GraphQLField("blockHash", type: .nonNull(.scalar(String.self))),
                GraphQLField("transactionIndex", type: .nonNull(.scalar(Int.self))),
                GraphQLField("removed", type: .nonNull(.scalar(Bool.self))),
                GraphQLField("address", type: .nonNull(.scalar(String.self))),
                GraphQLField("data", type: .nonNull(.scalar(String.self))),
                GraphQLField("topics", type: .nonNull(.list(.nonNull(.scalar(String.self))))),
                GraphQLField("transactionHash", type: .nonNull(.scalar(String.self))),
                GraphQLField("logIndex", type: .nonNull(.scalar(Int.self))),
              ]
            }

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(blockNumber: Int, blockHash: String, transactionIndex: Int, removed: Bool, address: String, data: String, topics: [String], transactionHash: String, logIndex: Int) {
              self.init(unsafeResultMap: ["__typename": "Log", "blockNumber": blockNumber, "blockHash": blockHash, "transactionIndex": transactionIndex, "removed": removed, "address": address, "data": data, "topics": topics, "transactionHash": transactionHash, "logIndex": logIndex])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var blockNumber: Int {
              get {
                return resultMap["blockNumber"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "blockNumber")
              }
            }

            public var blockHash: String {
              get {
                return resultMap["blockHash"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "blockHash")
              }
            }

            public var transactionIndex: Int {
              get {
                return resultMap["transactionIndex"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "transactionIndex")
              }
            }

            public var removed: Bool {
              get {
                return resultMap["removed"]! as! Bool
              }
              set {
                resultMap.updateValue(newValue, forKey: "removed")
              }
            }

            public var address: String {
              get {
                return resultMap["address"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "address")
              }
            }

            public var data: String {
              get {
                return resultMap["data"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "data")
              }
            }

            public var topics: [String] {
              get {
                return resultMap["topics"]! as! [String]
              }
              set {
                resultMap.updateValue(newValue, forKey: "topics")
              }
            }

            public var transactionHash: String {
              get {
                return resultMap["transactionHash"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "transactionHash")
              }
            }

            public var logIndex: Int {
              get {
                return resultMap["logIndex"]! as! Int
              }
              set {
                resultMap.updateValue(newValue, forKey: "logIndex")
              }
            }
          }
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
