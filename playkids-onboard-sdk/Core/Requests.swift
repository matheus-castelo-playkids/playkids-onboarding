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
        
    open func requestMain(requestURL: String){
        Alamofire.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success(let JSON):
                print("Success Requesting Main:")
                print(JSON)
            case .failure(let error):
                print("Failed with error: \(error)")
            }
        }
    }
    
    open func requestContent(requestURL: String) {
        Alamofire.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success(let JSON):
                print("Success Requesting Content:")
                print(JSON)
            case .failure(let error):
                print("Failed with error: \(error)")
            }
        }
    }
}
