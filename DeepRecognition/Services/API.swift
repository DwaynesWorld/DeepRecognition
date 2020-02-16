// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetTeamByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetTeamById($pk: Int!) {
      team(pk: $pk) {
        __typename
        ...teamFields
      }
    }
    """

  public let operationName: String = "GetTeamById"

  public var queryDocument: String { return operationDefinition.appending(TeamFields.fragmentDefinition) }

  public var pk: Int

  public init(pk: Int) {
    self.pk = pk
  }

  public var variables: GraphQLMap? {
    return ["pk": pk]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("team", arguments: ["pk": GraphQLVariable("pk")], type: .object(Team.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(team: Team? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "team": team.flatMap { (value: Team) -> ResultMap in value.resultMap }])
    }

    /// The primary key of the object
    public var team: Team? {
      get {
        return (resultMap["team"] as? ResultMap).flatMap { Team(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "team")
      }
    }

    public struct Team: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TeamNode"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(TeamFields.self),
      ]

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

        public var teamFields: TeamFields {
          get {
            return TeamFields(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetTeamsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetTeams {
      teams(hasParent: false, orderBy: "name") {
        __typename
        edges {
          __typename
          node {
            __typename
            ...teamFields
          }
        }
      }
    }
    """

  public let operationName: String = "GetTeams"

  public var queryDocument: String { return operationDefinition.appending(TeamFields.fragmentDefinition) }

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("teams", arguments: ["hasParent": false, "orderBy": "name"], type: .object(Team.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(teams: Team? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "teams": teams.flatMap { (value: Team) -> ResultMap in value.resultMap }])
    }

    public var teams: Team? {
      get {
        return (resultMap["teams"] as? ResultMap).flatMap { Team(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "teams")
      }
    }

    public struct Team: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TeamNodeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "TeamNodeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TeamNodeEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "TeamNodeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TeamNode"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(TeamFields.self),
          ]

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

            public var teamFields: TeamFields {
              get {
                return TeamFields(unsafeResultMap: resultMap)
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

public final class GetChildTeamsQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetChildTeams($parent: Float!) {
      teams(parent: $parent, orderBy: "name") {
        __typename
        edges {
          __typename
          node {
            __typename
            ...teamFields
          }
        }
      }
    }
    """

  public let operationName: String = "GetChildTeams"

  public var queryDocument: String { return operationDefinition.appending(TeamFields.fragmentDefinition) }

  public var parent: Double

  public init(parent: Double) {
    self.parent = parent
  }

  public var variables: GraphQLMap? {
    return ["parent": parent]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("teams", arguments: ["parent": GraphQLVariable("parent"), "orderBy": "name"], type: .object(Team.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(teams: Team? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "teams": teams.flatMap { (value: Team) -> ResultMap in value.resultMap }])
    }

    public var teams: Team? {
      get {
        return (resultMap["teams"] as? ResultMap).flatMap { Team(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "teams")
      }
    }

    public struct Team: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["TeamNodeConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "TeamNodeConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["TeamNodeEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "TeamNodeEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["TeamNode"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(TeamFields.self),
          ]

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

            public var teamFields: TeamFields {
              get {
                return TeamFields(unsafeResultMap: resultMap)
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

public final class GetUserByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserById($id: Int!) {
      profile(pk: $id) {
        __typename
        ...userProfileFields
      }
    }
    """

  public let operationName: String = "GetUserById"

  public var queryDocument: String { return operationDefinition.appending(UserProfileFields.fragmentDefinition) }

  public var id: Int

  public init(id: Int) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("profile", arguments: ["pk": GraphQLVariable("id")], type: .object(Profile.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profile: Profile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "profile": profile.flatMap { (value: Profile) -> ResultMap in value.resultMap }])
    }

    /// The primary key of the object
    public var profile: Profile? {
      get {
        return (resultMap["profile"] as? ResultMap).flatMap { Profile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profile")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserProfileNode"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLFragmentSpread(UserProfileFields.self),
      ]

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

        public var userProfileFields: UserProfileFields {
          get {
            return UserProfileFields(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }
      }
    }
  }
}

public final class GetUserByEmailQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUserByEmail($email: String!) {
      profiles(user_Email: $email) {
        __typename
        edges {
          __typename
          node {
            __typename
            ...userProfileFields
          }
        }
      }
    }
    """

  public let operationName: String = "GetUserByEmail"

  public var queryDocument: String { return operationDefinition.appending(UserProfileFields.fragmentDefinition) }

  public var email: String

  public init(email: String) {
    self.email = email
  }

  public var variables: GraphQLMap? {
    return ["email": email]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("profiles", arguments: ["user_Email": GraphQLVariable("email")], type: .object(Profile.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profiles: Profile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "profiles": profiles.flatMap { (value: Profile) -> ResultMap in value.resultMap }])
    }

    public var profiles: Profile? {
      get {
        return (resultMap["profiles"] as? ResultMap).flatMap { Profile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profiles")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserProfileConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "UserProfileConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserProfileEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserProfileEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserProfileNode"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserProfileFields.self),
          ]

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

            public var userProfileFields: UserProfileFields {
              get {
                return UserProfileFields(unsafeResultMap: resultMap)
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

public final class GetUsersQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query GetUsers($search: String) {
      profiles(search: $search) {
        __typename
        edges {
          __typename
          node {
            __typename
            ...userProfileFields
          }
        }
      }
    }
    """

  public let operationName: String = "GetUsers"

  public var queryDocument: String { return operationDefinition.appending(UserProfileFields.fragmentDefinition) }

  public var search: String?

  public init(search: String? = nil) {
    self.search = search
  }

  public var variables: GraphQLMap? {
    return ["search": search]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("profiles", arguments: ["search": GraphQLVariable("search")], type: .object(Profile.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(profiles: Profile? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "profiles": profiles.flatMap { (value: Profile) -> ResultMap in value.resultMap }])
    }

    public var profiles: Profile? {
      get {
        return (resultMap["profiles"] as? ResultMap).flatMap { Profile(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "profiles")
      }
    }

    public struct Profile: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["UserProfileConnection"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("edges", type: .nonNull(.list(.object(Edge.selections)))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(edges: [Edge?]) {
        self.init(unsafeResultMap: ["__typename": "UserProfileConnection", "edges": edges.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var edges: [Edge?] {
        get {
          return (resultMap["edges"] as! [ResultMap?]).map { (value: ResultMap?) -> Edge? in value.flatMap { (value: ResultMap) -> Edge in Edge(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Edge?) -> ResultMap? in value.flatMap { (value: Edge) -> ResultMap in value.resultMap } }, forKey: "edges")
        }
      }

      public struct Edge: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["UserProfileEdge"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("node", type: .object(Node.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(node: Node? = nil) {
          self.init(unsafeResultMap: ["__typename": "UserProfileEdge", "node": node.flatMap { (value: Node) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The item at the end of the edge
        public var node: Node? {
          get {
            return (resultMap["node"] as? ResultMap).flatMap { Node(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "node")
          }
        }

        public struct Node: GraphQLSelectionSet {
          public static let possibleTypes: [String] = ["UserProfileNode"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLFragmentSpread(UserProfileFields.self),
          ]

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

            public var userProfileFields: UserProfileFields {
              get {
                return UserProfileFields(unsafeResultMap: resultMap)
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

public struct TeamFields: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment teamFields on TeamNode {
      __typename
      pk
      parent {
        __typename
        pk
      }
      fullName
      name
      allMembers {
        __typename
        totalCount
      }
    }
    """

  public static let possibleTypes: [String] = ["TeamNode"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("pk", type: .scalar(Int.self)),
    GraphQLField("parent", type: .object(Parent.selections)),
    GraphQLField("fullName", type: .scalar(String.self)),
    GraphQLField("name", type: .nonNull(.scalar(String.self))),
    GraphQLField("allMembers", type: .object(AllMember.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(pk: Int? = nil, parent: Parent? = nil, fullName: String? = nil, name: String, allMembers: AllMember? = nil) {
    self.init(unsafeResultMap: ["__typename": "TeamNode", "pk": pk, "parent": parent.flatMap { (value: Parent) -> ResultMap in value.resultMap }, "fullName": fullName, "name": name, "allMembers": allMembers.flatMap { (value: AllMember) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var pk: Int? {
    get {
      return resultMap["pk"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "pk")
    }
  }

  /// The parent department of this department.
  public var parent: Parent? {
    get {
      return (resultMap["parent"] as? ResultMap).flatMap { Parent(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "parent")
    }
  }

  /// The full name of the department including the hierarchy of all parent departments.
  public var fullName: String? {
    get {
      return resultMap["fullName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "fullName")
    }
  }

  /// The name of the department.
  public var name: String {
    get {
      return resultMap["name"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "name")
    }
  }

  /// All members of this department, including sub-departments
  public var allMembers: AllMember? {
    get {
      return (resultMap["allMembers"] as? ResultMap).flatMap { AllMember(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "allMembers")
    }
  }

  public struct Parent: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["TeamNode"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("pk", type: .scalar(Int.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pk: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "TeamNode", "pk": pk])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var pk: Int? {
      get {
        return resultMap["pk"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "pk")
      }
    }
  }

  public struct AllMember: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["UserProfileConnection"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("totalCount", type: .scalar(Int.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(totalCount: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "UserProfileConnection", "totalCount": totalCount])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var totalCount: Int? {
      get {
        return resultMap["totalCount"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "totalCount")
      }
    }
  }
}

public struct UserProfileFields: GraphQLFragment {
  /// The raw GraphQL definition of this fragment.
  public static let fragmentDefinition: String =
    """
    fragment userProfileFields on UserProfileNode {
      __typename
      pk
      user {
        __typename
        email
      }
      firstName
      lastName
      reportsTo {
        __typename
        pk
      }
      profileImageUrl
      activationState
      isManager
      position
      phoneNumber
      hireDate
    }
    """

  public static let possibleTypes: [String] = ["UserProfileNode"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("pk", type: .scalar(Int.self)),
    GraphQLField("user", type: .nonNull(.object(User.selections))),
    GraphQLField("firstName", type: .scalar(String.self)),
    GraphQLField("lastName", type: .scalar(String.self)),
    GraphQLField("reportsTo", type: .object(ReportsTo.selections)),
    GraphQLField("profileImageUrl", type: .scalar(String.self)),
    GraphQLField("activationState", type: .scalar(String.self)),
    GraphQLField("isManager", type: .nonNull(.scalar(Bool.self))),
    GraphQLField("position", type: .scalar(String.self)),
    GraphQLField("phoneNumber", type: .scalar(String.self)),
    GraphQLField("hireDate", type: .scalar(String.self)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(pk: Int? = nil, user: User, firstName: String? = nil, lastName: String? = nil, reportsTo: ReportsTo? = nil, profileImageUrl: String? = nil, activationState: String? = nil, isManager: Bool, position: String? = nil, phoneNumber: String? = nil, hireDate: String? = nil) {
    self.init(unsafeResultMap: ["__typename": "UserProfileNode", "pk": pk, "user": user.resultMap, "firstName": firstName, "lastName": lastName, "reportsTo": reportsTo.flatMap { (value: ReportsTo) -> ResultMap in value.resultMap }, "profileImageUrl": profileImageUrl, "activationState": activationState, "isManager": isManager, "position": position, "phoneNumber": phoneNumber, "hireDate": hireDate])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var pk: Int? {
    get {
      return resultMap["pk"] as? Int
    }
    set {
      resultMap.updateValue(newValue, forKey: "pk")
    }
  }

  public var user: User {
    get {
      return User(unsafeResultMap: resultMap["user"]! as! ResultMap)
    }
    set {
      resultMap.updateValue(newValue.resultMap, forKey: "user")
    }
  }

  public var firstName: String? {
    get {
      return resultMap["firstName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "firstName")
    }
  }

  public var lastName: String? {
    get {
      return resultMap["lastName"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "lastName")
    }
  }

  public var reportsTo: ReportsTo? {
    get {
      return (resultMap["reportsTo"] as? ResultMap).flatMap { ReportsTo(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "reportsTo")
    }
  }

  public var profileImageUrl: String? {
    get {
      return resultMap["profileImageUrl"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "profileImageUrl")
    }
  }

  public var activationState: String? {
    get {
      return resultMap["activationState"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "activationState")
    }
  }

  /// Determines if the user is a manager in the network. A user is a manager if
  /// they have someone reporting to them. This field is automatically set.
  public var isManager: Bool {
    get {
      return resultMap["isManager"]! as! Bool
    }
    set {
      resultMap.updateValue(newValue, forKey: "isManager")
    }
  }

  /// The users role within the organization.
  public var position: String? {
    get {
      return resultMap["position"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "position")
    }
  }

  /// A phone number where people within the organization can reach the user.
  public var phoneNumber: String? {
    get {
      return resultMap["phoneNumber"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "phoneNumber")
    }
  }

  /// The date the user started working at their company
  public var hireDate: String? {
    get {
      return resultMap["hireDate"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "hireDate")
    }
  }

  public struct User: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["UserNode"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("email", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(email: String) {
      self.init(unsafeResultMap: ["__typename": "UserNode", "email": email])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var email: String {
      get {
        return resultMap["email"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "email")
      }
    }
  }

  public struct ReportsTo: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["UserProfileNode"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("pk", type: .scalar(Int.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(pk: Int? = nil) {
      self.init(unsafeResultMap: ["__typename": "UserProfileNode", "pk": pk])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var pk: Int? {
      get {
        return resultMap["pk"] as? Int
      }
      set {
        resultMap.updateValue(newValue, forKey: "pk")
      }
    }
  }
}
