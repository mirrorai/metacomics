// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class CreateConferenceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateConference($name: String!, $city: String!, $year: String!) {
      createConference(name: $name, city: $city, year: $year) {
        __typename
        ...ConferenceDetails
      }
    }
    """

  public let operationName: String = "CreateConference"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ConferenceDetails.fragmentDefinition)
    return document
  }

  public var name: String
  public var city: String
  public var year: String

  public init(name: String, city: String, year: String) {
    self.name = name
    self.city = city
    self.year = year
  }

  public var variables: GraphQLMap? {
    return ["name": name, "city": city, "year": year]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createConference", arguments: ["name": GraphQLVariable("name"), "city": GraphQLVariable("city"), "year": GraphQLVariable("year")], type: .object(CreateConference.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createConference: CreateConference? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createConference": createConference.flatMap { (value: CreateConference) -> ResultMap in value.resultMap }])
    }

    public var createConference: CreateConference? {
      get {
        return (resultMap["createConference"] as? ResultMap).flatMap { CreateConference(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createConference")
      }
    }

    public struct CreateConference: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Conference"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ConferenceDetails.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var conferenceDetails: ConferenceDetails {
          get {
            return ConferenceDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class ConferenceDetailsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query ConferenceDetails($id: ID!) {
      conference: Conference(id: $id) {
        __typename
        ...ConferenceDetails
      }
    }
    """

  public let operationName: String = "ConferenceDetails"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ConferenceDetails.fragmentDefinition)
    return document
  }

  public var id: GraphQLID

  public init(id: GraphQLID) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Conference", alias: "conference", arguments: ["id": GraphQLVariable("id")], type: .object(Conference.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(conference: Conference? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "conference": conference.flatMap { (value: Conference) -> ResultMap in value.resultMap }])
    }

    public var conference: Conference? {
      get {
        return (resultMap["conference"] as? ResultMap).flatMap { Conference(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "conference")
      }
    }

    public struct Conference: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Conference"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ConferenceDetails.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var conferenceDetails: ConferenceDetails {
          get {
            return ConferenceDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class AttendeesForConferenceQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AttendeesForConference($conferenceId: ID!) {
      conference: Conference(id: $conferenceId) {
        __typename
        id
        attendees {
          __typename
          ...AttendeeDetails
        }
      }
    }
    """

  public let operationName: String = "AttendeesForConference"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AttendeeDetails.fragmentDefinition)
    return document
  }

  public var conferenceId: GraphQLID

  public init(conferenceId: GraphQLID) {
    self.conferenceId = conferenceId
  }

  public var variables: GraphQLMap? {
    return ["conferenceId": conferenceId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("Conference", alias: "conference", arguments: ["id": GraphQLVariable("conferenceId")], type: .object(Conference.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(conference: Conference? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "conference": conference.flatMap { (value: Conference) -> ResultMap in value.resultMap }])
    }

    public var conference: Conference? {
      get {
        return (resultMap["conference"] as? ResultMap).flatMap { Conference(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "conference")
      }
    }

    public struct Conference: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Conference"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("attendees", type: .list(.nonNull(.object(Attendee.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, attendees: [Attendee]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "attendees": attendees.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var attendees: [Attendee]? {
        get {
          return (resultMap["attendees"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Attendee] in value.map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }, forKey: "attendees")
        }
      }

      public struct Attendee: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Attendee"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(AttendeeDetails.self),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var attendeeDetails: AttendeeDetails {
            get {
              return AttendeeDetails(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }
      }
    }
  }
}

public final class AttendConferenceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation AttendConference($conferenceId: ID!, $attendeeId: ID!) {
      addToAttendees(
        conferencesConferenceId: $conferenceId
        attendeesAttendeeId: $attendeeId
      ) {
        __typename
        conferencesConference {
          __typename
          id
          attendees {
            __typename
            ...AttendeeDetails
          }
        }
      }
    }
    """

  public let operationName: String = "AttendConference"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AttendeeDetails.fragmentDefinition)
    return document
  }

  public var conferenceId: GraphQLID
  public var attendeeId: GraphQLID

  public init(conferenceId: GraphQLID, attendeeId: GraphQLID) {
    self.conferenceId = conferenceId
    self.attendeeId = attendeeId
  }

  public var variables: GraphQLMap? {
    return ["conferenceId": conferenceId, "attendeeId": attendeeId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("addToAttendees", arguments: ["conferencesConferenceId": GraphQLVariable("conferenceId"), "attendeesAttendeeId": GraphQLVariable("attendeeId")], type: .object(AddToAttendee.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(addToAttendees: AddToAttendee? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "addToAttendees": addToAttendees.flatMap { (value: AddToAttendee) -> ResultMap in value.resultMap }])
    }

    public var addToAttendees: AddToAttendee? {
      get {
        return (resultMap["addToAttendees"] as? ResultMap).flatMap { AddToAttendee(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "addToAttendees")
      }
    }

    public struct AddToAttendee: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["AddToAttendeesPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conferencesConference", type: .object(ConferencesConference.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(conferencesConference: ConferencesConference? = nil) {
        self.init(unsafeResultMap: ["__typename": "AddToAttendeesPayload", "conferencesConference": conferencesConference.flatMap { (value: ConferencesConference) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var conferencesConference: ConferencesConference? {
        get {
          return (resultMap["conferencesConference"] as? ResultMap).flatMap { ConferencesConference(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "conferencesConference")
        }
      }

      public struct ConferencesConference: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Conference"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("attendees", type: .list(.nonNull(.object(Attendee.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, attendees: [Attendee]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "attendees": attendees.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var attendees: [Attendee]? {
          get {
            return (resultMap["attendees"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Attendee] in value.map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }, forKey: "attendees")
          }
        }

        public struct Attendee: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Attendee"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(AttendeeDetails.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var attendeeDetails: AttendeeDetails {
              get {
                return AttendeeDetails(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class NotAttendConferenceMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation NotAttendConference($conferenceId: ID!, $attendeeId: ID!) {
      removeFromAttendees(
        conferencesConferenceId: $conferenceId
        attendeesAttendeeId: $attendeeId
      ) {
        __typename
        conferencesConference {
          __typename
          id
          attendees {
            __typename
            ...AttendeeDetails
          }
        }
      }
    }
    """

  public let operationName: String = "NotAttendConference"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + AttendeeDetails.fragmentDefinition)
    return document
  }

  public var conferenceId: GraphQLID
  public var attendeeId: GraphQLID

  public init(conferenceId: GraphQLID, attendeeId: GraphQLID) {
    self.conferenceId = conferenceId
    self.attendeeId = attendeeId
  }

  public var variables: GraphQLMap? {
    return ["conferenceId": conferenceId, "attendeeId": attendeeId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("removeFromAttendees", arguments: ["conferencesConferenceId": GraphQLVariable("conferenceId"), "attendeesAttendeeId": GraphQLVariable("attendeeId")], type: .object(RemoveFromAttendee.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(removeFromAttendees: RemoveFromAttendee? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "removeFromAttendees": removeFromAttendees.flatMap { (value: RemoveFromAttendee) -> ResultMap in value.resultMap }])
    }

    public var removeFromAttendees: RemoveFromAttendee? {
      get {
        return (resultMap["removeFromAttendees"] as? ResultMap).flatMap { RemoveFromAttendee(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "removeFromAttendees")
      }
    }

    public struct RemoveFromAttendee: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["RemoveFromAttendeesPayload"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("conferencesConference", type: .object(ConferencesConference.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(conferencesConference: ConferencesConference? = nil) {
        self.init(unsafeResultMap: ["__typename": "RemoveFromAttendeesPayload", "conferencesConference": conferencesConference.flatMap { (value: ConferencesConference) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var conferencesConference: ConferencesConference? {
        get {
          return (resultMap["conferencesConference"] as? ResultMap).flatMap { ConferencesConference(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "conferencesConference")
        }
      }

      public struct ConferencesConference: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Conference"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("attendees", type: .list(.nonNull(.object(Attendee.selections)))),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, attendees: [Attendee]? = nil) {
          self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "attendees": attendees.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var attendees: [Attendee]? {
          get {
            return (resultMap["attendees"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Attendee] in value.map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }, forKey: "attendees")
          }
        }

        public struct Attendee: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["Attendee"]

          public static var selections: [GraphQLSelection] {
            return [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLFragmentSpread(AttendeeDetails.self),
            ]
          }

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var fragments: Fragments {
            get {
              return Fragments(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }

          public struct Fragments {
            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public var attendeeDetails: AttendeeDetails {
              get {
                return AttendeeDetails(unsafeResultMap: resultMap)
              }
              set {
                resultMap += newValue.resultMap
              }
            }
          }
        }
      }
    }
  }
}

public final class AllConferencesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query AllConferences {
      allConferences {
        __typename
        ...ConferenceDetails
      }
    }
    """

  public let operationName: String = "AllConferences"

  public var queryDocument: String {
    var document: String = operationDefinition
    document.append("\n" + ConferenceDetails.fragmentDefinition)
    return document
  }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("allConferences", type: .nonNull(.list(.nonNull(.object(AllConference.selections))))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(allConferences: [AllConference]) {
      self.init(unsafeResultMap: ["__typename": "Query", "allConferences": allConferences.map { (value: AllConference) -> ResultMap in value.resultMap }])
    }

    public var allConferences: [AllConference] {
      get {
        return (resultMap["allConferences"] as! [ResultMap]).map { (value: ResultMap) -> AllConference in AllConference(unsafeResultMap: value) }
      }
      set {
        resultMap.updateValue(newValue.map { (value: AllConference) -> ResultMap in value.resultMap }, forKey: "allConferences")
      }
    }

    public struct AllConference: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Conference"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLFragmentSpread(ConferenceDetails.self),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var fragments: Fragments {
        get {
          return Fragments(unsafeResultMap: resultMap)
        }
        set {
          resultMap += newValue.resultMap
        }
      }

      public struct Fragments {
        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public var conferenceDetails: ConferenceDetails {
          get {
            return ConferenceDetails(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class CreateAttendeeMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation CreateAttendee($name: String!) {
      createAttendee(name: $name) {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "CreateAttendee"

  public var name: String

  public init(name: String) {
    self.name = name
  }

  public var variables: GraphQLMap? {
    return ["name": name]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("createAttendee", arguments: ["name": GraphQLVariable("name")], type: .object(CreateAttendee.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(createAttendee: CreateAttendee? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "createAttendee": createAttendee.flatMap { (value: CreateAttendee) -> ResultMap in value.resultMap }])
    }

    public var createAttendee: CreateAttendee? {
      get {
        return (resultMap["createAttendee"] as? ResultMap).flatMap { CreateAttendee(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "createAttendee")
      }
    }

    public struct CreateAttendee: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Attendee"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Attendee", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public final class UpdateAttendeeNameMutation: GraphQLMutation {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    mutation UpdateAttendeeName($id: ID!, $newName: String!) {
      updateAttendee(id: $id, name: $newName) {
        __typename
        id
        name
      }
    }
    """

  public let operationName: String = "UpdateAttendeeName"

  public var id: GraphQLID
  public var newName: String

  public init(id: GraphQLID, newName: String) {
    self.id = id
    self.newName = newName
  }

  public var variables: GraphQLMap? {
    return ["id": id, "newName": newName]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Mutation"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("updateAttendee", arguments: ["id": GraphQLVariable("id"), "name": GraphQLVariable("newName")], type: .object(UpdateAttendee.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(updateAttendee: UpdateAttendee? = nil) {
      self.init(unsafeResultMap: ["__typename": "Mutation", "updateAttendee": updateAttendee.flatMap { (value: UpdateAttendee) -> ResultMap in value.resultMap }])
    }

    public var updateAttendee: UpdateAttendee? {
      get {
        return (resultMap["updateAttendee"] as? ResultMap).flatMap { UpdateAttendee(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "updateAttendee")
      }
    }

    public struct UpdateAttendee: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Attendee"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, name: String) {
        self.init(unsafeResultMap: ["__typename": "Attendee", "id": id, "name": name])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }
    }
  }
}

public struct AttendeeDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment AttendeeDetails on Attendee {
      __typename
      id
      name
      _conferencesMeta {
        __typename
        count
      }
    }
    """

  public static let possibleTypes: [String] = ["Attendee"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("_conferencesMeta", type: .nonNull(.object(_ConferencesMetum.selections))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, _conferencesMeta: _ConferencesMetum) {
    self.init(unsafeResultMap: ["__typename": "Attendee", "id": id, "name": name, "_conferencesMeta": _conferencesMeta.resultMap])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// Meta information about the query.
  public var _conferencesMeta: _ConferencesMetum {
    get {
      return _ConferencesMetum(unsafeResultMap: resultMap["_conferencesMeta"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "_conferencesMeta")
    }
  }

  public struct _ConferencesMetum: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["_QueryMeta"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("count", type: .nonNull(.scalar(Int.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(count: Int) {
      self.init(unsafeResultMap: ["__typename": "_QueryMeta", "count": count])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var count: Int {
      get {
        return resultMap["count"]! as! Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "count")
      }
    }
  }
}

public struct ConferenceDetails: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment ConferenceDetails on Conference {
      __typename
      id
      name
      city
      year
      attendees {
        __typename
        id
      }
    }
    """

  public static let possibleTypes: [String] = ["Conference"]

  public static var selections: [GraphQLSelection] {
    return [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
      GraphQLField("city", type: .nonNull(.scalar(String.self))),
      GraphQLField("year", type: .nonNull(.scalar(String.self))),
      GraphQLField("attendees", type: .list(.nonNull(.object(Attendee.selections)))),
    ]
  }

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, name: String, city: String, year: String, attendees: [Attendee]? = nil) {
    self.init(unsafeResultMap: ["__typename": "Conference", "id": id, "name": name, "city": city, "year": year, "attendees": attendees.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  public var city: String {
    get {
      return resultMap["city"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "city")
    }
  }

  public var year: String {
    get {
      return resultMap["year"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "year")
    }
  }

  public var attendees: [Attendee]? {
    get {
      return (resultMap["attendees"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Attendee] in value.map { (value: ResultMap) -> Attendee in Attendee(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Attendee]) -> [ResultMap] in value.map { (value: Attendee) -> ResultMap in value.resultMap } }, forKey: "attendees")
    }
  }

  public struct Attendee: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Attendee"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID) {
      self.init(unsafeResultMap: ["__typename": "Attendee", "id": id])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }
  }
}
