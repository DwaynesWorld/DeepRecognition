//
//  TeamService.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Alamofire

class DepartmentService: DepartmentServiceProtocol {
    
    func getDepartmentMembers(_ id: Int, handler: @escaping ((data: PagedResult<DepartmentMember>?, error: RequestError?)) -> Void) {
        guard let token = Session.shared.current?.accessToken else {
            handler((nil, RequestError.invalidSession))
            return
        }
        
        let url = "\(AppSettings.baseUrl)/api/v2/teammember/?team=\(id)"
        let headers: HTTPHeaders = [ .authorization(bearerToken: token)]

        AF.request(url, method: .get, headers: headers).response { response in
            switch (response.result) {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(PagedResult<DepartmentMember>.self, from: data!)
                    handler((result, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: error.failureReason ?? "An unexpected error has occurred.")))
            }
        }
    }
    
    func getDepartments(handler: @escaping ((data: PagedResult<Department>?, error: RequestError?)) -> Void) {
        guard let token = Session.shared.current?.accessToken else {
            handler((nil, RequestError.invalidSession))
            return
        }
        
        let url = "\(AppSettings.baseUrl)/api/v/2.0/departments/"
        let headers: HTTPHeaders = [ .authorization(bearerToken: token) ]

        AF.request(url, method: .get, headers: headers).response { response in
            print(response)
            switch (response.result) {
            case .success(let data):
                do {
                    let result = try JSONDecoder().decode(PagedResult<Department>.self, from: data!)
                    handler((result, nil))
                } catch {
                    handler((nil, RequestError.unexpectedResponse(error: "\(error)")))
                }
            case .failure(let error):
                handler((nil, RequestError.invalidRequest(error: error.failureReason ?? "An unexpected error has occurred.")))
            }
        }
    }
}
