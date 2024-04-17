//
//  ViewController.swift
//  Training
//
//  Created by Balakrishnan on 03/04/24.
//

import UIKit
import CoreData

protocol ViewControllerDelegate: AnyObject {
    func reloadTableView()
    func showError()
}

class ViewController: UIViewController {

    let value = Int()
    var stringValue = ""
    var stringValue1: String? = "value"
    let floatValue: Float = 10.0
    let doubleValue: Double = 11.0
    
    var arrayValue = Array<String>()//[String]()
    var emptyArray: Array<String>?
    var dictionaryValue: [String: Int] = [:]
    
    var viewModel: Viewable = ViewModel()
    
    override func viewDidLoad() {
        viewModel.view = self
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        viewModel.createUser()
    }
//
}

extension ViewController: ViewControllerDelegate {
    func reloadTableView() {
        print("reloadTableView")
    }
    
    func showError() {
        print("showError")
    }
}
