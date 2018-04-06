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
    
    let p = Parser()
    
    open func requestMain(requestURL: String){
        Alamofire.request(requestURL).responseJSON{ response in
            switch response.result {
            case .success(let JSON):
                print("Success Requesting Main:")
                //print(JSON)
                self.p.parseMain(Data: JSON)
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
                //print(JSON)
                self.p.parseContent(Data: JSON)
            case .failure(let error):
                print("Failed with error: \(error)")
            }
        }
    }
}
