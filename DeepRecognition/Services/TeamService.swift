//
//  TeamService.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/15/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation

class TeamService: TeamServiceProtocol {
    func getTeam(from id: Int, handler: @escaping ((data: Team?, error: RequestError?)) -> Void) {
        let client = Apollo.shared.client

        client.fetch(query: GetTeamByIdQuery(pk: id)) { response in
            switch response {
            case .success(let result):
                if let t = result.data?.team {
                    let team = try! self.mapTeams(from: t.fragments.teamFields)
                    handler((team, nil))
                } else if let errors = result.errors {
                    handler((nil, RequestError.unexpectedResponse(error: "\(errors)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
    }
    
    func getTeams(handler: @escaping ((data: [Team]?, error: RequestError?)) -> Void) {
        let client = Apollo.shared.client

        client.fetch(query: GetTeamsQuery()) { response in
            switch response {
            case .success(let result):
                do {
                    let teams = try result.data?.teams?.edges.map {
                        try self.mapTeams(from: $0?.node?.fragments.teamFields)
                    }
                    
                    handler((teams, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
    }
    
    func mapTeams(from fields: TeamFields?) throws -> Team {
        guard let f = fields else {
            throw RequestError.unexpectedResponse(error: "invalid fields")
        }
        
        return Team(
            id: f.pk,
            parentId: f.parent?.pk,
            fullName: f.fullName,
            name: f.name,
            employeeCount: f.allMembers?.totalCount ?? 0)
    }
}
