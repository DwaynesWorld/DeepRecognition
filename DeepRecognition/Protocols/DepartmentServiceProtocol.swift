//
//  DepartmentServiceProtocol.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/13/20.
//  Copyright © 2020 Kylesz Thompson. All rights reserved.
//

import Foundation

protocol DepartmentServiceProtocol {
    func getDepartmentMembers(_ id: Int, handler: @escaping (_ result: (data: PagedResult<DepartmentMember>?, error: RequestError?) ) -> Void)
    func getDepartments(handler: @escaping (_ result: (data: PagedResult<Department>?, error: RequestError?)) -> Void)
}
