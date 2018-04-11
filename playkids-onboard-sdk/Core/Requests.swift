//
//  Requests.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 05/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import UIKit
import Alamofire

internal class Requests {
    
    open func request(requestURL: String, contentType: String, completion: @escaping (Any?) -> Void) {

        Alamofire.request(requestURL).responseJSON { response in
            switch response.result {
            case .success(let JSON):
                print("Success Requesting \(contentType):")
//                print(JSON)
                completion(JSON)
            case .failure(let error):
                let errorMessage: String = "Failed with error: \(error)"
                completion(errorMessage)
            }
        }
    }
}
