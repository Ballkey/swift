//
//  ViewModel.swift
//  Training
//
//  Created by Balakrishnan on 16/04/24.
//

import Foundation
import UIKit
import CoreData

protocol Viewable {
    func createUser()
    func fetchUser()
//    func setView(view: ViewControllerDelegate?)
    var view: ViewControllerDelegate? { get set }
}

extension Viewable {
    func createUser() {
        
    }
}

class ViewModel: Viewable {
    
    private let releaseDetailsService = ReleaseDetailsService()
    
    weak var view: ViewControllerDelegate?
    
    func createUser() {
        if let view = view {
            
        }
        
        guard let view = view else {
            return
        }
        
        Task {
            let userResult = await releaseDetailsService.createUser("Bala", job: "dev")
            if case .success(let user) = userResult {
                DispatchQueue.main.async {
                    self.view?.reloadTableView()
                }
            }
            if case .failure(let failure) = userResult {
                DispatchQueue.main.async {
                    self.view?.showError()
                }
            }
            
        }
    }
    
    func fetchUser() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentCloudKitContainer.viewContext
        let request = NSFetchRequest<User>(entityName: "User")
        
        do {
            let users = try context.fetch(request)
            print(users.count)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    private func addTwoValues(value1: Int?, value2: Int?) {
        guard let value1 = value1, let value2 = value2 else {
            return
        }
    }
    
//    private func processValues(completion: @escaping (String, String) -> String) {
//        print("function called")
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
//            let result = completion("value1", "value2")
//            print(result)
//        })
//        "1989".toDate()
//    }
}
