//
//  UserService.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/12/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Alamofire

class UserService: UserServiceProtocol {
    func getUser(
        fromId id: Int,
        handler: @escaping ((data: UserProfile?, error: RequestError?)) -> Void) {
        
        let client = Apollo.shared.client
        
        client.fetch(query: GetUserByIdQuery(id: id)) { response in
            switch response {
            case .success(let result):
                if let p = result.data?.profile {
                    let profile = UserProfile(
                        id: p.pk,
                        email: p.user.email,
                        firstName: p.firstName,
                        lastName: p.lastName,
                        reportsTo: p.reportsTo?.pk,
                        activationState: p.activationState,
                        isManager: p.isManager,
                        profileImageUrl: p.profileImageUrl,
                        position: p.position,
                        phoneNumber: p.phoneNumber,
                        hireDate: p.hireDate)
                    
                    handler((profile, nil))
                } else if let errors = result.errors {
                    handler((nil, RequestError.unexpectedResponse(error: "\(errors)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
    }
    
    func getUser(
        fromEmail email: String,
        handler: @escaping ((data: UserProfile?, error: RequestError?)) -> Void) {
        
        let client = Apollo.shared.client
        
        client.fetch(query: GetUserByEmailQuery(email: email)) { response in
            switch response {
            case .success(let result):
                do {
                    let profiles = try result.data?.profiles?.edges.map { try self.mapProfiles(from: $0) }
                    handler((profiles!.first!, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
        
    }
    
    func getUsers(
        fromSearch search: String = "",
        handler: @escaping ((data: [UserProfile]?, error: RequestError?)) -> Void) {
        
        let client = Apollo.shared.client

        client.fetch(query: GetUsersQuery(search: search)) { response in
            switch response {
            case .success(let result):
                do {
                    let profiles = try result.data?.profiles?.edges.map { try self.mapProfiles(from: $0) }
                    handler((profiles, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
    }
    
    
    private func mapProfiles(from edge: GetUserByEmailQuery.Data.Profile.Edge?) throws -> UserProfile {
        guard let n = edge?.node else {
            throw RequestError.unexpectedResponse(error: "invalid nodes")
        }
        
        return UserProfile(
            id: n.pk,
            email: n.user.email,
            firstName: n.firstName,
            lastName: n.lastName,
            reportsTo: n.reportsTo?.pk,
            activationState: n.activationState,
            isManager: n.isManager,
            profileImageUrl: n.profileImageUrl,
            position: n.position,
            phoneNumber: n.phoneNumber,
            hireDate: n.hireDate)
    }
    
    private func mapProfiles(from edge: GetUsersQuery.Data.Profile.Edge?) throws -> UserProfile {
        guard let n = edge?.node else {
            throw RequestError.unexpectedResponse(error: "invalid nodes")
        }
        
        return UserProfile(
            id: n.pk,
            email: n.user.email,
            firstName: n.firstName,
            lastName: n.lastName,
            reportsTo: n.reportsTo?.pk,
            activationState: n.activationState,
            isManager: n.isManager,
            profileImageUrl: n.profileImageUrl,
            position: n.position,
            phoneNumber: n.phoneNumber,
            hireDate: n.hireDate)
    }
}
