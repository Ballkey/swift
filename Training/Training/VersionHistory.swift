//
//  VersionHistory.swift
//  Training
//
//  Created by Balakrishnan on 04/04/24.
//

import Foundation

struct VersionHistory: Decodable {
    let supportPortal: String
    let email: String
    let sms: String
    let phone: String
    let termsAndConditions: String
    let versions: [VersionDetail]
}

struct VersionDetail: Decodable {
    let version: String
    let releaseDate: String
    let title: String
    let moreInfo: String
}

struct UserId: Decodable {
    let id: String
}
