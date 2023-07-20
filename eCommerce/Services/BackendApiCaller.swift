//
//  BackendApiCaller.swift
//  eCommerce
//
//  Created by Imen Ksouri on 13/07/2023.
//

import Foundation
import Alamofire

struct BackendApi {
    static let root = "https://sphenoid-funny-echo.glitch.me/"
    var endpoint: Endpoint
    var method: HTTPMethod = .post
    var parameters: Encodable
    var url: URL? {
        URL(string: BackendApi.root + endpoint.rawValue)
    }
    var request: URLRequest? {
        guard let url else { return nil }
        var request = URLRequest(url: url)
        request.method = method
        request.headers.add(.contentType("application/json"))
        do {
            request.httpBody = try JSONEncoder().encode(parameters)
            return request
        } catch {
            print(error.localizedDescription)
            return nil
        }
    }

    enum Method: String {
        case GET, POST
    }
    enum Endpoint: String {
        case customers, checkout
    }
}

struct BackendApiCaller {
    static var shared = BackendApiCaller()
}

extension BackendApiCaller {
    func load<T: Decodable>(api: BackendApi, response type: T.Type) async throws -> T? {
        guard let request = api.request else { return nil }
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(request)
                .validate()
                .responseDecodable(of: T.self) { response in
                    if let data = response.value {
                        continuation.resume(returning: data)
                    }
                    if let error = response.error {
                        continuation.resume(throwing: error)
                        return
                    }
                }
        }
    }
}
