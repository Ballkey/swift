//
//  ViewController.swift
//  Training
//
//  Created by Balakrishnan on 03/04/24.
//

import UIKit

class ViewController: UIViewController {

    let value = Int()
    var stringValue = ""
    var stringValue1: String? = "value"
    let floatValue: Float = 10.0
    let doubleValue: Double = 11.0
    
    var arrayValue = Array<String>()//[String]()
    var emptyArray: Array<String>?
    var dictionaryValue: [String: Int] = [:]
    let urlSessionHelper = URLSessionHelper()
    override func viewDidLoad() {
        super.viewDidLoad()
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        let value1 = "Some value"
        stringValue = "\(value1) value2 \(value1)"
        stringValue.replacingOccurrences(of: "Some", with: "Some More")
        stringValue1 = "Value"
//        if let wrappedValue = stringValue1 {
//            print(wrappedValue)
//        } else {
//            print("default value")
//        }
        print(stringValue1 ?? "default value")
        
        dictionaryValue = ["key": 100, "key1": 200]
        dictionaryValue["key"] = 100
        if stringValue == "Some Value" {
            
        }
        
        arrayValue.contains { value in
            return value == "value"
        }
        
        arrayValue = ["Value1", "Value2"]
        arrayValue.append("Value3")
//        arrayValue.append(0)
        arrayValue.insert("Value0", at: 0)
        arrayValue.remove(at: 0)
        let zerothValue = arrayValue[0]
        // Do any additional setup after loading the view.
        
        processValues { value1, value2 in
            return value1 + value2
        }
        
        let releaseDetailsService = ReleaseDetailsService()
        Task {
            let result = await releaseDetailsService.getAllValues()
            if case .success(let releaseDetails) = result {
                print(releaseDetails.count)
            }
//            switch result {
//            case .success(let response):
//                //handle response
//                break
//            case .failure(let error):
//                //handle error
//                break
//            }
            DispatchQueue.main.async {
                // update UI
            }

        }
        
        Task {
            let userResult = await releaseDetailsService.createUser("Bala", job: "dev")
            if case .success(let user) = userResult {
                print(user.id)
            }
            if case .failure(let failure) = userResult {
                print(failure.localizedDescription)
            }
        }
    }


    func addTwoValues(value1: Int?, value2: Int?) {
        guard let value1 = value1, let value2 = value2 else {
            return
        }
    }
    
//    func nameOfTheFunction(value1: String, value2: String) -> String {
//        
//    }

    func processValues(completion: @escaping (String, String) -> String) {
        print("function called")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            let result = completion("value1", "value2")
            print(result)
        })
        
    }
//

}

