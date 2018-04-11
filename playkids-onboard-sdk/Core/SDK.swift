//
//  SDK.swift
//  playkids-onboard-sdk
//
//  Created by Matheus Castelo on 05/04/18.
//  Copyright © 2018 Matheus Castelo. All rights reserved.
//

import Foundation

public final class SDK {
    public static func startSDK() {

        //Making requests
        let s = Requests()
        
        let requestMainURL = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/main.json"
        let requestContentURL = "https://s3.amazonaws.com/dev.bojack.pkds.it/pk4/r4v1/br/content.json"
        
        let CTmain: String = "Main"
        s.request(requestURL: requestMainURL, contentType: CTmain) { (completion : Any) in
//            print (completion)
            let answerMain = completion
            
            parse(Data: answerMain, ContentType: CTmain)
        }
        
        let CTContent: String = "Content"
        
        s.request(requestURL: requestContentURL, contentType: CTContent) { (completion : Any) in
//            print (completion)
            let answerContent = completion
            
            parse(Data: answerContent, ContentType: CTContent)
        }
    }
    
    public static func parse(Data: Any, ContentType: String) {
        
        let p = Parser()
        
//        print("Resposta:\(Data)")
        print ("Requested parsing for \(ContentType)")
        p.parse(Data: Data, ContentType: ContentType)
    }
}
