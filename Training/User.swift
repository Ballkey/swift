//
//  User.swift
//  Training
//
//  Created by Balakrishnan on 09/04/24.
//

import Foundation
import CoreData
import UIKit

//struct User: Codable {
//    let name: String
//    let job: String
//    let id: String?
//    let createdAt: String?
//}
//

class User: NSManagedObject, Decodable {
    
    enum CodingKeys: CodingKey {
        case name, job, id
    }
    
    required convenience init(from decoder: Decoder) throws {
        
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate, let entityDescription = NSEntityDescription.entity(forEntityName: "User", in: appDelegate.persistentCloudKitContainer.viewContext) else {
            throw NSError()
        }
        self.init(context: appDelegate.persistentCloudKitContainer.viewContext)
        self.id = try container.decode(Int16.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.job = try container.decode(Bool.self, forKey: .job)
    }
}
