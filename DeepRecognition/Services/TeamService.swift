//
//  TeamService.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/15/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

class TeamService: TeamServiceProtocol {
    func getTeams(handler: @escaping ((data: [Team]?, error: RequestError?)) -> Void) {
        let client = Apollo.shared.client

        client.fetch(query: GetTeamsQuery()) { response in
            switch response {
            case .success(let result):
                do {
                    let teams = try result.data?.teams?.edges.map { try self.mapTeams(from: $0) }
                    handler((teams, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
    }
    
    func mapTeams(from edge: GetTeamsQuery.Data.Team.Edge?) throws -> Team {
        guard let n = edge?.node else {
            throw RequestError.unexpectedResponse(error: "invalid nodes")
        }
        
        return Team(
            id: n.pk,
            parentId: n.parent?.pk,
            fullName: n.fullName,
            name: n.name,
            employeeCount: n.allMembers?.totalCount ?? 0)
    }
}
