//
//  Apollo.swift
//  DeepRecognition
//
//  Created by Kyle Thompson on 2/15/20.
//  Copyright © 2020 Kyle Thompson. All rights reserved.
//

import Foundation
import Apollo

class Apollo {
    static let shared = Apollo()

    private lazy var networkTransport: HTTPNetworkTransport = {
        let transport = HTTPNetworkTransport(url: URL(string: "\(AppSettings.baseUrl)/graphql")!)
        transport.delegate = self
        return transport
    }()

    private(set) lazy var client = ApolloClient(networkTransport: self.networkTransport)
}

extension Apollo: HTTPNetworkTransportPreflightDelegate {
    
    func networkTransport(_ networkTransport: HTTPNetworkTransport, shouldSend request: URLRequest) -> Bool {
        return Session.shared.current != nil
    }

    func networkTransport(_ networkTransport: HTTPNetworkTransport, willSend request: inout URLRequest) {
        guard let token = Session.shared.current?.accessToken else { return }

        var headers = request.allHTTPHeaderFields ?? [String: String]()
        headers["Authorization"] = "Bearer \(token)"
        request.allHTTPHeaderFields = headers
    }
}


extension Apollo: HTTPNetworkTransportRetryDelegate {

    func networkTransport(
        _ networkTransport: HTTPNetworkTransport,
        receivedError error: Error,
        for request: URLRequest,
        response: URLResponse?,
        retryHandler: @escaping (_ shouldRetry: Bool) -> Void) {

        print(error)
        print(response ?? "No response.")

        retryHandler(false)
    }
}
