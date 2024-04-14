//
//  ReleaseDetailsService.swift
//  Training
//
//  Created by Balakrishnan on 05/04/24.
//

import Foundation

class ReleaseDetailsService {
    let urlSessionHelper = URLSessionHelper()
    func getReleaseDetails() async -> Result<VersionHistory, Error> {
        let url = URL(string: "https://install.plexus.cloud/releases.json")
        return await urlSessionHelper.data(from: url)
    }
    
    func getAllValues() async -> Result<[UserId], Error> {
        let url = URL(string: "https://demo2938485.mockable.io/array")
        return await urlSessionHelper.data(from: url)
    }
    
    func createUser(_ userName: String, job: String) async -> Result<User, Error> {
        let url = URL(string: "https://demo2938485.mockable.io/user")
        let request = UserRequest(name: userName, job: job, id: nil, createdAt: nil)
        return await urlSessionHelper.postTask(from: url, httpMethod: .post, requestBody: request)
    }
}

struct UserRequest: Encodable {
    let name: String
    let job: String
    let id: String?
    let createdAt: String?
}
