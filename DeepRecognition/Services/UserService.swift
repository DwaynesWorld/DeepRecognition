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
                    let profile = try! self.mapProfiles(from: p.fragments.userProfileFields)
                    
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
                    let profiles = try result.data?.profiles?.edges.map {
                        try self.mapProfiles(from: $0?.node?.fragments.userProfileFields)
                    }
                    
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
                    let profiles = try result.data?.profiles?.edges.map {
                        try self.mapProfiles(from: $0?.node?.fragments.userProfileFields)
                    }
                    
                    handler((profiles, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: "\(error)")))
            }
        }
    }
    
    
    private func mapProfiles(from fields: UserProfileFields?) throws -> UserProfile {
        guard let f = fields else {
            throw RequestError.unexpectedResponse(error: "invalid fields")
        }
        
        return UserProfile(
            id: f.pk,
            email: f.user.email,
            firstName: f.firstName,
            lastName: f.lastName,
            reportsTo: f.reportsTo?.pk,
            activationState: f.activationState,
            isManager: f.isManager,
            profileImageUrl: f.profileImageUrl,
            position: f.position,
            phoneNumber: f.phoneNumber,
            hireDate: f.hireDate)
    }
}
