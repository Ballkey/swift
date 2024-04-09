//
//  URLSessionHelper.swift
//  Training
//
//  Created by Balakrishnan on 04/04/24.
//

import Foundation

enum HttpMethod: String {
    case get = "GET"
    case post = "POST"
    case delete = "DELETE"
    case put = "PUT"
}

enum ServiceError: Error {
    case invalidUrl
}

class URLSessionHelper {
    
    func data<U>(from url: URL?, httpMethod: HttpMethod? = .get) async -> Result<U, Error> where U : Decodable {
        if let url = url {
            var urlRequest = URLRequest(url: url)
            urlRequest.httpMethod = httpMethod?.rawValue
            do {
                let result = try await URLSession.shared.data(for: urlRequest)
                let data = result.0
                let versionHistory = try JSONDecoder().decode(U.self, from: data)
                return .success(versionHistory)
            } catch let error {
                return .failure(error)
            }
        }
        return .failure(ServiceError.invalidUrl)
    }
    
    func postTask<U, V>(from url: URL?, httpMethod: HttpMethod? = .get, requestBody: V) async -> Result<U, Error> where U : Decodable, V: Encodable {
        if let url = url {
            var urlRequest = URLRequest(url: url)
            do {
                urlRequest.httpBody = try JSONEncoder().encode(requestBody)
            } catch let error {
                return .failure(error)
            }
            
            urlRequest.httpMethod = httpMethod?.rawValue
            do {
                let result = try await URLSession.shared.data(for: urlRequest)
                let data = result.0
                let versionHistory = try JSONDecoder().decode(U.self, from: data)
                return .success(versionHistory)
            } catch let error {
                return .failure(error)
            }
        }
        return .failure(ServiceError.invalidUrl)
    }
}
